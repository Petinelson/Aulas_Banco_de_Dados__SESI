<?php
    try {
        $conectar = new PDO("sqlite:banco/banco_biblioteca.db"); 

        $sql = $conectar->prepare("INSERT INTO tb_usuario (nome, telefone, rua, numero, cep, complemento, bairro, cidade, estado) 
                                VALUES (:nome, :telefone, :rua, :numero, :cep, :complemento, :bairro, :cidade, :estado)");

        $sql->bindParam(':nome', $_POST['nome']);
        $sql->bindParam(':telefone', $_POST['telefone']);
        $sql->bindParam(':rua', $_POST['rua']);
        $sql->bindParam(':numero', $_POST['numero']);
        $sql->bindParam(':cep', $_POST['cep']);
        $sql->bindParam(':complemento', $_POST['complemento']);
        $sql->bindParam(':bairro', $_POST['bairro']);
        $sql->bindParam(':cidade', $_POST['cidade']);
        $sql->bindParam(':estado', $_POST['estado']);

        $sql->execute();


        header('Location: usuarios.php');
    } catch (\Throwable $th) {
        echo "falha";
    }
?>
