#!/bin/bash

# Verificación de argumentos
if [ "$#" -ne 8 ]; then
    echo "Uso: $0 <nombre_vm> <tipo_os> <num_cpus> <ram_gb> <vram_mb> <disco_duro_gb> <nombre_controlador_sata> <nombre_controlador_ide>"
    exit 1
fi

# Asignación de variables desde los argumentos de línea de comandos
NOMBRE_VM=$1
TIPO_OS=$2
NUM_CPUS=$3
RAM_GB=$(($4 * 1024))  # Convertir RAM de GB a MB
VRAM_MB=$5
DISCO_DURO_GB=$6
CONTROLADOR_SATA=$7
CONTROLADOR_IDE=$8

# Definir la ruta del disco duro virtual
DISCO_DURO_VDI="${NOMBRE_VM}.vdi"

# Separador visual
SEPARADOR="========================================="

# Crear la Máquina Virtual
echo "$SEPARADOR"
echo "Creando la Máquina Virtual: $NOMBRE_VM"
VBoxManage createvm --name "$NOMBRE_VM" --ostype "$TIPO_OS" --register

# Configurar CPU, RAM y VRAM
echo "$SEPARADOR"
echo "Configurando recursos de hardware:"
echo " - Número de CPUs: $NUM_CPUS"
echo " - RAM: $RAM_GB MB"
echo " - VRAM: $VRAM_MB MB"
VBoxManage modifyvm "$NOMBRE_VM" --cpus "$NUM_CPUS" --memory "$RAM_GB" --vram "$VRAM_MB"

# Crear el disco duro virtual
echo "$SEPARADOR"
echo "Creando disco duro virtual:"
echo " - Tamaño del disco: $DISCO_DURO_GB GB"
VBoxManage createmedium disk --filename "$DISCO_DURO_VDI" --size $(($DISCO_DURO_GB * 1024)) --format VDI

# Crear y configurar el controlador SATA
echo "$SEPARADOR"
echo "Configurando controlador SATA: $CONTROLADOR_SATA"
VBoxManage storagectl "$NOMBRE_VM" --name "$CONTROLADOR_SATA" --add sata --controller IntelAhci
VBoxManage storageattach "$NOMBRE_VM" --storagectl "$CONTROLADOR_SATA" --port 0 --device 0 --type hdd --medium "$DISCO_DURO_VDI"

# Crear y configurar el controlador IDE para CD/DVD
echo "$SEPARADOR"
echo "Configurando controlador IDE: $CONTROLADOR_IDE"
VBoxManage storagectl "$NOMBRE_VM" --name "$CONTROLADOR_IDE" --add ide
VBoxManage storageattach "$NOMBRE_VM" --storagectl "$CONTROLADOR_IDE" --port 1 --device 0 --type dvddrive --medium emptydrive

# Mostrar la configuración creada
echo "$SEPARADOR"
echo "Resumen de la configuración creada para la Máquina Virtual: $NOMBRE_VM"
VBoxManage showvminfo "$NOMBRE_VM"

# Finalización del proceso
echo "$SEPARADOR"
echo "Máquina Virtual $NOMBRE_VM creada y configurada exitosamente."
echo "$SEPARADOR"
