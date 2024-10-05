#Crear un archivo y agregar Hola Mundo
echo "Hola Mundo" > mytext
read -p "Presiona enter para continuar"
#Imprirmir lo que tiene el archivo mytext
cat mytext
read -p "Presiona enter para continuar"
#Crear un directorio con nombre backup
mkdir backup
read -p "Presiona enter para continuar"
#Mover el archivo mytext a la carpeta backup
mv mytext backup/
read -p "Presiona enter para continuar"
#Listar el contenido en la carpeta backup
ls backup
read -p "Presiona enter para continuar"
#Eliminar el archivo mytext de la carpeta backup
rm backup/mytext
read -p "Presiona enter para continuar"
#Eliminar el directorio backup
rmdir backup
read -p "Presiona enter para continuar"
