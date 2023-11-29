<?php

    try {
        $conectar = new PDO("sqlite:banco/banco_biblioteca.db"); 

        $matricula = $_GET['matricula'];

        $sql = $conectar->prepare("SELECT * FROM tb_usuario WHERE matricula = :matricula");
        $sql->bindParam(':matricula', $matricula);
        $sql->execute();
        $tb_usuario = $sql->fetchAll(PDO::FETCH_ASSOC);

        /*
        echo "ok";
        */
    } catch (\Throwable $th) {
        echo "nao ok";
    }


?>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sistema Biblioteca</title>
    <link rel="stylesheet" href="/css/estilo.css">
    <script>
        function irParaPagina() {
            window.location.href = "usuarios.php";
        }
    </script>
</head>
<body>
    <header> 
    <header> 
        <img src="/img/Biblioteca-Banner.png" alt="Banner-de-Livros" title="Banner de Livros">   
        <nav>
            <ul>
                <li><a href="index.php">Inicio</a></li>
                <li><a href="usuarios.php">Usuários</a></li>
                <li><a href="livros.php">Livros</a></li>
                <li><a href="#">Emprestimos</a></li>
            </ul>
        </nav>
    </header>

    <main>
        <div class="cadastro-usuario">
            <h2>Visualização de usuário</h2>
            <form action="usuarios_editar.php" method="POST">
                <label for="nome">matricula:</label>
                <input type="text" name="matricula" id="matricula" value="<?php echo $tb_usuario[0]['matricula']; ?>">
                
                <label for="nome">Nome:</label>
                <input type="text" name="nome" id="nome" value="<?php echo $tb_usuario[0]['nome']; ?>">

                <label for="telefone">Telefone:</label>
                <input type="text" name="telefone" id="telefone" value="<?php echo $tb_usuario[0]['telefone']; ?>">

                <label for="rua">Rua:</label>
                <input type="text" name="rua" id="rua" value="<?php echo $tb_usuario[0]['rua']; ?>">

                <label for="numero">Número:</label>
                <input type="text" name="numero" id="numero" value="<?php echo $tb_usuario[0]['numero']; ?>">

                <label for="cep">CEP:</label>
                <input type="text" name="cep" id="cep" value="<?php echo $tb_usuario[0]['cep']; ?>">

                <label for="complemento">Complemento:</label>
                <input type="text" name="complemento" id="complemento" value="<?php echo $tb_usuario[0]['complemento']; ?>">

                <label for="bairro">Bairro:</label>
                <input type="text" name="bairro" id="bairro" value="<?php echo $tb_usuario[0]['bairro']; ?>">

                <label for="cidade">Cidade:</label>
                <input type="text" name="cidade" id="cidade" value="<?php echo $tb_usuario[0]['cidade']; ?>">

                <label for="estado">Estado:</label>
                <input type="text" name="estado" id="estado" value="<?php echo $tb_usuario[0]['estado']; ?>">

                

                <div class="botoes">
                    <input type="submit" value="Editar Cadastro">
                    <input type="button" value="Voltar" onclick="irParaPagina();">
                </div>

            </form>
        </div>

<?php
    $conectar = null;
?>