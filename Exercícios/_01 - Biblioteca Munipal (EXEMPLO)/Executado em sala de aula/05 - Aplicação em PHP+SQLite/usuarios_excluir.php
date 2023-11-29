<?php
    try {
        $conectar = new PDO("sqlite:banco/banco_biblioteca.db"); 

        $matricula = $_GET['matricula'];
        
        $sql = $conectar->prepare("DELETE FROM tb_usuario WHERE matricula = :matricula");
        $sql->bindParam(':matricula', $matricula);
        $sql->execute();

        $conectar = null;
        header('Location: usuarios.php');
    } catch (\Throwable $th) {
        echo "falha";
    }
?>
