--  Isso informa ao GitHub que os arquivos `.sql` devem ser tratados como SQL.



CREATE DATABASE linejobs; -- Criando o banco de dados 

CREATE TABLE usuario (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY, -- Identificador único do usuário
    nome VARCHAR(255) NOT NULL, -- Nome do usuário
    email VARCHAR(255) UNIQUE NOT NULL, -- Email único do usuário
    senha VARCHAR(255) NOT NULL, -- Senha do usuário (deve ser armazenada de forma segura)
    telefone VARCHAR(21) UNIQUE NOT NULL, -- Telefone único do usuário
    tipo ENUM('CANDIDATO', 'EMPRESA') NOT NULL, -- Define se o usuário é um candidato ou uma empresa
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP -- Data de criação do usuário
);

CREATE TABLE empresa (
    id_empresa BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY, -- Identificador único da empresa
    id_usuario BIGINT UNSIGNED UNIQUE NOT NULL, -- Referência ao usuário que representa a empresa
    cnpj VARCHAR(18) UNIQUE NOT NULL, -- CNPJ único da empresa
    razao_social VARCHAR(255) NOT NULL, -- Razão social da empresa
    nome_empresa VARCHAR(255), -- Nome fantasia da empresa
    setor VARCHAR(100), -- Setor de atuação da empresa
    endereco TEXT, -- Endereço da empresa
    FOREIGN KEY (id_usuario) REFERENCES usuario(id) ON DELETE CASCADE -- Caso o usuário seja deletado, a empresa será removida também
);

CREATE TABLE candidato (
    id_candidato BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY, -- Identificador único do candidato
    id_usuario BIGINT UNSIGNED UNIQUE NOT NULL, -- Referência ao usuário que representa o candidato
    experiencia TEXT, -- Experiência profissional do candidato
    habilidades TEXT, -- Habilidades do candidato
    github VARCHAR(255) UNIQUE, -- Link para o GitHub do candidato (opcional)
    linkedin VARCHAR(255) UNIQUE, -- Link para o LinkedIn do candidato (opcional)
    FOREIGN KEY (id_usuario) REFERENCES usuario(id) ON DELETE CASCADE -- Caso o usuário seja deletado, o candidato será removido também
);

CREATE TABLE vaga (
    id_vaga BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY, -- Identificador único da vaga
    id_empresa BIGINT UNSIGNED NOT NULL, -- Referência à empresa que criou a vaga
    titulo VARCHAR(255) NOT NULL, -- Título da vaga
    descricao TEXT NOT NULL, -- Descrição detalhada da vaga
    requisitos TEXT, -- Requisitos necessários para a vaga
    localizacao VARCHAR(255), -- Localização da vaga
    modalidade VARCHAR(50), -- Modalidade de trabalho (remoto, presencial, híbrido)
    tipo_contrato VARCHAR(50), -- Tipo de contrato (CLT, PJ, estágio, etc.)
    salario DECIMAL(10,2), -- Faixa salarial oferecida para a vaga
    status ENUM('ABERTA', 'FECHADA') DEFAULT 'ABERTA', -- Status da vaga (aberta ou fechada)
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Data de criação da vaga
    FOREIGN KEY (id_empresa) REFERENCES empresa(id_empresa) ON DELETE CASCADE -- Caso a empresa seja deletada, as vagas também serão removidas
);

CREATE TABLE candidatura (
    id_candidatura BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY, -- Identificador único da candidatura
    id_candidato BIGINT UNSIGNED NOT NULL, -- Referência ao candidato que aplicou para a vaga
    id_vaga BIGINT UNSIGNED NOT NULL, -- Referência à vaga para a qual foi feita a candidatura
    status ENUM('EM_ANALISE', 'ACEITA', 'REJEITADA') DEFAULT 'EM_ANALISE', -- Status da candidatura
    data_aplicacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Data de aplicação da candidatura
    FOREIGN KEY (id_candidato) REFERENCES candidato(id_candidato) ON DELETE CASCADE, -- Caso o candidato seja deletado, as candidaturas também serão removidas
    FOREIGN KEY (id_vaga) REFERENCES vaga(id_vaga) ON DELETE CASCADE -- Caso a vaga seja deletada, as candidaturas também serão removidas
);

CREATE TABLE favorito (
    id_favorito BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY, -- Identificador único do favorito
    id_candidato BIGINT UNSIGNED NOT NULL, -- Referência ao candidato que favoritou a vaga
    id_vaga BIGINT UNSIGNED NOT NULL, -- Referência à vaga favoritada
    data_favorito TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Data em que a vaga foi favoritada
    FOREIGN KEY (id_candidato) REFERENCES candidato(id_candidato) ON DELETE CASCADE, -- Caso o candidato seja deletado, os favoritos também serão removidos
    FOREIGN KEY (id_vaga) REFERENCES vaga(id_vaga) ON DELETE CASCADE -- Caso a vaga seja deletada, os favoritos também serão removidos
);

CREATE TABLE mensagem (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY, -- Identificador único da mensagem
    id_remetente BIGINT UNSIGNED NOT NULL, -- Referência ao usuário que enviou a mensagem
    id_destinatario BIGINT UNSIGNED NOT NULL, -- Referência ao usuário que recebeu a mensagem
    mensagem TEXT NOT NULL, -- Conteúdo da mensagem
    data_envio TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Data e horário do envio da mensagem
    lida BOOLEAN DEFAULT FALSE, -- Indica se a mensagem foi lida
    FOREIGN KEY (id_remetente) REFERENCES usuario(id) ON DELETE CASCADE, -- Caso o remetente seja deletado, as mensagens também serão removidas
    FOREIGN KEY (id_destinatario) REFERENCES usuario(id) ON DELETE CASCADE -- Caso o destinatário seja deletado, as mensagens também serão removidas
);

CREATE TABLE recuperacao_senha (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY, -- Identificador único da recuperação de senha
    id_usuario BIGINT UNSIGNED NOT NULL, -- Referência ao usuário que solicitou a recuperação
    token VARCHAR(255) UNIQUE NOT NULL, -- Código único para redefinir senha
    expiracao TIMESTAMP NOT NULL, -- Data de expiração do token
    usado BOOLEAN DEFAULT FALSE, -- Indica se o token já foi utilizado
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Data de criação do pedido de recuperação de senha
    FOREIGN KEY (id_usuario) REFERENCES usuario(id) ON DELETE CASCADE -- Caso o usuário seja deletado, os registros de recuperação de senha também serão removidos
);
