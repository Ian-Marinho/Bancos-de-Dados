CREATE TABLE Cliente (
    CPF VARCHAR(11) NOT NULL,
    nome VARCHAR(100) NOT NULL,
    dt_Nasc DATE,
    sexo CHAR(1),
    profissao VARCHAR(50),
    email VARCHAR(100),
    telefone VARCHAR(20),
    endereco VARCHAR(150),
    CEP VARCHAR(9),
    CONSTRAINT PK_Cliente PRIMARY KEY (CPF)
);

CREATE TABLE Servico (
    cod_servico VARCHAR(20) NOT NULL,
    nome VARCHAR(50) NOT NULL,
    CONSTRAINT PK_Servico PRIMARY KEY (cod_servico),
    CONSTRAINT UQ_Servico_Nome UNIQUE (nome)
);

CREATE TABLE Profissional (
    id_profissional INT NOT NULL,
    prof_CPF VARCHAR(11) NOT NULL,
    nome VARCHAR(100) NOT NULL,
    percentual_de_comissao DECIMAL(4, 2),
    CONSTRAINT PK_Profissional PRIMARY KEY (id_profissional),
    CONSTRAINT UQ_Profissional_CPF UNIQUE (prof_CPF)
);

CREATE TABLE Aquisicao (
    id_aquisicao INT NOT NULL,
    data_aquisicao DATE NOT NULL,
    valor DECIMAL(10, 2),
    forma_pagamento VARCHAR(30),
    data_pagamento DATE,
    status_pagamento VARCHAR(20),
    C_CPF VARCHAR(11) NOT NULL,
    CONSTRAINT PK_Aquisicao PRIMARY KEY (id_aquisicao),
    CONSTRAINT FK_Aquisicao_Cliente FOREIGN KEY (C_CPF) REFERENCES Cliente(CPF)
);

CREATE TABLE Procedimento (
    id_procedimento INT NOT NULL,
    valor_padrao DECIMAL(10, 2),
    valor_primeira_sessao DECIMAL(10, 2),
    cod_servico_tipo VARCHAR(20) NOT NULL, 
    CONSTRAINT PK_Procedimento PRIMARY KEY (id_procedimento),
    CONSTRAINT FK_Procedimento_Servico FOREIGN KEY (cod_servico_tipo) REFERENCES Servico(cod_servico)
);

CREATE TABLE Pacote (
    id_pacote INT NOT NULL,
    nome VARCHAR(50) NOT NULL,
    valor_total DECIMAL(10, 2),
    quantidade_de_sessoes INT,
    status_pct VARCHAR(20),
    comprador_aquisicao_id INT NOT NULL,
    tipos_procedimentos_id INT NOT NULL, 
    CONSTRAINT PK_Pacote PRIMARY KEY (id_pacote),
    CONSTRAINT FK_Pacote_Comprador FOREIGN KEY (comprador_aquisicao_id) REFERENCES Aquisicao(id_aquisicao),
    CONSTRAINT FK_Pacote_Procedimento FOREIGN KEY (tipos_procedimentos_id) REFERENCES Procedimento(id_procedimento)
);

CREATE TABLE Atendimento (
    id_agendamento INT NOT NULL,
    data_hora TIMESTAMP NOT NULL,
    CPF_cliente VARCHAR(11) NOT NULL,
    feito_por_id_profissional INT NOT NULL,
    CONSTRAINT PK_Atendimento PRIMARY KEY (id_agendamento),
    CONSTRAINT FK_Atendimento_Cliente FOREIGN KEY (CPF_cliente) REFERENCES Cliente(CPF),
    CONSTRAINT FK_Atendimento_Profissional FOREIGN KEY (feito_por_id_profissional) REFERENCES Profissional(id_profissional)
);

