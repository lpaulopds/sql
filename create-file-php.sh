#!/bin/bash

echo "Digite o nome do arquivo sem extensão [.php] [+]:"

read nameFile

if [[ -e $nameFile.php ]]; then
	echo "[-] Existe arquivo com mesmo nome."
else
	sudo touch $nameFile.php
	sudo chmod 766 $nameFile.php
	sudo echo "<?php declare(strict_types=1);" > $nameFile.php
	echo -e "[+] Arquivo criado."
fi
