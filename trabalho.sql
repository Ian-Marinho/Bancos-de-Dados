DROP TABLE IF EXISTS Atendimento;
DROP TABLE IF EXISTS Pacote;
DROP TABLE IF EXISTS Procedimento;
DROP TABLE IF EXISTS Aquisicao;
DROP TABLE IF EXISTS Cliente;
DROP TABLE IF EXISTS Profissional;
DROP TABLE IF EXISTS Servico;

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
    paciente_C_CPF VARCHAR(11), 
    CONSTRAINT PK_Procedimento PRIMARY KEY (id_procedimento),
    CONSTRAINT FK_Procedimento_Servico FOREIGN KEY (cod_servico_tipo) REFERENCES Servico(cod_servico),
    CONSTRAINT FK_Procedimento_Paciente FOREIGN KEY (paciente_C_CPF) REFERENCES Cliente(CPF) 
);

CREATE TABLE Pacote (
    id_pacote INT NOT NULL,
    nome VARCHAR(50) NOT NULL,
    valor_total DECIMAL(10, 2), 
    quantidade_de_sessoes INT,
    status_pct VARCHAR(20),
    comprador_aquisicao_id INT NOT NULL, 
    tipos_procedimentos_id INT, 
    cod_servico_pacote VARCHAR(20) NOT NULL, 
    CONSTRAINT PK_Pacote PRIMARY KEY (id_pacote),
    CONSTRAINT FK_Pacote_Comprador FOREIGN KEY (comprador_aquisicao_id) REFERENCES Aquisicao(id_aquisicao),
    CONSTRAINT FK_Pacote_Procedimento FOREIGN KEY (tipos_procedimentos_id) REFERENCES Procedimento(id_procedimento),
    CONSTRAINT FK_Pacote_Servico_Cod FOREIGN KEY (cod_servico_pacote) REFERENCES Servico(cod_servico)
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


INSERT INTO Cliente (CPF, nome, sexo, telefone, email, dt_Nasc, profissao, endereco, CEP) VALUES
('12345678901', 'Ana Souza', 'F', '11987654321', 'ana@gmail.com', '1990-05-12', 'Fisioterapeuta', 'Rua A, 123', '01001000'),
('23456789012', 'Bruno Lima', 'M', '11999887766', 'bruno@hotmail.com', '1985-10-20', 'Engenheiro', 'Rua B, 456', '02002000'),
('34567890123', 'Carla Mendes', 'F', '11988776655', 'carla@yahoo.com', '1992-03-08', 'Designer', 'Rua C, 789', '03003000'),
('45678901234', 'Diego Santos', 'M', '11977665544', 'diego@gmail.com', '1998-12-01', 'Professor', 'Rua D, 321', '04004000'),
('56789012345', 'Eduarda Campos', 'F', '11966554433', 'eduarda@gmail.com', '1995-07-17', 'Enfermeira', 'Rua E, 654', '05005000');

INSERT INTO Servico (cod_servico, nome) VALUES
('SRV001', 'Massagem Relaxante'),
('SRV002', 'Acupuntura'),
('SRV003', 'Fisioterapia'),
('SRV004', 'Spa Facial'),
('SRV005', 'Massagem Terapêutica');

INSERT INTO Profissional (id_profissional, prof_CPF, nome, percentual_de_comissao) VALUES
(1, '98765432100', 'José Almeida', 10.0),
(2, '87654321099', 'Mariana Torres', 12.5),
(3, '76543210988', 'Paulo Ribeiro', 15.0),
(4, '65432109877', 'Fernanda Costa', 8.0),
(5, '54321098766', 'Ricardo Dias', 11.0);

INSERT INTO Aquisicao (id_aquisicao, data_aquisicao, valor, forma_pagamento, data_pagamento, status_pagamento, C_CPF) VALUES
(1, '2024-10-10', 300.00, 'Crédito', '2024-10-10', 'Pago', '12345678901'),
(2, '2024-10-12', 150.00, 'Débito',  '2024-10-12', 'Pago', '23456789012'),
(3, '2024-10-13', 220.00, 'PIX',      NULL,        'Pendente', '34567890123'),
(4, '2024-10-15', 180.00, 'Crédito',  NULL,        'Pendente', '45678901234'),
(5, '2024-10-18', 250.00, 'PIX',      NULL,        'Pendente', '56789012345');

INSERT INTO Procedimento (id_procedimento, valor_padrao, valor_primeira_sessao, cod_servico_tipo, paciente_C_CPF) VALUES
(1, 120.00, 80.00, 'SRV001', '12345678901'),
(2, 90.00, 60.00, 'SRV002', '23456789012'),
(3, 130.00, 100.00, 'SRV003', '34567890123'),
(4, 110.00, 70.00, 'SRV004', '45678901234'),
(5, 150.00, 120.00, 'SRV005', '56789012345');

INSERT INTO Pacote (id_pacote, nome, valor_total, quantidade_de_sessoes, status_pct, comprador_aquisicao_id, tipos_procedimentos_id, cod_servico_pacote) VALUES
(1, 'Pacote Relax 5 sessões', 500.00, 5,  'Ativo',    1, 1, 'SRV001'),
(2, 'Pacote Acupuntura 3',    270.00, 3,  'Ativo',    2, 2, 'SRV002'),
(3, 'Pacote Fisio 10',       1200.00, 10, 'Ativo',    3, 3, 'SRV003'),
(4, 'Pacote Spa 4',           400.00, 4,  'Pendente', 4, 4, 'SRV004'),
(5, 'Pacote Premium 6',       900.00, 6,  'Ativo',    5, 5, 'SRV005');

INSERT INTO Atendimento (id_agendamento, data_hora, CPF_cliente, feito_por_id_profissional) VALUES
(1, '2024-10-20 10:00:00', '12345678901', 1),
(2, '2024-10-20 11:00:00', '23456789012', 2),
(3, '2024-10-21 09:00:00', '34567890123', 3),
(4, '2024-10-21 14:00:00', '45678901234', 4),
(5, '2024-10-22 16:00:00', '56789012345', 5);

--quanto foi ganho no dia?
SELECT data_aquisicao AS dia,
SUM(valor) AS total_recebido FROM Aquisicao
WHERE status_pagamento = 'Pago'
GROUP BY data_aquisicao
ORDER BY data_aquisicao;

--quanto foi ganho na semana?
SELECT date_trunc('week', data_aquisicao)::date AS semana_inicio,
SUM(valor) AS total_recebido FROM Aquisicao
WHERE status_pagamento = 'Pago'
GROUP BY date_trunc('week', data_aquisicao)
ORDER BY semana_inicio;

--quanto foi ganho no mes?
SET lc_time = 'pt_BR'; --faz o mes sair em portugues

SELECT
    INITCAP(TO_CHAR(data_aquisicao, 'TMMonth')) AS mes,
    SUM(valor) AS total_recebido
FROM Aquisicao
WHERE status_pagamento = 'Pago'
GROUP BY TO_CHAR(data_aquisicao, 'TMMonth')
ORDER BY MIN(data_aquisicao);