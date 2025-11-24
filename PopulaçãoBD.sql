INSERT INTO Cliente (CPF, nome, sexo, telefone, email, dt_Nasc, profissao, endereco, CEP) VALUES
('12345678901', 'Ana Souza', 'F', '11987654321', 'ana@gmail.com', '1990-05-12', 'Fisioterapeuta', 'Rua A, 123', '01001000'),
('23456789012', 'Bruno Lima', 'M', '11999887766', 'bruno@hotmail.com', '1985-10-20', 'Engenheiro', 'Rua B, 456', '02002000'),
('34567890123', 'Carla Mendes', 'F', '11988776655', 'carla@yahoo.com', '1992-03-08', 'Designer', 'Rua C, 789', '03003000'),
('45678901234', 'Diego Santos', 'M', '11977665544', 'diego@gmail.com', '1998-12-01', 'Professor', 'Rua D, 321', '04004000'),
('56789012345', 'Eduarda Campos', 'F', '11966554433', 'eduarda@gmail.com', '1995-07-17', 'Enfermeira', 'Rua E, 654', '05005000'),
('67890123456', 'Fábio Guedes', 'M', '11955443322', 'fabio@uol.com.br', '1978-01-25', 'Advogado', 'Av. F, 987', '06006000'),
('78901234567', 'Gabriela Rocha', 'F', '11944332211', 'gabi@terra.com.br', '1989-11-30', 'Jornalista', 'Rua G, 210', '07007000'),
('89012345678', 'Henrique Nogueira', 'M', '11933221100', 'henrique@corp.com', '2000-04-03', 'Estudante', 'Alameda H, 543', '08008000'),
('90123456789', 'Isabela Freitas', 'F', '11922110099', 'isabela@email.com', '1982-08-14', 'Arquiteta', 'Travessa I, 876', '09009000'),
('01234567890', 'João Pereira', 'M', '11911009988', 'joao@web.com', '1975-06-28', 'Empresário', 'Rua J, 111', '10010000'),
('11122233344', 'Larissa Ferreira', 'F', '11900001111', 'lari.ferreira@web.com', '1991-02-09', 'Contadora', 'Av. K, 222', '11011000'),
('22233344455', 'Marcelo Costa', 'M', '11911112222', 'marcelocosta@email.com', '1980-11-23', 'Chef de Cozinha', 'Rua L, 333', '12012000'),
('33344455566', 'Natália Alves', 'F', '11922223333', 'naty.alves@corp.com', '1994-04-16', 'Psicóloga', 'Travessa M, 444', '13013000'),
('44455566677', 'Otávio Borges', 'M', '11933334444', 'otavio.borges@terra.com.br', '1970-09-05', 'Gerente', 'Rua N, 555', '14014000'),
('55566677788', 'Patrícia Gomes', 'F', '11944445555', 'patriciacg@uol.com.br', '1987-01-29', 'Relações Públicas', 'Alameda O, 666', '15015000'),
('66677788899', 'Rafael Martins', 'M', '11955556666', 'rafael.m@gmail.com', '1999-06-19', 'Técnico de TI', 'Rua P, 777', '16016000'),
('77788899900', 'Sofia Pires', 'F', '11966667777', 'sofiapires@gmail.com', '1984-03-27', 'Fotógrafa', 'Av. Q, 888', '17017000'),
('88899900011', 'Thiago Viana', 'M', '11977778888', 'thiago.viana@yahoo.com', '1976-12-10', 'Eletricista', 'Rua R, 999', '18018000'),
('99900011122', 'Valéria Queiroz', 'F', '11988889999', 'valeria.q@hotmail.com', '1996-08-03', 'Estudante', 'Travessa S, 1010', '19019000'),
('00011122233', 'Wilson Dantas', 'M', '11999990000', 'wilson.dantas@gmail.com', '1983-05-24', 'Corretor de Imóveis', 'Rua T, 1122', '20020000');

INSERT INTO Servico (cod_servico, nome) VALUES
('SRV001', 'Sessão/Tratamento com Fábio'),
('SRV002', 'Massagem Tui Ná'),
('SRV003', 'Reflexologia Podal'),
('SRV004', 'Avaliação de Palmilha Ortopédica');

INSERT INTO Profissional (id_profissional, prof_CPF, nome, percentual_de_comissao) VALUES
(1, '98765432100', 'Fabio Pense', 90.0),
(2, '87654321099', 'Elaine Oliveira', 60.0);

