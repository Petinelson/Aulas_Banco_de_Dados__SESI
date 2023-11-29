<?php

    try {
        // PDO = PHP Data Object
        $conectar = new PDO("sqlite:banco/banco_biblioteca.db"); 

        $sql = $conectar->query("SELECT * FROM tb_usuario");
        $tb_usuario = $sql->fetchAll(PDO::FETCH_ASSOC);

        /*
        for($i = 0; $i < count($tb_usuario); $i++){
            echo "Matricula: " . $tb_usuario[$i]['matricula'] . " | ";
            echo "Nome: " . $tb_usuario[$i]['nome'] . " | ";
            echo "Telefone: " . $tb_usuario[$i]['telefone'] . "<br>";
        }
        

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
            <h2>Cadastro de usuário</h2>
            <form action="usuarios_cadastro.php" method="POST">
                <label for="nome">Nome:</label>
                <input type="text" name="nome" id="nome">

                <label for="telefone">Telefone:</label>
                <input type="text" name="telefone" id="telefone">

                <label for="rua">Rua:</label>
                <input type="text" name="rua" id="rua">

                <label for="numero">Número:</label>
                <input type="text" name="numero" id="numero">

                <label for="cep">CEP:</label>
                <input type="text" name="cep" id="cep">

                <label for="complemento">Complemento:</label>
                <input type="text" name="complemento" id="complemento">

                <label for="bairro">Bairro:</label>
                <input type="text" name="bairro" id="bairro">

                <label for="cidade">Cidade:</label>
                <input type="text" name="cidade" id="cidade">

                <label for="estado">Estado:</label>
                <input type="text" name="estado" id="estado">

                

                <div class="botoes">
                    <input type="submit" value="Cadastrar">
                    <input type="reset" value="Limpar">
                </div>

            </form>
        </div>

        <div class="consulta-usuario">
            <h2>Consulta de Usuários</h2>
            <table>
                <tr>
                    <th>Matricula</th>
                    <th>Nome</th>
                    <th>Telefone</th>
                    <th>Opções</th>
                </tr>
                <?php
                for($i = 0; $i < count($tb_usuario); $i++){
                    echo "<tr>";
                    echo "<td id='td_centro'>" . $tb_usuario[$i]['matricula'] . "</td>";
                    echo "<td>" . $tb_usuario[$i]['nome'] . "</td>";
                    echo "<td>" . $tb_usuario[$i]['telefone'] . "</td>";
                    echo "<td id='td_centro'>";
                        echo "<a href='usuarios_visualizar.php?matricula=". $tb_usuario[$i]['matricula'] ."'>Visualizar</a>";
                        // echo "<a href='#'>Editar</a>";
                        echo "<a href='usuarios_excluir.php?matricula=". $tb_usuario[$i]['matricula'] ."'>Excluir</a>";
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