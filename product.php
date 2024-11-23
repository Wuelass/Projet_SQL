<?php
require 'vendor/autoload.php';

use Faker\Factory as Faker;

try {
    $pdo = new PDO('mysql:host=localhost;dbname=projet_sql2', 'root', '');
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    
    $faker = Faker::create('fr_FR'); 

    for ($i = 0; $i < 10; $i++) {
        $productName = $faker->words(3, true);
        $description = $faker->sentence(10);
        $price = $faker->randomFloat(2, 5, 100);
        $stockQuantity = $faker->numberBetween(0, 50);

        $stmt = $pdo->prepare("INSERT INTO product (product_name, description, price, stock_quantity) VALUES (:product_name, :description, :price, :stock_quantity)");
        $stmt->execute([
            ':product_name' => $productName,
            ':description' => $description,
            ':price' => $price,
            ':stock_quantity' => $stockQuantity
        ]);
    }

    echo "Produits ajoutés avec succès !";

} catch (PDOException $e) {
    echo "Erreur : " . $e->getMessage();
}
