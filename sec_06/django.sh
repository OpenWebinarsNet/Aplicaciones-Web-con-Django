#! /bin/bash
# Script Instalación Django Linux (django.sh)

# CONCEDER PERMISOS DE EJECUCIÓN ANTES DE LANZAR
# $ chmod +x django.sh

if [ "$#" -eq 0 ]; then
    echo
    echo "ERROR: Faltan parámetros"
    echo "USO: django.sh 'nombre_proyecto' ['nombre_aplicación']"
    exit 1
fi

python3 -m venv .venv
source .venv/bin/activate
python -m pip install Django
django-admin startproject $1 .
mkdir templates
mkdir static
touch templates/base.hml
touch templates/home.html

if [ -n "$2" ]; then
    python manage.py startapp $2
    mkdir templates/$2
fi

python manage.py makemigrations
python manage.py migrate
python manage.py createsuperuser --username admin --email admin@admin.com

if [ -n "$2" ]; then
    echo
    echo "------------------------------"
    echo "  No olvides registrar tu aplicación '$2' en settings.py"
    echo "------------------------------"
fi
echo "  No olvides cambiar el interprete en VS Code"
echo "      Ctrl+Shift+P -> Python: Select Interpreter"
echo "------------------------------"


