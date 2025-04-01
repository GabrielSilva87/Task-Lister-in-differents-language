#!/bin/bash

mkdir lista_de_tarefas
cd lista_de_tarefas
git init
echo "- [ ] Comprar leite" >> tarefas.txt
echo "- [ ] Estudar Git" >> tarefas.txt
echo "- [ ] Fazer exercícios" >> tarefas.txt
git add tarefas.txt
git commit -m "Adicionar lista de tarefas inicial"
echo "Listador de tarefas criado com sucesso!"