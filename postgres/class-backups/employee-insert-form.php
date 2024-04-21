<?php require 'header.html'; ?>
<form action="" method="post">
    <input type="text" name="nome" placeholder="Name"><br><br>
    <input type="email" name="email" placeholder="E-mail"><br><br>
    <input type="radio" id="opt1" name="sexo" value="F"><label for="opt1">Feminino</label><br><br>
    <input type="radio" id="opt2" name="sexo" value="M"><label for="opt2">Masculino</label><br><br>
    <select name="departamento" id="depart">
    <?php
        foreach ($obMenuSelect->selectMenuDepart() as $lines) {
            echo "<option value=".$lines['departamento'].">".$lines['departamento']."</option>";
        }
    ?>
    </select><br><br>
    <input type="date" name="admissao" placeholder="Data admissão"><br><br>
    <input type="number" name="salario" placeholder="Salário"><br><br>
    <input type="text" name="cargo" placeholder="Cargo"><br><br>
    <input type="number" name="regiao" placeholder="Id região"><br><br><br>
    <input type="submit" value="Inserir funcionário">
</form>
<?php require 'footer.html'; ?>