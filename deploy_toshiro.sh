#!/bin/bash

# Nome da stack
STACK_NAME="toshiro_stack"

# Verifica se o Docker está em execução
if ! docker info > /dev/null 2>&1; then
    echo "O Docker não está em execução ou o usuário atual não tem permissão para acessá-lo."
    exit 1
fi

# Inicializa o Docker Swarm, se ainda não estiver ativo
if ! docker info | grep -q "Swarm: active"; then
  echo "Inicializando o Docker Swarm..."
  docker swarm init
  if [ $? -ne 0 ]; then
    echo "Falha ao inicializar o Docker Swarm."
    exit 1
  fi
else
  echo "Docker Swarm já está ativo."
fi

# Verifica se o arquivo docker-compose.yml existe
if [ ! -f "docker-compose.yml" ]; then
  echo "Arquivo docker-compose.yml não encontrado no diretório atual."
  exit 1
fi

# Realiza o deploy da stack
echo "Realizando o deploy da stack '$STACK_NAME'..."
docker stack deploy -c docker-compose.yml $STACK_NAME
if [ $? -ne 0 ]; then
  echo "Falha ao realizar o deploy da stack."
  exit 1
fi

echo "Deploy da stack '$STACK_NAME' realizado com sucesso."

# Lista os serviços da stack
docker stack services $STACK_NAME
