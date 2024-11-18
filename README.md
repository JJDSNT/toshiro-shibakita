# Toshiro Shibakita

Este é um projeto exemplo que utiliza PHP, MySQL e Nginx em um ambiente de orquestração Docker Swarm. Ele apresenta uma aplicação simples que insere e exibe registros de um banco de dados.

---

## Tecnologias Utilizadas

- **PHP 7.4**: Processamento da aplicação.
- **Nginx**: Proxy reverso e servidor web.
- **MySQL**: Banco de dados relacional.
- **Docker Swarm**: Orquestração dos containers.

---

## Estrutura do Projeto

```plaintext
toshiro-shibakita/
├── app/
│   ├── index.php       # Código principal da aplicação PHP
│   ├── Dockerfile      # Configuração do container da aplicação
│   └── nginx.conf      # Configuração do Nginx para o app
├── db/
│   ├── banco.sql       # Script inicial para criar tabelas
│   └── Dockerfile      # Configuração do container do MySQL
├── proxy/
│   └── nginx.conf      # Configuração do proxy reverso
├── docker-compose.yml  # Configuração do Docker Swarm
└── README.md           # Documentação do projeto
```
---

## Pré-requisitos

- Docker instalado ([Download e instruções](https://www.docker.com/products/docker-desktop)).
- Docker Swarm inicializado no ambiente local.

---

## Como Rodar o Projeto

### 1. Construir as Imagens Docker
Antes de implantar a stack, construa as imagens localmente:

```bash
docker build -t toshiro_app ./app
docker build -t toshiro_db ./db
```

### 2. Inicializar o Docker Swarm
Se o Swarm não estiver ativo, inicie-o com:
```bash
docker swarm init
```

### 3. Implantar a Stack no Docker Swarm
Implante os serviços definidos no docker-compose.yml:
```bash
docker stack deploy -c docker-compose.yml toshiro_stack
```

Este é um exercicio para a atividade da [DIO](https://github.com/denilsonbonatti/toshiro-shibakita)