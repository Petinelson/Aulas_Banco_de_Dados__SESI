<?php

    try {
        $conectar = new PDO("sqlite:banco/banco_biblioteca.db"); 

        $sql = $conectar->query("SELECT * FROM tb_livro");
        $tb_livro = $sql->fetchAll(PDO::FETCH_ASSOC);

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
        <div class="cadastro">
            <h2>Cadastro de livro</h2>
            <form action="livros_cadastro.php" method="POST">
                <label for="titulo">Título:</label>
                <input type="text" name="titulo" id="titulo">

                <label for="autor">Autor:</label>
                <input type="text" name="autor" id="autor">

                <label for="editora">Editora:</label>
                <input type="text" name="editora" id="editora">

                <label for="ano_de_publicacao">Ano de Publicação:</label>
                <input type="text" name="ano_de_publicacao" id="ano_de_publicacao">

                <label for="quantidade">Quantidade:</label>
                <input type="text" name="quantidade" id="quantidade">

                <div class="botoes">
                    <input type="submit" value="Cadastrar">
                    <input type="reset" value="Limpar">
                </div>

            </form>
        </div>

        <div class="consulta">
            <h2>Consulta de Livros</h2>
            <table>
                <tr>
                    <th>Cod. Catalogação</th>
                    <th>Título</th>
                    <th>Autor</th>
                    <th>Quantidade</th>
                    <th>Opções</th>
                </tr>
                <?php
                for($i = 0; $i < count($tb_livro); $i++){
                    echo "<tr>";
                    echo "<td id='td_centro'>" . $tb_livro[$i]['codigo_catalogacao'] . "</td>";
                    echo "<td>" . $tb_livro[$i]['titulo'] . "</td>";
                    echo "<td>" . $tb_livro[$i]['autor'] . "</td>";
                    echo "<td id='td_centro'>" . $tb_livro[$i]['quantidade'] . "</td>";
                    echo "<td id='td_centro'>";
                        echo "<a href='livros_visualizar.php?codigo_catalogacao=". $tb_livro[$i]['codigo_catalogacao'] ."'>Visualizar</a>";
                        echo "<a href='livros_excluir.php?codigo_catalogacao=". $tb_livro[$i]['codigo_catalogacao'] ."'>Excluir</a>";
                    echo "</td>";
                    echo "</tr>";
                }
                ?>
            </table>
        </div>
    </main>
</body>
</html>

<?php
    $conectar = null;
?>