<?php

    try {
        $conectar = new PDO("sqlite:banco/banco_biblioteca.db"); 

        $codigo_catalogacao = $_GET['codigo_catalogacao'];

        $sql = $conectar->prepare("SELECT * FROM tb_livro WHERE codigo_catalogacao = :codigo_catalogacao");
        $sql->bindParam(':codigo_catalogacao', $codigo_catalogacao);
        $sql->execute();
        $tb_livro = $sql->fetchAll(PDO::FETCH_ASSOC);

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
            window.location.href = "livros.php";
        }
    </script>
</head>
<body>
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
            <form action="livros_editar.php" method="POST">
                <label for="codigo_catalogacao">Cod Catalogação:</label>
                <input type="text" name="codigo_catalogacao" id="codigo_catalogacao" value="<?php echo $tb_livro[0]['codigo_catalogacao']; ?>">
                
                <label for="titulo">Título:</label>
                <input type="text" name="titulo" id="titulo" value="<?php echo $tb_livro[0]['titulo']; ?>">

                <label for="autor">Autor:</label>
                <input type="text" name="autor" id="autor" value="<?php echo $tb_livro[0]['autor']; ?>">

                <label for="editora">Editora:</label>
                <input type="text" name="editora" id="editora" value="<?php echo $tb_livro[0]['editora']; ?>">

                <label for="ano_de_publicacao">Ano de Publicação:</label>
                <input type="text" name="ano_de_publicacao" id="ano_de_publicacao" value="<?php echo $tb_livro[0]['ano_de_publicacao']; ?>">

                <label for="quantidade">Quantidade:</label>
                <input type="text" name="quantidade" id="quantidade" value="<?php echo $tb_livro[0]['quantidade']; ?>">
                

                <div class="botoes">
                    <input type="submit" value="Editar Cadastro">
                    <input type="button" value="Voltar" onclick="irParaPagina();">
                </div>

            </form>
        </div>

<?php
    $conectar = null;
?>