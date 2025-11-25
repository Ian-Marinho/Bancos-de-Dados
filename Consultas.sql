--Qual foi o faturamento diario nos dias que a clinica atendeu?
SELECT data_aquisicao AS dia,
SUM(valor) AS total_recebido FROM Aquisicao
WHERE status_pagamento = 'Pago'
GROUP BY data_aquisicao
ORDER BY data_aquisicao;

--Qual foi o faturamento semanal semana?
SELECT date_trunc('week', data_aquisicao)::date AS semana_inicio,
SUM(valor) AS total_recebido FROM Aquisicao
WHERE status_pagamento = 'Pago'
GROUP BY date_trunc('week', data_aquisicao)
ORDER BY semana_inicio;

--Qual foi o faturamento mensal?
SET lc_time = 'pt_BR';
SELECT INITCAP(TO_CHAR(data_aquisicao, 'TMMonth')) AS mes,
SUM(valor) AS total_recebido
FROM Aquisicao
WHERE status_pagamento = 'Pago'
GROUP BY TO_CHAR(data_aquisicao, 'TMMonth')
ORDER BY MIN(data_aquisicao);

--Qual o Procedimento mais Vendido (em termos de número de pacotes adquiridos)?
SELECT S.nome AS nome_do_servico,
COUNT(Pc.id_pacote) AS total_pacotes_vendidos
FROM Servico S
JOIN Procedimento Pr ON S.cod_servico = Pr.cod_servico_tipo
JOIN Pacote Pc ON Pr.id_procedimento = Pc.tipos_procedimentos_id
GROUP BY S.nome
ORDER BY total_pacotes_vendidos DESC
LIMIT 1;

--Qual o Valor Total de Comissões a Ser Pago para Cada Profissional?
SELECT P.nome AS nome_profissional, P.percentual_de_comissao,
SUM(Aq.valor * (P.percentual_de_comissao / 100)) AS valor_total_comissao
FROM Profissional P
JOIN Atendimento At ON P.id_profissional = At.feito_por_id_profissional
JOIN Cliente C ON At.CPF_cliente = C.CPF
JOIN Aquisicao Aq ON C.CPF = Aq.C_CPF
WHERE Aq.status_pagamento = 'Pago'
GROUP BY P.nome, P.percentual_de_comissao
ORDER BY valor_total_comissao DESC;

-- Qual a quantidade de clientes atendidos diariamente? 
SELECT DATE(data_hora) AS dia_atendimento,
COUNT(DISTINCT CPF_cliente) AS clientes_atendidos
FROM Atendimento
GROUP BY dia_atendimento
ORDER BY dia_atendimento;

-- Qual a quantidade de clientes atendidos semanalmente? 
SELECT date_trunc('week', data_hora)::date AS semana_inicio,
COUNT(DISTINCT CPF_cliente) AS clientes_atendidos
FROM Atendimento
GROUP BY semana_inicio
ORDER BY semana_inicio;

-- Qual a quantidade de clientes atendidos mensalmente? 
SET lc_time = 'pt_BR';
SELECT INITCAP(TO_CHAR(data_hora, 'TMMonth')) AS mes_atendimento,
COUNT(DISTINCT CPF_cliente) AS clientes_atendidos
FROM Atendimento
GROUP BY mes_atendimento
ORDER BY MIN(data_hora);

-- Qual a quantidade de atendimentos ocorreram a cada dia?
SELECT DATE(data_hora) AS dia_atendimento,
COUNT(id_agendamento) AS total_atendimentos
FROM Atendimento
GROUP BY dia_atendimento
ORDER BY dia_atendimento;

--  Qual a quantidade de atendimentos cada profissional realizou?
SELECT P.nome AS nome_profissional,
COUNT(A.id_agendamento) AS atendimentos_realizados
FROM Profissional P
JOIN Atendimento A ON P.id_profissional = A.feito_por_id_profissional
GROUP BY P.nome
ORDER BY atendimentos_realizados DESC;