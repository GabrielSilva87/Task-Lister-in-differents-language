#!/bin/bash

FILE_NAME="TaskLkst"

echo "Compilando $FILE_NAME.java..."
javac "$FILE_NAME.java"

if [ $? -eq 0 ]; then
    echo "Compilação bem-sucedida."
    echo "Executando $FILE_NAME..."
    java "$FILE_NAME"
else
    echo "Erro na compilação."
fi