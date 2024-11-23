<?php
require 'vendor/autoload.php';

use Faker\Factory as Faker;

try {
    $pdo = new PDO('mysql:host=localhost;dbname=projet_sql2', 'root', '');
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    
    $faker = Faker::create('fr_FR'); 

    for ($i = 0; $i < 10; $i++) {
        $name = $faker->name;
        $email = $faker->email;
        $phone = $faker->phoneNumber;

        $stmt = $pdo->prepare("INSERT INTO user (name, email, phone) VALUES (:name, :email, :phone)");
        $stmt->execute([':name' => $name, ':email' => $email, ':phone' => $phone]);
        $userId = $pdo->lastInsertId();

        $stmt = $pdo->prepare("INSERT INTO address (user_id, street, city, state, postal_code, country) VALUES (:user_id, :street, :city, :state, :postal_code, :country)");
        $stmt->execute([
            ':user_id' => $userId,
            ':street' => $faker->streetAddress,
            ':city' => $faker->city,
            ':state' => $faker->region,
            ':postal_code' => $faker->postcode,
            ':country' => $faker->country
        ]);

        $stmt = $pdo->prepare("INSERT INTO cart (user_id, created_at) VALUES (:user_id, NOW())");
        $stmt->execute([':user_id' => $userId]);
        $cartId = $pdo->lastInsertId();

        for ($j = 0; $j < rand(1, 3); $j++) {
            $productId = rand(1, 10); 
            $quantity = rand(1, 5);

            $stmt = $pdo->prepare("INSERT INTO cart_items (cart_id, product_id, quantity) VALUES (:cart_id, :product_id, :quantity)");
            $stmt->execute([':cart_id' => $cartId, ':product_id' => $productId, ':quantity' => $quantity]);
        }

        $statusOptions = ['pending', 'shipped', 'delivered'];
        $status = $statusOptions[array_rand($statusOptions)];
        $stmt = $pdo->prepare("INSERT INTO command (cart_id, address_id, created_at, status) VALUES (:cart_id, :address_id, NOW(), :status)");
        $stmt->execute([':cart_id' => $cartId, ':address_id' => $userId, ':status' => $status]);
        $commandId = $pdo->lastInsertId();

        $stmt = $pdo->prepare("SELECT SUM(price * quantity) AS total_amount FROM cart_items ci JOIN product p ON ci.product_id = p.product_id WHERE ci.cart_id = :cart_id");
        $stmt->execute([':cart_id' => $cartId]);
        $totalAmount = $stmt->fetchColumn() ?: 0;

        $stmt = $pdo->prepare("INSERT INTO invoice (command_id, issued_date, total_amount) VALUES (:command_id, NOW(), :total_amount)");
        $stmt->execute([':command_id' => $commandId, ':total_amount' => $totalAmount]);
    }

    echo "Données de test générées avec succès !";

} catch (PDOException $e) {
    echo "Erreur : " . $e->getMessage();
}
