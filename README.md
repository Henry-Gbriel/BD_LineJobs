#  Sistema de Gestão de Vagas de Emprego

Este projeto é um banco de dados estruturado para um sistema de gestão de vagas de emprego, permitindo o cadastro de usuários, empresas, candidatos, vagas, candidaturas, favoritos, mensagens e recuperação de senha.

📋 Estrutura do Banco de Dados

O banco de dados contém as seguintes tabelas:

 . usuario: Armazena informações gerais dos usuários, podendo ser candidatos ou empresas.

 . empresa: Contém dados específicos das empresas.

 . candidato: Contém informações sobre candidatos, incluindo habilidades e experiência.

 . vaga: Representa as oportunidades de emprego disponíveis.

 . candidatura: Relaciona candidatos às vagas em que se inscreveram.

 . favorito: Permite que candidatos salvem vagas de interesse.

 . mensagem: Implementa um sistema de mensagens entre usuários.

 . recuperacao_senha: Gerencia solicitações de redefinição de senha.

🚀 Tecnologias Utilizadas

MySQL - Banco de dados relacional
