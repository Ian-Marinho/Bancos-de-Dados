# BD MLR

## Modelo 3

**Clientes**(<u>ClienteCPF</u>(nn), Nome, Dt.Nasc, Sexo, Profissão, Email, telefone, endereço, CEP)

---

**Serviço**(Data_aquisição, valor, forma_pagamento, data_pagamento, status_pagamento, <u>cod_pacote</u>, <u>cod_Procedimento</u>, <u>C.CPF</u>)

Serviço.Pacote[<u>cod_pacote</u>] → Pacote[id_pacote]  
Serviço[<u>cod_procedimento</u>] → Procedimento[Id_Procedimento]  
Serviço[<u>C.CPF</u>] → Clientes[CPF]

---

**Pacote**(<u>Id_pacote</u>(nn), nome, valor_total, quantidade_de_sessões, status_pct, comprador, tipos_procedimentos)

Pacote[<u>Comprador</u>] → Serviço[C.CPF]  
Pacote[<u>tipos_procedimento</u>] → Procedimento[id_Procedimento]

---

**Procedimento**(<u>Id_Procedimento</u>(nn), valor_padrão, valor_primeira_sessão, nome, paciente)

Procedimento[<u>paciente</u>] → Serviço[C.CPF]

---

**Profissional**(<u>Id_profissional</u>(nn), <u>Prof_CPF</u>(nn), nome, percentual_de_comissão)

---

**Atendimento**(<u>Id_agendamento</u>(nn), data_hora, CPF_cliente, feito_por)

Atendimento[<u>CPF_cliente</u>] → Procedimento[paciente]  
Atendimento[<u>Feito_por</u>] → Profissional[Id_profissional]

---

📘 **Legenda:**  
- `(nn)` = Not Null  
- **negrito** = Chave primária  
- <u>sublinhado</u> = Chave estrangeira  
- Setas (→) = Relacionamentos
