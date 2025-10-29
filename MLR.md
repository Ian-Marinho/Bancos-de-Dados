**Modelo 1:**

Clientes(Cliente CPF(nn),Nome, Dt. Nasc, Sexo, Profissão, Email, telefone, endereço, CEP)

Pacote(Id. pacote, nome, valor total, quantidade de sessões, comprador, tipos de procedimentos)
Pacote[Comprador]->Clientes[CPF]
Pacote[tipos de procedimento] -> Procedimento[id. Procedimento]

Procedimento(Id. Procedimento(nn), valor padrão, valor primeira sessão, nome, feito por)
Procedimento[Feito por] -> Profissional[Id. profissional]

Profissional(Id. profissional(nn), Prof. CPF(nn), nome, percentual de comissão)

Pagamento(Valor, data pagamento, forma pagamento, status pagamento, pago por)
Pagamento[pago por] -> Clientes[CPF]

Agendamento(Id. agendamento, data_hora,CPF_cliente)
Agendamento[CPF_cliente] -> Clientes[CPF]

Adquire Pacote( Data aquisição, status do pacote, cod. pacote)
Adquire Pacote[cod. pacote] -> Pacote[id. pacote]



**Modelo 2:**

Clientes(Cliente CPF(nn),Nome, Dt. Nasc, Sexo, Profissão, Email, telefone, endereço, CEP)

Pacote(Id. pacote, nome, valor total, quantidade de sessões, comprador, tipos de procedimentos)
Pacote[Comprador]->Clientes[CPF]
Pacote[tipos de procedimento] -> Procedimento[id. Procedimento]

Procedimento(Id. Procedimento(nn), valor padrão, valor primeira sessão, nome, paciente)
Procedimento[paciente] -> Clientes[CPF]

Profissional(Id. profissional(nn), Prof. CPF(nn), nome, percentual de comissão)

Pagamento(Valor, data pagamento, forma pagamento, status pagamento, pago por)
Pagamento[pago por] -> Clientes[CPF]

Atendimento(Id. agendamento, data_hora,CPF_cliente, feito por)
Atendimento[CPF_cliente] -> Clientes[CPF]
Atendimento[Feito por] -> Profissional[Id. profissional]

Adquire( Data aquisição, status do pacote, cod. pacote, cod. Procedimento)
Adquire Pacote[cod. pacote] -> Pacote[id. pacote]
Adquire[cod. procedimento] -> Procedimento[Id. Procedimento]







