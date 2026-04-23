#!/bin/bash
echo "============================================================"
echo "  GENERADOR DE ETIQUETAS - ORO Construccion S.A.S"
echo "============================================================"
echo ""

# Verificar si Python esta instalado
if ! command -v python3 &> /dev/null; then
    echo "[ERROR] Python 3 no esta instalado."
    echo "Instalalo desde https://www.python.org/downloads/"
    read -p "Presiona Enter para salir..."
    exit 1
fi

# Moverse al directorio del script
cd "$(dirname "$0")"

# Crear entorno virtual si no existe
if [ ! -d "venv" ]; then
    echo "Creando entorno virtual por primera vez..."
    python3 -m venv venv
fi

# Activar entorno virtual
source venv/bin/activate

# Instalar dependencias si no estan instaladas
if ! pip show flask &> /dev/null; then
    echo "Instalando dependencias por primera vez..."
    echo "Esto puede tardar unos minutos..."
    pip install -r requirements.txt
fi

echo ""
echo "Iniciando aplicacion..."
echo "La aplicacion se abrira automaticamente en tu navegador."
echo ""
python3 app.py
