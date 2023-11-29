<?php
    try {
        $conectar = new PDO("sqlite:banco/banco_biblioteca.db"); 

        $codigo_catalogacao = $_GET['codigo_catalogacao'];
        
        $sql = $conectar->prepare("DELETE FROM tb_livro WHERE codigo_catalogacao = :codigo_catalogacao");
        $sql->bindParam(':codigo_catalogacao', $codigo_catalogacao);
        $sql->execute();

        $conectar = null;
        header('Location: livros.php');
    } catch (\Throwable $th) {
        echo "falha";
    }
?>
