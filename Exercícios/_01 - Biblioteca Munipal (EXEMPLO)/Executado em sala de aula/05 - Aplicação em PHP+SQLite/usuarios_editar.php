<?php
    try {
        $conectar = new PDO("sqlite:banco/banco_biblioteca.db"); 
        
        $sql = $conectar->prepare("UPDATE tb_usuario 
            SET nome = :nome, telefone = :telefone, rua = :rua, 
            numero = :numero, cep = :cep, complemento = :complemento, 
            bairro = :bairro, cidade = :cidade, estado = :estado 
            WHERE matricula = :matricula");


        $sql->bindParam(':nome', $_POST['nome']);
        $sql->bindParam(':telefone', $_POST['telefone']);
        $sql->bindParam(':rua', $_POST['rua']);
        $sql->bindParam(':numero', $_POST['numero']);
        $sql->bindParam(':cep', $_POST['cep']);
        $sql->bindParam(':complemento', $_POST['complemento']);
        $sql->bindParam(':bairro', $_POST['bairro']);
        $sql->bindParam(':cidade', $_POST['cidade']);
        $sql->bindParam(':estado', $_POST['estado']);
        $sql->bindParam(':matricula', $_POST['matricula']);

        $sql->execute();

        header('Location: usuarios.php');
    } catch (\Throwable $th) {
        echo "falha";
    }
?>