INSERT INTO Aquisicao (id_aquisicao, data_aquisicao, valor, forma_pagamento, data_pagamento, status_pagamento, C_CPF) VALUES
(1, '2024-10-10', 300.00, 'Crédito', '2024-10-10', 'Pago', '12345678901'),
(2, '2024-10-12', 150.00, 'Débito', '2024-10-12', 'Pago', '23456789012'),
(3, '2024-10-13', 220.00, 'PIX', NULL, 'Pendente', '34567890123'),
(4, '2024-10-15', 180.00, 'Crédito', NULL,'Pendente', '45678901234'),
(5, '2024-10-18', 250.00, 'PIX', NULL,'Pendente', '56789012345'), 
(6, '2024-10-23', 450.00, 'Crédito', '2024-10-23', 'Pago', '67890123456'),
(7, '2024-10-25', 160.00, 'PIX','2024-10-25', 'Pago', '78901234567'),
(8, '2024-10-26', 310.00, 'Débito', NULL,'Pendente', '89012345678'),
(9, '2024-10-27', 280.00, 'Transferência', NULL,'Pendente', '90123456789'),
(10, '2024-10-28', 550.00, 'Crédito', '2024-10-28', 'Pago', '01234567890'),
(11, '2024-10-29', 120.00, 'PIX', '2024-10-29', 'Pago', '11122233344'), 
(12, '2024-10-29', 350.00, 'Crédito', NULL, 'Pendente', '22233344455'), 
(13, '2024-10-30', 200.00, 'Débito', '2024-10-30', 'Pago', '33344455566'), 
(14, '2024-10-30', 480.00, 'Transferência', NULL, 'Pendente', '44455566677'), 
(15, '2024-10-31', 190.00, 'PIX', '2024-10-31', 'Pago', '55566677788'), 
(16, '2024-11-01', 500.00, 'Crédito', '2024-11-01', 'Pago', '66677788899'), 
(17, '2024-11-01', 140.00, 'Débito', NULL, 'Pendente', '77788899900'), 
(18, '2024-11-02', 270.00, 'PIX', '2024-11-02', 'Pago', '88899900011'), 
(19, '2024-11-03', 390.00, 'Transferência', '2024-11-03', 'Pago', '99900011122'), 
(20, '2024-11-04', 210.00, 'Crédito', NULL, 'Pendente', '00011122233'); 

INSERT INTO Procedimento (id_procedimento, valor_padrao, valor_primeira_sessao, cod_servico_tipo) VALUES
(1, 130.00, 100.00, 'SRV001'),
(2, 120.00, 80.00, 'SRV002'),
(3, 130.00, 100.00, 'SRV003'),
(4, 110.00, 70.00, 'SRV004');

INSERT INTO Pacote (id_pacote, nome, valor_total, quantidade_de_sessoes, status_pct, comprador_aquisicao_id, tipos_procedimentos_id) VALUES
(1, 'Pacote 5 sessões com Fábio', 650.00, 5, 'Ativo', 1, 1),
(2, 'Pacote 4 sessões com Fábio', 550.00, 4, 'Ativo', 1, 1),
(3, 'Pacote 5 sessões de Massagem Tui Ná', 400.00, 5, 'Ativo', 2, 2),
(4, 'Pacote 5 sessões de Reflexologia Podal', 400.00, 5, 'Ativo', 3, 3);

INSERT INTO Atendimento (id_agendamento, data_hora, CPF_cliente, feito_por_id_profissional) VALUES
(1, '2024-10-20 10:00:00', '12345678901', 1), 
(2, '2024-10-20 11:00:00', '23456789012', 2), 
(3, '2024-10-21 09:00:00', '34567890123', 1), 
(4, '2024-10-21 14:00:00', '45678901234', 2), 
(5, '2024-10-22 16:00:00', '56789012345', 1),
(6, '2024-11-05 08:30:00', '11122233344', 1), 
(7, '2024-11-05 14:30:00', '22233344455', 2), 
(8, '2024-11-06 10:30:00', '33344455566', 1), 
(9, '2024-11-06 15:00:00', '44455566677', 2), 
(10, '2024-11-07 09:30:00', '55566677788', 1), 
(11, '2024-11-07 16:30:00', '66677788899', 2), 
(12, '2024-11-08 11:30:00', '77788899900', 1), 
(13, '2024-11-08 17:00:00', '88899900011', 2), 
(14, '2024-11-09 10:00:00', '99900011122', 1), 
(15, '2024-11-09 15:30:00', '00011122233', 2); 

