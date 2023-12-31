@ECHO OFF
:: Script Instalación Django Windows (django.bat)

:: EJECUTAR ANTES ESTOS COMANDOS
::  python -m venv .venv
::  .venv\Scripts\activate

IF "%1" EQU "" GOTO Usage ELSE GOTO Install

:Install
python -m pip install Django
django-admin.exe startproject %1 .
mkdir templates
mkdir static
type nul >> templates\"base.html"
type nul >> templates\"home.html"

IF "%2" NEQ "" GOTO Install_app ELSE GOTO Migrations
:Install_app
    python manage.py startapp %2
    mkdir templates\%2
    echo "No olvides registrar tu app '$2' en settings.py"

:Migrations
python manage.py makemigrations
python manage.py migrate
python manage.py createsuperuser --username admin --email admin@admin.com

echo "---------------------------------------------"
echo "No olvides cambiar el interprete en VS Code"
echo "      Ctrl+Shift+P -> Python: Select Interpreter"
echo "---------------------------------------------"
echo "Modificar en settings.py:"
echo "	- LANGUAGE_CODE = 'es-ES'"
echo "	- TIME_ZONE = 'Europe/Madrid'"
echo "	- 'DIRS': [BASE_DIR / 'templates'],"
echo "	- Registrar la aplicación '%2'"
GOTO exit

:Usage 
echo
echo "ERROR: Faltan datos. USO: django.sh 'nombre_proyecto' ['nombre_app']"

:exit