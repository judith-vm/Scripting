@echo off
:: Crear un archivo de texto llamado mytext.txt y agregar la cadena “Hola Mundo”
echo Hola Mundo > mytext.txt

:: Desplegar el contenido del archivo mytext.txt en la terminal
type mytext.txt

:: Crear un subdirectorio llamado backup
mkdir backup

:: Copiar el archivo mytext.txt al subdirectorio backup
copy mytext.txt backup\

:: Listar el contenido del subdirectorio backup
dir backup

:: Eliminar el archivo mytext.txt del subdirectorio backup
del backup\mytext.txt

:: Eliminar el subdirectorio backup
rmdir backup

:: Pausa para ver el resultado antes de cerrar la terminal
pause
