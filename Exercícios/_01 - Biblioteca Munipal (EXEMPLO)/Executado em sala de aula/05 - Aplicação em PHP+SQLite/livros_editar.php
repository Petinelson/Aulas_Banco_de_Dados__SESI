<?php
    try {
        $conectar = new PDO("sqlite:banco/banco_biblioteca.db"); 

        $sql = $conectar->prepare("UPDATE tb_livro 
            SET titulo = :titulo, autor = :autor, editora = :editora, 
            ano_de_publicacao = :ano_de_publicacao, quantidade = :quantidade 
            WHERE codigo_catalogacao = :codigo_catalogacao");

        $sql->bindParam(':titulo', $_POST['titulo']);
        $sql->bindParam(':autor', $_POST['autor']);
        $sql->bindParam(':editora', $_POST['editora']);
        $sql->bindParam(':ano_de_publicacao', $_POST['ano_de_publicacao']);
        $sql->bindParam(':quantidade', $_POST['quantidade']);
        $sql->bindParam(':codigo_catalogacao', $_POST['codigo_catalogacao']);

        $sql->execute();
        
        header('Location: livros.php');
    } catch (\Throwable $th) {
        echo "falha";
    }
?>