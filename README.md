
# Aplicação Bancária em Flutter

Este repositório contém um projeto desenvolvido como parte de uma atividade acadêmica, cujo objetivo é construir uma aplicação bancária utilizando Flutter. A aplicação permite o cadastro de informações financeiras através de um formulário, exibe esses dados em uma lista, e realiza operações de CRUD (Create, Read, Update, Delete) através de uma API local (json-server).

## 📋 Funcionalidades

- **Formulário de Cadastro**: Tela com um formulário onde o usuário pode inserir informações de conta bancária.
- **Listagem de Contas**: Exibe todas as informações cadastradas em uma lista, permitindo visualizar os detalhes de cada conta.
- **CRUD**: 
  - **Create**: Permite o cadastro de novas contas.
  - **Read**: Exibe as contas bancárias salvas.
  - **Update**: Atualiza as informações de uma conta existente.
  - **Delete**: Exclui uma conta.
- **Conexão com API**: A aplicação se comunica com uma API local utilizando o json-server.

## 🛠️ Tecnologias Utilizadas

- **Flutter**: Framework para desenvolvimento mobile multiplataforma.
- **Dart**: Linguagem de programação utilizada pelo Flutter.
- **json-server**: API local para simulação de um backend RESTful.
- **HTTP**: Utilizado para realizar requisições à API.

## ⚙️ Configuração do Ambiente

Para executar o projeto localmente, siga os passos abaixo:

### Pré-requisitos

- Flutter SDK instalado (versão mínima: `x.x.x`)
- Dart SDK
- Node.js e npm (para rodar o json-server)
  
### Instalação

1. Clone o repositório:
   ```bash
   git clone https://github.com/gustavochm1412/atv1mod.git
   ```

2. Acesse o diretório do projeto:
   ```bash
   cd atv1mod
   ```

3. Instale as dependências do Flutter:
   ```bash
   flutter pub get
   ```

4. Inicie o json-server:
   ```bash
   npx json-server --watch db.json
   ```

5. Execute o projeto Flutter:
   ```bash
   flutter run
   ```

## 🖥️ Estrutura do Projeto

- **lib/**: Contém o código Dart da aplicação, incluindo as telas, widgets e lógica de negócio.
  - **screens/**: Armazena as telas principais do aplicativo, como o formulário de cadastro e a lista de contas.
  - **services/**: Contém a lógica de comunicação com a API (json-server).
  - **models/**: Define as classes de modelo, como a estrutura de dados das contas bancárias.
  
- **db.json**: Arquivo utilizado pelo json-server para armazenar os dados de contas bancárias.

## 🚀 Funcionalidade Detalhada

### 1. Formulário de Cadastro

- O formulário permite o cadastro de informações como o nome do titular, número da conta, agência, saldo, entre outros. Todos os campos são validados antes de enviar os dados para a API.

### 2. Listagem de Contas

- A tela de listagem exibe todas as contas cadastradas em formato de lista. Cada item pode ser clicado para editar ou excluir uma conta.

### 3. Conexão com json-server

- A comunicação com o servidor local é feita através de requisições HTTP usando o pacote `http`. As operações de cadastro, leitura, atualização e exclusão são implementadas de forma eficiente para garantir a persistência dos dados.

## 🧑‍💻 Contribuindo

Contribuições são bem-vindas! Sinta-se à vontade para abrir issues ou enviar pull requests. Por favor, siga as melhores práticas de desenvolvimento ao contribuir.

