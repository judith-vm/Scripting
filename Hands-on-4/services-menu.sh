#!/bin/bash

# Función para mostrar el menú
mostrar_menu() {
    echo "Seleccione una opción:"
    echo "1. Listar el contenido de un directorio"
    echo "2. Crear un archivo de texto con una línea de texto"
    echo "3. Comparar dos archivos de texto"
    echo "4. Mostrar uso básico del comando 'awk'"
    echo "5. Mostrar uso básico del comando 'grep'"
    echo "6. Salir"
}

# Opción 1: Listar el contenido de un directorio
listar_directorio() {
    read -p "Ingrese la ruta absoluta del directorio: " ruta
    if [ -d "$ruta" ]; then
        ls "$ruta"
    else
        echo "El directorio no existe."
    fi
}

# Opción 2: Crear un archivo de texto con una línea de texto
crear_archivo_texto() {
    read -p "Ingrese el nombre del archivo a crear: " archivo
    read -p "Ingrese la cadena de texto que desea almacenar en el archivo: " cadena
    echo "$cadena" > "$archivo"
    echo "Archivo '$archivo' creado con la cadena: $cadena"
}

# Opción 3: Comparar dos archivos de texto
comparar_archivos() {
    read -p "Ingrese el nombre del primer archivo: " archivo1
    read -p "Ingrese el nombre del segundo archivo: " archivo2
    if [ -f "$archivo1" ] && [ -f "$archivo2" ]; then
        diff "$archivo1" "$archivo2"
    else
        echo "Uno o ambos archivos no existen."
    fi
}

# Opción 4: Uso básico del comando 'awk'
mostrar_awk() {
    echo "Mostrando el uso básico de 'awk'. Usaremos '/etc/passwd' como ejemplo."
    awk -F: '{ print $1 " es el usuario con ID " $3 }' /etc/passwd
}

# Opción 5: Uso básico del comando 'grep'
mostrar_grep() {
    read -p "Ingrese la cadena a buscar: " cadena
    read -p "Ingrese el archivo en el cual buscar: " archivo
    if [ -f "$archivo" ]; then
        grep "$cadena" "$archivo"
    else
        echo "El archivo no existe."
    fi
}

# Ciclo principal del menú
while true; do
    mostrar_menu
    read -p "Seleccione una opción [1-6]: " opcion
    case $opcion in
        1) listar_directorio ;;
        2) crear_archivo_texto ;;
        3) comparar_archivos ;;
        4) mostrar_awk ;;
        5) mostrar_grep ;;
        6) echo "Saliendo..."; exit 0 ;;
        *) echo "Opción no válida. Inténtelo de nuevo." ;;
    esac
    echo
done
