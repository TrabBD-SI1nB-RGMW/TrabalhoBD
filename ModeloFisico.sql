CREATE TABLE Clientes(
    id NUMBER NOT NULL primary key,
    cpf VARCHAR2(14) NOT NULL unique,
    nome VARCHAR2(32) NOT NULL,
    sobrenome VARCHAR2(32) NOT NULL,
    telefone1 VARCHAR2(15) NOT NULL,
    telefone2 VARCHAR2(15),
    email VARCHAR2(60),
    endereco_id NUMBER NOT NULL
);

CREATE TABLE Itens(
    id NUMBER primary key,
    quantidade NUMBER NOT NULL,
    venda_id NUMBER NOT NULL,
    produto_id NUMBER NOT NULL,

    unique(venda_id, produto_id)
);


CREATE TABLE Produtos(
    id NUMBER primary key,
    marca VARCHAR2(32) NOT NULL,
    modelo VARCHAR2(32) NOT NULL,
    valor NUMBER(8, 2) NOT NULL,
    quantidade NUMBER NOT NULL,

    unique(marca, modelo)
);

CREATE TABLE Vendedores(
    id NUMBER primary key,
    matricula VARCHAR2(5) NOT NULL unique,
    cpf VARCHAR2(14) NOT NULL,
    carteira_de_Trabalho VARCHAR2(20) NOT NULL,
    telefone1 VARCHAR2(15) NOT NULL,
    telefone2 VARCHAR2(15),
    email VARCHAR2(60),
    endereco_id NUMBER NOT NULL,
    nome VARCHAR2(32) NOT NULL,
    sobrenome VARCHAR2(32) NOT NULL
);

CREATE TABLE Atendentes(
    id NUMBER primary key,
    matricula VARCHAR2(5) NOT NULL unique,
    cpf VARCHAR2(14) NOT NULL,
    carteira_de_Trabalho VARCHAR2(20) NOT NULL,
    telefone1 VARCHAR2(15) NOT NULL,
    telefone2 VARCHAR2(15),
    email VARCHAR2(60),
    endereco_id NUMBER NOT NULL,
    nome VARCHAR2(32) NOT NULL,
    sobrenome VARCHAR(32) NOT NULL
);

CREATE TABLE Atendimentos(
    id NUMBER primary key,
    protocolo VARCHAR2(32) NOT NULL unique,
    data DATE NOT NULL,
    hora TIMESTAMP NOT NULL,
    motivo VARCHAR2(500) NOT NULL,
    cliente_id NUMBER NOT NULL,
    atendente_id NUMBER NOT NULL
);

CREATE TABLE Vendas(
    id NUMBER primary key,
    nota_fiscal VARCHAR2(44) NOT NULL unique,
    data DATE NOT NULL,
    hora TIMESTAMP NOT NULL,
    total NUMBER(10,2) NOT NULL,
    forma_de_pagamento VARCHAR2(32) NOT NULL,
    cliente_id NUMBER NOT NULL,
    vendedor_id NUMBER NOT NULL
);

CREATE TABLE Enderecos(
    id NUMBER primary key,
    cep VARCHAR2(8) NOT NULL,
    numero NUMBER NOT NULL,
    complemento VARCHAR2(32) NOT NULL,
    rua VARCHAR(32) NOT NULL,
    bairro VARCHAR(32) NOT NULL,
    cidade VARCHAR(32) NOT NULL,
    estado VARCHAR(2) NOT NULL,

    unique(cep, numero, complemento)
);


-- FOREIGN KEYS

-- CLIENTES
alter table Clientes add constraint  fk_endereco_cliente  foreign key(endereco_id) references Enderecos(id);

-- ITENS
alter table Itens add constraint  fk_venda_item  foreign key(venda_id) references Vendas(id);
alter table Itens add constraint  fk_produto_item  foreign key(produto_id) references Produtos(id);

-- FUNCIONARIOS
alter table Vendedores add constraint  fk_endereco_vendedor  foreign key(endereco_id) references Enderecos(id);
alter table Atendentes add constraint  fk_endereco_atendente  foreign key(endereco_id) references Enderecos(id);

-- ATENDIMENTOS
alter table Atendimentos add constraint  fk_atendente_atendimento  foreign key(atendente_id) references Atendentes(id);
alter table Atendimentos add constraint  fk_cliente_atendimento  foreign key(cliente_id) references Clientes(id);

-- VENDAS
alter table Vendas add constraint  fk_vendedor_venda  foreign key(vendedor_id) references Vendedores(id);
alter table Vendas add constraint  fk_cliente_venda  foreign key(cliente_id) references Clientes(id);


-- INSERTS

-- PRODUTOS
insert into Produtos (id, marca, modelo, valor, quantidade) values (1000, 'MAX DENIM', 'CALÇA JEANS', 99.90, 30);
insert into Produtos (id, marca, modelo, valor, quantidade) values (1001, 'WALMISA', 'CAMISA SOCIAL', 79.90, 30);
insert into Produtos (id, marca, modelo, valor, quantidade) values (1002, 'ROVITEX', 'BLUSA MANGA LONGA', 69.90, 20);
insert into Produtos (id, marca, modelo, valor, quantidade) values (1003, 'ROVITEX', 'CASACO', 119.90, 12);
insert into Produtos (id, marca, modelo, valor, quantidade) values (1004, 'ARTEX', 'JOGO CAMA/CASAL 4 PEÇAS', 149.90, 25);
insert into Produtos (id, marca, modelo, valor, quantidade) values (1005, 'TRISOFT', 'TRAVESSEIRO', 49.90, 18);
insert into Produtos (id, marca, modelo, valor, quantidade) values (1006, 'DOMINIUS', 'BERMUDA BRIM', 89.90, 28);
insert into Produtos (id, marca, modelo, valor, quantidade) values (1007, 'TRAMONTINA', 'JOGO DE PANELA INOX', 399.90, 2);
insert into Produtos (id, marca, modelo, valor, quantidade) values (1008, 'PLASUTIL', 'CAIXA ORGANIZADORA G', 49.90, 5);
insert into Produtos (id, marca, modelo, valor, quantidade) values (1009, 'CISPER', 'JOGO DE COPO', 39.90, 15);
insert into Produtos (id, marca, modelo, valor, quantidade) values (1010, 'MARANATA', 'CONJUNTO PARA SOBREMESA', 229.90, 4);
insert into Produtos (id, marca, modelo, valor, quantidade) values (1011, 'TRAMONTINA', 'FAQUEIRO', 149.90, 4);
insert into Produtos (id, marca, modelo, valor, quantidade) values (1012, 'KILDARE', 'SAPATÊNIS', 199.90, 12);
insert into Produtos (id, marca, modelo, valor, quantidade) values (1013, 'VILA FLOR', 'VESTIDO', 89.90, 10);
insert into Produtos (id, marca, modelo, valor, quantidade) values (1014, 'ENDLESS', 'SAIA', 59.90, 8);
insert into Produtos (id, marca, modelo, valor, quantidade) values (1015, 'BRESSAN', 'CUECA BOXER', 29.90, 20);
insert into Produtos (id, marca, modelo, valor, quantidade) values (1016, 'CAMESA', 'MANTA', 49.90, 100);
insert into Produtos (id, marca, modelo, valor, quantidade) values (1017, 'BIONA', 'PRATO', 14.90, 30);
insert into Produtos (id, marca, modelo, valor, quantidade) values (1018, 'PANELUX', 'PANELA DE PRESSÃO', 78.90, 15);
insert into Produtos (id, marca, modelo, valor, quantidade) values (1019, 'MARANATA', 'JOGO TAÇA VINHO', 149.90, 4);

-- ENDERECOS
insert into Enderecos (id, cep, numero,  complemento, rua, bairro, cidade, estado) values (1000, '03426412', '403', 'NENHUM', 'SETE DE SETEMBRO', 'ZONA LESTE', 'PIÚMA', 'MT');
insert into Enderecos (id, cep, numero,  complemento, rua, bairro, cidade, estado) values (1001, '66745537', '32', 'NENHUM', 'SANTA TERESA', 'MARUÍPE', 'IBITIRAMA', 'ES');
insert into Enderecos (id, cep, numero,  complemento, rua, bairro, cidade, estado) values (1002, '36536085', '111', 'APARTAMENTO', 'MISERICÓRDIA', 'JARDIM CAMBURI', 'IUNA', 'MG');
insert into Enderecos (id, cep, numero,  complemento, rua, bairro, cidade, estado) values (1003, '23224462', '105', 'APARTAMENTO', 'MAJOR VIEIRA', 'ZONA LESTE', 'PIÚMA', 'ES');
insert into Enderecos (id, cep, numero,  complemento, rua, bairro, cidade, estado) values (1004, '88545761', '133', 'NENHUM', 'CAMERINO', 'ZONA OESTE', 'ICONHA', 'PR');
insert into Enderecos (id, cep, numero,  complemento, rua, bairro, cidade, estado) values (1005, '43016145', '310', 'CASA', 'ACAICA', 'ZONA LESTE', 'GUARAPARI', 'MG');
insert into Enderecos (id, cep, numero,  complemento, rua, bairro, cidade, estado) values (1006, '00862863', '495', 'BLOCO', 'SANTA TERESA', 'JUCUTUQUARA', 'IUNA', 'PA');
insert into Enderecos (id, cep, numero,  complemento, rua, bairro, cidade, estado) values (1007, '46585425', '462', 'BLOCO', 'SANTA TERESA', 'JARDIM CAMBURI', 'CACHOEIRO', 'BA');
insert into Enderecos (id, cep, numero,  complemento, rua, bairro, cidade, estado) values (1008, '25260255', '241', 'APARTAMENTO', 'COQUEIRO', 'JARDIM CAMBURI', 'ANCHIETA', 'AC');
insert into Enderecos (id, cep, numero,  complemento, rua, bairro, cidade, estado) values (1009, '02435566', '155', 'APARTAMENTO', 'SAO JOÃO', 'JARDIM CAMBURI', 'ICONHA', 'PR');
insert into Enderecos (id, cep, numero,  complemento, rua, bairro, cidade, estado) values (1010, '55455727', '258', 'CASA', 'ARAI', 'GOIABEIRAS', 'ANCHIETA', 'PA');
insert into Enderecos (id, cep, numero,  complemento, rua, bairro, cidade, estado) values (1011, '12525126', '419', 'APARTAMENTO', 'BEM VINDO', 'JARDIM DA PENHA', 'IUNA', 'ES');
insert into Enderecos (id, cep, numero,  complemento, rua, bairro, cidade, estado) values (1012, '06430877', '487', 'CASA', 'ACAICA', 'ZONA OESTE', 'IBITIRAMA', 'MG');
insert into Enderecos (id, cep, numero,  complemento, rua, bairro, cidade, estado) values (1013, '81707510', '122', 'BLOCO', 'SAO PEDRO', 'JUCUTUQUARA', 'CACHOEIRO', 'CE');
insert into Enderecos (id, cep, numero,  complemento, rua, bairro, cidade, estado) values (1014, '55223734', '337', 'APARTAMENTO', 'JOAQUIM SILVA', 'MARUÍPE', 'GUARAPARI', 'SP');
insert into Enderecos (id, cep, numero,  complemento, rua, bairro, cidade, estado) values (1015, '60081743', '141', 'CASA', 'SANTA TERESA', 'GOIABEIRAS', 'COLATINA', 'BA');
insert into Enderecos (id, cep, numero,  complemento, rua, bairro, cidade, estado) values (1016, '68534400', '82', 'BLOCO', 'MAJOR VIEIRA', 'SANTO ANTÔNIO', 'PIÚMA', 'SC');
insert into Enderecos (id, cep, numero,  complemento, rua, bairro, cidade, estado) values (1017, '04706233', '30', 'BLOCO', 'SAO PEDRO', 'ZONA OESTE', 'IUNA', 'MT');
insert into Enderecos (id, cep, numero,  complemento, rua, bairro, cidade, estado) values (1018, '25464564', '433', 'CASA', 'JOAQUIM SILVA', 'JARDIM CAMBURI', 'ICONHA', 'ES');
insert into Enderecos (id, cep, numero,  complemento, rua, bairro, cidade, estado) values (1019, '55187063', '101', 'BLOCO', 'ARAI', 'JARDIM CAMBURI', 'ANCHIETA', 'MG');


-- CLIENTES
insert into Clientes (id, nome, sobrenome, cpf, email, telefone1, endereco_id) values (1000,'ERLON', 'ALVES', '364.655.708-80', 'ERLON.ALVES@uvvnet.com.br', '(01)855554331', 1011);
insert into Clientes (id, nome, sobrenome, cpf, email, telefone1, endereco_id) values (1001,'SUSILEIA', 'SILVEIRA', '250.253.285-66', 'SUSILEIA.SILVEIRA@uvvnet.com.br', '(31)821144862', 1014);
insert into Clientes (id, nome, sobrenome, cpf, email, telefone1, endereco_id) values (1002,'ISAC', 'SANTOS', '886.316.886-67', 'ISAC.SANTOS@uvvnet.com.br', '(03)376025543', 1005);
insert into Clientes (id, nome, sobrenome, cpf, email, telefone1, endereco_id) values (1003,'JOAQUINA', 'SANTOS', '603.612.474-65', 'JOAQUINA.SANTOS@uvvnet.com.br', '(75)802125055', 1004);
insert into Clientes (id, nome, sobrenome, cpf, email, telefone1, endereco_id) values (1004,'RODRIGO', 'SANTOS', '205.141.664-65', 'RODRIGO.SANTOS@uvvnet.com.br', '(73)610575254', 1013);
insert into Clientes (id, nome, sobrenome, cpf, email, telefone1, endereco_id) values (1005,'ANALISE', 'SILVEIRA', '172.707.508-03', 'ANALISE.SILVEIRA@uvvnet.com.br', '(62)848505587', 1003);
insert into Clientes (id, nome, sobrenome, cpf, email, telefone1, endereco_id) values (1006,'MARIANA', 'SILVA', '103.413.332-10', 'MARIANA.SILVA@uvvnet.com.br', '(34)235385427', 1019);
insert into Clientes (id, nome, sobrenome, cpf, email, telefone1, endereco_id) values (1007,'SUSILEIA', 'PINHEIRO', '716.633.348-52', 'SUSILEIA.PINHEIRO@uvvnet.com.br', '(34)260086855', 1018);
insert into Clientes (id, nome, sobrenome, cpf, email, telefone1, endereco_id) values (1008,'ISAC', 'SANTOS', '360.301.484-86', 'ISAC.SANTOS@uvvnet.com.br', '(50)701132074', 1004);
insert into Clientes (id, nome, sobrenome, cpf, email, telefone1, endereco_id) values (1009,'LUCAS', 'ALVES', '713.833.717-06', 'LUCAS.ALVES@uvvnet.com.br', '(17)216873866', 1003);
insert into Clientes (id, nome, sobrenome, cpf, email, telefone1, endereco_id) values (1010,'JORGE', 'SOUSA', '875.877.140-55', 'JORGE.SOUSA@uvvnet.com.br', '(32)335555243', 1002);
insert into Clientes (id, nome, sobrenome, cpf, email, telefone1, endereco_id) values (1011,'MARIANA', 'SOUSA', '452.073.530-56', 'MARIANA.SOUSA@uvvnet.com.br', '(16)886652114', 1012);
insert into Clientes (id, nome, sobrenome, cpf, email, telefone1, endereco_id) values (1012,'JOANA', 'SOUSA', '858.100.160-32', 'JOANA.SOUSA@uvvnet.com.br', '(48)301543701', 1002);
insert into Clientes (id, nome, sobrenome, cpf, email, telefone1, endereco_id) values (1013,'RODRIGO', 'ALVES', '740.766.527-65', 'RODRIGO.ALVES@uvvnet.com.br', '(07)851514137', 1013);
insert into Clientes (id, nome, sobrenome, cpf, email, telefone1, endereco_id) values (1014,'GABI', 'ROCHA', '357.673.742-00', 'GABI.ROCHA@uvvnet.com.br', '(74)860305376', 1005);
insert into Clientes (id, nome, sobrenome, cpf, email, telefone1, endereco_id) values (1015,'CREISSON', 'SANTOS', '835.612.320-76', 'CREISSON.SANTOS@uvvnet.com.br', '(25)503755542', 1000);
insert into Clientes (id, nome, sobrenome, cpf, email, telefone1, endereco_id) values (1016,'THIAGO', 'SOUSA', '106.117.164-44', 'THIAGO.SOUSA@uvvnet.com.br', '(07)757001850', 1016);
insert into Clientes (id, nome, sobrenome, cpf, email, telefone1, endereco_id) values (1017,'JORGE', 'ALVES', '716.648.520-18', 'JORGE.ALVES@uvvnet.com.br', '(01)585871530', 1015);
insert into Clientes (id, nome, sobrenome, cpf, email, telefone1, endereco_id) values (1018,'ALESSANDRO', 'SILVEIRA', '377.032.068-23', 'ALESSANDRO.SILVEIRA@uvvnet.com.br', '(53)012055188', 1003);
insert into Clientes (id, nome, sobrenome, cpf, email, telefone1, endereco_id) values (1019,'JORGE', 'ALVES', '653.236.361-78', 'JORGE.ALVES@uvvnet.com.br', '(73)180866526', 1015);


-- VENDEDORES
insert into Vendedores (id, matricula, cpf, carteira_de_trabalho, telefone1, email, endereco_id, nome, sobrenome) values(1000, '60684', '425.774.544-13', '0268256-4240', '(23)625558417', 'NIELSEN.ROCHA@uvvnet.com.br', '1009', 'NIELSEN', 'ROCHA');
insert into Vendedores (id, matricula, cpf, carteira_de_trabalho, telefone1, email, endereco_id, nome, sobrenome) values(1001, '78067', '047.635.700-21', '0300627-0158', '(11)685381628', 'JOANA.ROCHA@uvvnet.com.br', '1007', 'JOANA', 'ROCHA');
insert into Vendedores (id, matricula, cpf, carteira_de_trabalho, telefone1, email, endereco_id, nome, sobrenome) values(1002, '42221', '014.424.660-32', '1546248-1113', '(64)165281086', 'LUCAS.SILVA@uvvnet.com.br', '1000', 'LUCAS', 'SILVA');
insert into Vendedores (id, matricula, cpf, carteira_de_trabalho, telefone1, email, endereco_id, nome, sobrenome) values(1003, '31214', '532.532.734-37', '1667871-5278', '(10)518353520', 'JOANA.PINHEIRO@uvvnet.com.br', '1007', 'JOANA', 'PINHEIRO');
insert into Vendedores (id, matricula, cpf, carteira_de_trabalho, telefone1, email, endereco_id, nome, sobrenome) values(1004, '66855', '042.580.037-18', '8266011-8451', '(57)047687373', 'ROMULO.CABRAL@uvvnet.com.br', '1009', 'ROMULO', 'CABRAL');
insert into Vendedores (id, matricula, cpf, carteira_de_trabalho, telefone1, email, endereco_id, nome, sobrenome) values(1005, '20555', '445.455.871-50', '4331426-3508', '(72)016485774', 'RODRIGO.SILVA@uvvnet.com.br', '1003', 'RODRIGO', 'SILVA');
insert into Vendedores (id, matricula, cpf, carteira_de_trabalho, telefone1, email, endereco_id, nome, sobrenome) values(1006, '73080', '451.708.405-82', '4842641-8433', '(50)342685151', 'ANALISE.SOUSA@uvvnet.com.br', '1003', 'ANALISE', 'SOUSA');
insert into Vendedores (id, matricula, cpf, carteira_de_trabalho, telefone1, email, endereco_id, nome, sobrenome) values(1007, '12071', '107.602.412-47', '0586077-4223', '(17)004401054', 'ALESSANDRO.SILVA@uvvnet.com.br', '1013', 'ALESSANDRO', 'SILVA');
insert into Vendedores (id, matricula, cpf, carteira_de_trabalho, telefone1, email, endereco_id, nome, sobrenome) values(1008, '07723', '806.735.377-25', '1716217-5460', '(56)434555334', 'JORGE.SOUSA@uvvnet.com.br', '1019', 'JORGE', 'SOUSA');
insert into Vendedores (id, matricula, cpf, carteira_de_trabalho, telefone1, email, endereco_id, nome, sobrenome) values(1009, '55687', '267.112.577-45', '4346532-1255', '(36)108314367', 'MARIA.ROCHA@uvvnet.com.br', '1000', 'MARIA', 'ROCHA');
insert into Vendedores (id, matricula, cpf, carteira_de_trabalho, telefone1, email, endereco_id, nome, sobrenome) values(1010, '73605', '718.380.073-06', '7066243-5645', '(64)168517876', 'GABI.ROCHA@uvvnet.com.br', '1007', 'GABI', 'ROCHA');
insert into Vendedores (id, matricula, cpf, carteira_de_trabalho, telefone1, email, endereco_id, nome, sobrenome) values(1011, '64471', '418.774.578-75', '7830153-6304', '(37)753065231', 'ADRIANO.PINHEIRO@uvvnet.com.br', '1014', 'ADRIANO', 'PINHEIRO');
insert into Vendedores (id, matricula, cpf, carteira_de_trabalho, telefone1, email, endereco_id, nome, sobrenome) values(1012, '01718', '375.331.533-82', '0054267-8832', '(81)375265514', 'CREISSON.SOUSA@uvvnet.com.br', '1004', 'CREISSON', 'SOUSA');
insert into Vendedores (id, matricula, cpf, carteira_de_trabalho, telefone1, email, endereco_id, nome, sobrenome) values(1013, '68750', '772.604.668-60', '1272755-6377', '(73)462426437', 'MARCELO.SILVA@uvvnet.com.br', '1000', 'MARCELO', 'SILVA');
insert into Vendedores (id, matricula, cpf, carteira_de_trabalho, telefone1, email, endereco_id, nome, sobrenome) values(1014, '65086', '702.404.343-31', '5734382-2601', '(11)375240173', 'ROMULO.SANTOS@uvvnet.com.br', '1017', 'ROMULO', 'SANTOS');
insert into Vendedores (id, matricula, cpf, carteira_de_trabalho, telefone1, email, endereco_id, nome, sobrenome) values(1015, '37228', '112.441.715-76', '4243158-1307', '(72)218378407', 'SUSILEIA.SILVA@uvvnet.com.br', '1016', 'SUSILEIA', 'SILVA');
insert into Vendedores (id, matricula, cpf, carteira_de_trabalho, telefone1, email, endereco_id, nome, sobrenome) values(1016, '17784', '064.455.504-64', '3487708-7614', '(42)701112502', 'JULANA.CABRAL@uvvnet.com.br', '1018', 'JULANA', 'CABRAL');
insert into Vendedores (id, matricula, cpf, carteira_de_trabalho, telefone1, email, endereco_id, nome, sobrenome) values(1017, '11447', '567.217.241-43', '0455044-4642', '(82)720588847', 'ERLON.ROCHA@uvvnet.com.br', '1011', 'ERLON', 'ROCHA');
insert into Vendedores (id, matricula, cpf, carteira_de_trabalho, telefone1, email, endereco_id, nome, sobrenome) values(1018, '15557', '675.706.127-72', '8406531-5572', '(85)187722643', 'ISAC.ROCHA@uvvnet.com.br', '1015', 'ISAC', 'ROCHA');
insert into Vendedores (id, matricula, cpf, carteira_de_trabalho, telefone1, email, endereco_id, nome, sobrenome) values(1019, '35327', '063.888.801-57', '4730676-8038', '(85)884880422', 'GABI.CABRAL@uvvnet.com.br', '1013', 'GABI', 'CABRAL');


-- ATENDENDTES
insert into Atendentes (id, matricula, cpf, carteira_de_trabalho, telefone1, email, endereco_id, nome, sobrenome) values(1000, '86366', '240.233.112-45', '1558761-3062', '(60)033353744', 'JOSE.SOUSA@uvvnet.com.br', '1006', 'JOSE', 'SOUSA');
insert into Atendentes (id, matricula, cpf, carteira_de_trabalho, telefone1, email, endereco_id, nome, sobrenome) values(1001, '62424', '032.421.320-80', '5547881-0381', '(66)117876611', 'ERLON.SILVA@uvvnet.com.br', '1008', 'ERLON', 'SILVA');
insert into Atendentes (id, matricula, cpf, carteira_de_trabalho, telefone1, email, endereco_id, nome, sobrenome) values(1002, '74360', '036.858.356-14', '8763113-6385', '(22)824405848', 'ROMULO.CABRAL@uvvnet.com.br', '1006', 'ROMULO', 'CABRAL');
insert into Atendentes (id, matricula, cpf, carteira_de_trabalho, telefone1, email, endereco_id, nome, sobrenome) values(1003, '26088', '527.815.413-10', '8476384-0113', '(16)160758535', 'GABI.ROCHA@uvvnet.com.br', '1000', 'GABI', 'ROCHA');
insert into Atendentes (id, matricula, cpf, carteira_de_trabalho, telefone1, email, endereco_id, nome, sobrenome) values(1004, '36246', '056.741.346-57', '3560030-5551', '(31)701557402', 'MARIA.SILVA@uvvnet.com.br', '1015', 'MARIA', 'SILVA');
insert into Atendentes (id, matricula, cpf, carteira_de_trabalho, telefone1, email, endereco_id, nome, sobrenome) values(1005, '51411', '820.108.517-85', '6861371-6388', '(43)781116140', 'SUSILEIA.CABRAL@uvvnet.com.br', '1004', 'SUSILEIA', 'CABRAL');
insert into Atendentes (id, matricula, cpf, carteira_de_trabalho, telefone1, email, endereco_id, nome, sobrenome) values(1006, '77151', '352.750.155-86', '8355601-0856', '(58)408065410', 'NIELSEN.CABRAL@uvvnet.com.br', '1014', 'NIELSEN', 'CABRAL');
insert into Atendentes (id, matricula, cpf, carteira_de_trabalho, telefone1, email, endereco_id, nome, sobrenome) values(1007, '56188', '464.750.850-62', '6743815-3262', '(28)604387664', 'CREISSON.ROCHA@uvvnet.com.br', '1017', 'CREISSON', 'ROCHA');
insert into Atendentes (id, matricula, cpf, carteira_de_trabalho, telefone1, email, endereco_id, nome, sobrenome) values(1008, '34427', '434.443.123-85', '6615751-1332', '(28)466578182', 'SUSILEIA.PINHEIRO@uvvnet.com.br', '1003', 'SUSILEIA', 'PINHEIRO');
insert into Atendentes (id, matricula, cpf, carteira_de_trabalho, telefone1, email, endereco_id, nome, sobrenome) values(1009, '50881', '277.484.184-07', '1083571-1415', '(15)874234238', 'CREISSON.SANTOS@uvvnet.com.br', '1015', 'CREISSON', 'SANTOS');
insert into Atendentes (id, matricula, cpf, carteira_de_trabalho, telefone1, email, endereco_id, nome, sobrenome) values(1010, '07348', '208.582.053-30', '0336584-7840', '(24)317265655', 'CREISSON.SOUSA@uvvnet.com.br', '1004', 'CREISSON', 'SOUSA');
insert into Atendentes (id, matricula, cpf, carteira_de_trabalho, telefone1, email, endereco_id, nome, sobrenome) values(1011, '85763', '788.835.884-23', '1862813-2031', '(05)835454123', 'ADRIANO.CABRAL@uvvnet.com.br', '1006', 'ADRIANO', 'CABRAL');
insert into Atendentes (id, matricula, cpf, carteira_de_trabalho, telefone1, email, endereco_id, nome, sobrenome) values(1012, '13235', '766.628.034-26', '3516727-8573', '(14)547051462', 'RICARDO.SILVEIRA@uvvnet.com.br', '1011', 'RICARDO', 'SILVEIRA');
insert into Atendentes (id, matricula, cpf, carteira_de_trabalho, telefone1, email, endereco_id, nome, sobrenome) values(1013, '56628', '763.501.287-08', '0566570-3400', '(74)766178127', 'JULANA.SILVEIRA@uvvnet.com.br', '1009', 'JULANA', 'SILVEIRA');
insert into Atendentes (id, matricula, cpf, carteira_de_trabalho, telefone1, email, endereco_id, nome, sobrenome) values(1014, '88546', '247.741.033-21', '3577875-8512', '(83)328473466', 'GABI.SOUSA@uvvnet.com.br', '1016', 'GABI', 'SOUSA');
insert into Atendentes (id, matricula, cpf, carteira_de_trabalho, telefone1, email, endereco_id, nome, sobrenome) values(1015, '15286', '657.574.570-04', '0545620-3664', '(78)165634832', 'NIELSEN.SOUSA@uvvnet.com.br', '1006', 'NIELSEN', 'SOUSA');
insert into Atendentes (id, matricula, cpf, carteira_de_trabalho, telefone1, email, endereco_id, nome, sobrenome) values(1016, '86062', '023.124.638-32', '2785566-0650', '(82)025060142', 'CREISSON.SILVEIRA@uvvnet.com.br', '1009', 'CREISSON', 'SILVEIRA');
insert into Atendentes (id, matricula, cpf, carteira_de_trabalho, telefone1, email, endereco_id, nome, sobrenome) values(1017, '73173', '411.257.760-60', '6733075-3508', '(75)384831362', 'ADRIANO.PINHEIRO@uvvnet.com.br', '1008', 'ADRIANO', 'PINHEIRO');
insert into Atendentes (id, matricula, cpf, carteira_de_trabalho, telefone1, email, endereco_id, nome, sobrenome) values(1018, '00324', '375.007.484-07', '2470066-5104', '(82)755004754', 'JORGE.SANTOS@uvvnet.com.br', '1006', 'JORGE', 'SANTOS');
insert into Atendentes (id, matricula, cpf, carteira_de_trabalho, telefone1, email, endereco_id, nome, sobrenome) values(1019, '86264', '774.453.132-25', '4403035-1573', '(66)118386318', 'MARIANA.SILVA@uvvnet.com.br', '1014', 'MARIANA', 'SILVA');


-- VENDAS
insert into Vendas (id, nota_fiscal, data, hora, total, forma_de_pagamento, cliente_id, vendedor_id) values (1000, '23168126470500860177806571014172306614253566', TO_DATE('16/10/2020', 'DD/MM/YYYY'), TO_TIMESTAMP('2:45:53', 'HH24:MI:SS'), 381.65, 'A VISTA', 1014, 1008);
insert into Vendas (id, nota_fiscal, data, hora, total, forma_de_pagamento, cliente_id, vendedor_id) values (1001, '76411825302258844450864018443757403850081537', TO_DATE('6/7/2020', 'DD/MM/YYYY'), TO_TIMESTAMP('13:47:5', 'HH24:MI:SS'), 185.92, 'PARCELADO', 1015, 1012);
insert into Vendas (id, nota_fiscal, data, hora, total, forma_de_pagamento, cliente_id, vendedor_id) values (1002, '71686121710827137516071075381022274048840412', TO_DATE('22/2/2020', 'DD/MM/YYYY'), TO_TIMESTAMP('3:21:18', 'HH24:MI:SS'), 409.97, 'CARTAO', 1012, 1014);
insert into Vendas (id, nota_fiscal, data, hora, total, forma_de_pagamento, cliente_id, vendedor_id) values (1003, '76076456803677462204347812008636502314573774', TO_DATE('14/6/2020', 'DD/MM/YYYY'), TO_TIMESTAMP('10:45:52', 'HH24:MI:SS'), 440.27, 'CARTAO', 1014, 1010);
insert into Vendas (id, nota_fiscal, data, hora, total, forma_de_pagamento, cliente_id, vendedor_id) values (1004, '45437460808534623161451447310261855616721400', TO_DATE('2/7/2020', 'DD/MM/YYYY'), TO_TIMESTAMP('18:48:4', 'HH24:MI:SS'), 39.48, 'PARCELADO', 1012, 1007);
insert into Vendas (id, nota_fiscal, data, hora, total, forma_de_pagamento, cliente_id, vendedor_id) values (1005, '36324840810280124548538427012262476267320280', TO_DATE('7/5/2020', 'DD/MM/YYYY'), TO_TIMESTAMP('10:36:46', 'HH24:MI:SS'), 240.96, 'PARCELADO', 1002, 1009);
insert into Vendas (id, nota_fiscal, data, hora, total, forma_de_pagamento, cliente_id, vendedor_id) values (1006, '34764362326370384821312750536701815238681445', TO_DATE('7/12/2020', 'DD/MM/YYYY'), TO_TIMESTAMP('18:38:35', 'HH24:MI:SS'), 603.15, 'A VISTA', 1000, 1004);
insert into Vendas (id, nota_fiscal, data, hora, total, forma_de_pagamento, cliente_id, vendedor_id) values (1007, '04552814882138228350033523287055022702606872', TO_DATE('11/3/2020', 'DD/MM/YYYY'), TO_TIMESTAMP('3:40:42', 'HH24:MI:SS'), 626.30, 'CARTAO', 1006, 1010);
insert into Vendas (id, nota_fiscal, data, hora, total, forma_de_pagamento, cliente_id, vendedor_id) values (1008, '80741568618180578636523370401332021543082254', TO_DATE('24/10/2020', 'DD/MM/YYYY'), TO_TIMESTAMP('10:6:24', 'HH24:MI:SS'), 254.34, 'A VISTA', 1004, 1004);
insert into Vendas (id, nota_fiscal, data, hora, total, forma_de_pagamento, cliente_id, vendedor_id) values (1009, '65532185611084788323006844588548737813673865', TO_DATE('12/5/2020', 'DD/MM/YYYY'), TO_TIMESTAMP('4:6:50', 'HH24:MI:SS'), 42.08, 'A VISTA', 1004, 1007);
insert into Vendas (id, nota_fiscal, data, hora, total, forma_de_pagamento, cliente_id, vendedor_id) values (1010, '76580711465237185756041141767826006164232874', TO_DATE('2/10/2020', 'DD/MM/YYYY'), TO_TIMESTAMP('18:45:12', 'HH24:MI:SS'), 663.04, 'A VISTA', 1016, 1018);
insert into Vendas (id, nota_fiscal, data, hora, total, forma_de_pagamento, cliente_id, vendedor_id) values (1011, '01266485724004153103036782815061373000052572', TO_DATE('26/11/2020', 'DD/MM/YYYY'), TO_TIMESTAMP('8:50:53', 'HH24:MI:SS'), 65.75, 'CARTAO', 1000, 1017);
insert into Vendas (id, nota_fiscal, data, hora, total, forma_de_pagamento, cliente_id, vendedor_id) values (1012, '71284151348024204630157751834360443352388414', TO_DATE('9/6/2020', 'DD/MM/YYYY'), TO_TIMESTAMP('18:43:11', 'HH24:MI:SS'), 44.43, 'CARTAO', 1005, 1003);
insert into Vendas (id, nota_fiscal, data, hora, total, forma_de_pagamento, cliente_id, vendedor_id) values (1013, '60271276040433133762253623643756342716063787', TO_DATE('7/8/2020', 'DD/MM/YYYY'), TO_TIMESTAMP('17:44:53', 'HH24:MI:SS'), 164.67, 'PARCELADO', 1016, 1011);
insert into Vendas (id, nota_fiscal, data, hora, total, forma_de_pagamento, cliente_id, vendedor_id) values (1014, '05715014605577637545164040310361457645168731', TO_DATE('12/9/2020', 'DD/MM/YYYY'), TO_TIMESTAMP('8:41:5', 'HH24:MI:SS'), 733.46, 'A VISTA', 1010, 1015);
insert into Vendas (id, nota_fiscal, data, hora, total, forma_de_pagamento, cliente_id, vendedor_id) values (1015, '81013885561531750886151868005745121725113225', TO_DATE('16/10/2020', 'DD/MM/YYYY'), TO_TIMESTAMP('15:17:23', 'HH24:MI:SS'), 780.93, 'A VISTA', 1013, 1017);
insert into Vendas (id, nota_fiscal, data, hora, total, forma_de_pagamento, cliente_id, vendedor_id) values (1016, '74078843875217783470017883715823287637585583', TO_DATE('3/6/2020', 'DD/MM/YYYY'), TO_TIMESTAMP('11:0:51', 'HH24:MI:SS'), 349.76, 'CARTAO', 1014, 1012);
insert into Vendas (id, nota_fiscal, data, hora, total, forma_de_pagamento, cliente_id, vendedor_id) values (1017, '27166203812150488412578677012253372270400173', TO_DATE('26/10/2020', 'DD/MM/YYYY'), TO_TIMESTAMP('5:36:19', 'HH24:MI:SS'), 785.87, 'PARCELADO', 1019, 1008);
insert into Vendas (id, nota_fiscal, data, hora, total, forma_de_pagamento, cliente_id, vendedor_id) values (1018, '17837250128080711860347340458628747305386055', TO_DATE('13/6/2020', 'DD/MM/YYYY'), TO_TIMESTAMP('13:1:31', 'HH24:MI:SS'), 32.66, 'CARTAO', 1015, 1006);
insert into Vendas (id, nota_fiscal, data, hora, total, forma_de_pagamento, cliente_id, vendedor_id) values (1019, '03143275624443365105880287020606663381740285', TO_DATE('5/12/2020', 'DD/MM/YYYY'), TO_TIMESTAMP('22:13:50', 'HH24:MI:SS'), 81.03, 'A VISTA', 1001, 1005);
insert into Vendas (id, nota_fiscal, data, hora, total, forma_de_pagamento, cliente_id, vendedor_id) values (1020, '18007845406801385401830277542002774717321167', TO_DATE('18/2/2020', 'DD/MM/YYYY'), TO_TIMESTAMP('14:50:2', 'HH24:MI:SS'), 627.46, 'PARCELADO', 1010, 1019);
insert into Vendas (id, nota_fiscal, data, hora, total, forma_de_pagamento, cliente_id, vendedor_id) values (1021, '68667448755841763383720473422570046026215250', TO_DATE('28/12/2020', 'DD/MM/YYYY'), TO_TIMESTAMP('13:22:52', 'HH24:MI:SS'), 360.04, 'PARCELADO', 1017, 1009);
insert into Vendas (id, nota_fiscal, data, hora, total, forma_de_pagamento, cliente_id, vendedor_id) values (1022, '22207675825784020838415728547385275857276523', TO_DATE('7/10/2020', 'DD/MM/YYYY'), TO_TIMESTAMP('7:48:33', 'HH24:MI:SS'), 749.50, 'CARTAO', 1003, 1016);
insert into Vendas (id, nota_fiscal, data, hora, total, forma_de_pagamento, cliente_id, vendedor_id) values (1023, '23102846238817138002644685022681058546250103', TO_DATE('24/1/2020', 'DD/MM/YYYY'), TO_TIMESTAMP('22:21:16', 'HH24:MI:SS'), 630.48, 'CARTAO', 1018, 1001);
insert into Vendas (id, nota_fiscal, data, hora, total, forma_de_pagamento, cliente_id, vendedor_id) values (1024, '72303285336623127610671105726446378088854610', TO_DATE('6/1/2020', 'DD/MM/YYYY'), TO_TIMESTAMP('6:25:3', 'HH24:MI:SS'), 412.27, 'PARCELADO', 1001, 1003);
insert into Vendas (id, nota_fiscal, data, hora, total, forma_de_pagamento, cliente_id, vendedor_id) values (1025, '86864684085521102743166883534221766131150887', TO_DATE('31/10/2020', 'DD/MM/YYYY'), TO_TIMESTAMP('10:26:39', 'HH24:MI:SS'), 10.87, 'A VISTA', 1004, 1010);
insert into Vendas (id, nota_fiscal, data, hora, total, forma_de_pagamento, cliente_id, vendedor_id) values (1026, '74220411357317048570574468473221148745545244', TO_DATE('17/8/2020', 'DD/MM/YYYY'), TO_TIMESTAMP('4:14:44', 'HH24:MI:SS'), 126.42, 'CARTAO', 1003, 1006);
insert into Vendas (id, nota_fiscal, data, hora, total, forma_de_pagamento, cliente_id, vendedor_id) values (1027, '14871264181540436404854123006043671048075634', TO_DATE('7/3/2020', 'DD/MM/YYYY'), TO_TIMESTAMP('17:13:6', 'HH24:MI:SS'), 782.07, 'PARCELADO', 1006, 1007);
insert into Vendas (id, nota_fiscal, data, hora, total, forma_de_pagamento, cliente_id, vendedor_id) values (1028, '85762588252835613656877756100584802501225874', TO_DATE('2/1/2020', 'DD/MM/YYYY'), TO_TIMESTAMP('15:17:29', 'HH24:MI:SS'), 388.37, 'CARTAO', 1019, 1006);
insert into Vendas (id, nota_fiscal, data, hora, total, forma_de_pagamento, cliente_id, vendedor_id) values (1029, '25412626636181180420165730841465316174258382', TO_DATE('21/2/2020', 'DD/MM/YYYY'), TO_TIMESTAMP('6:38:52', 'HH24:MI:SS'), 351.51, 'PARCELADO', 1018, 1013);

-- ATENDIMENTOS
insert into Atendimentos (id, protocolo, data, hora, motivo, cliente_id, atendente_id) values (1000, '141021823', TO_DATE('29/5/2020', 'DD/MM/YYYY'), TO_TIMESTAMP('16:26:15', 'HH24:MI:SS'), 'RECLAMAÇÃO DE UM DEFEITO NO PRODUTO', 1019, 1011);
insert into Atendimentos (id, protocolo, data, hora, motivo, cliente_id, atendente_id) values (1001, '003288775', TO_DATE('2/11/2020', 'DD/MM/YYYY'), TO_TIMESTAMP('18:43:11', 'HH24:MI:SS'), 'DUVIDA SE HÁ UM PRODUTO DE UMA CERTA NUMERAÇÃO', 1010, 1003);
insert into Atendimentos (id, protocolo, data, hora, motivo, cliente_id, atendente_id) values (1002, '555562711', TO_DATE('7/2/2020', 'DD/MM/YYYY'), TO_TIMESTAMP('19:25:49', 'HH24:MI:SS'), 'DUVIDA SOBRE O HORÁRIO DE FUNCIONAMENTO DA LOJA', 1006, 1017);
insert into Atendimentos (id, protocolo, data, hora, motivo, cliente_id, atendente_id) values (1003, '272533277', TO_DATE('27/8/2020', 'DD/MM/YYYY'), TO_TIMESTAMP('21:47:43', 'HH24:MI:SS'), 'DUVIDA SE HÁ UM PRODUTO DE UMA CERTA NUMERAÇÃO', 1005, 1004);
insert into Atendimentos (id, protocolo, data, hora, motivo, cliente_id, atendente_id) values (1004, '134567563', TO_DATE('25/11/2020', 'DD/MM/YYYY'), TO_TIMESTAMP('16:8:50', 'HH24:MI:SS'), 'DUVIDA SE HÁ UM PRODUTO DE UMA CERTA NUMERAÇÃO', 1008, 1003);
insert into Atendimentos (id, protocolo, data, hora, motivo, cliente_id, atendente_id) values (1005, '622411552', TO_DATE('23/12/2020', 'DD/MM/YYYY'), TO_TIMESTAMP('8:40:22', 'HH24:MI:SS'), 'DUVIDA SOBRE O PREÇO DE UM PRODUTO', 1011, 1005);
insert into Atendimentos (id, protocolo, data, hora, motivo, cliente_id, atendente_id) values (1006, '272362216', TO_DATE('8/2/2020', 'DD/MM/YYYY'), TO_TIMESTAMP('18:47:31', 'HH24:MI:SS'), 'RECLAMAÇÃO DE UM DEFEITO NO PRODUTO', 1010, 1002);
insert into Atendimentos (id, protocolo, data, hora, motivo, cliente_id, atendente_id) values (1007, '307622663', TO_DATE('23/7/2020', 'DD/MM/YYYY'), TO_TIMESTAMP('1:46:52', 'HH24:MI:SS'), 'RECLAMAÇÃO DE UM FUNCIONÁRIO/ATENDIMENTO', 1003, 1014);
insert into Atendimentos (id, protocolo, data, hora, motivo, cliente_id, atendente_id) values (1008, '614502505', TO_DATE('25/11/2020', 'DD/MM/YYYY'), TO_TIMESTAMP('21:42:53', 'HH24:MI:SS'), 'DUVIDA SOBRE O PREÇO DE UM PRODUTO', 1001, 1008);
insert into Atendimentos (id, protocolo, data, hora, motivo, cliente_id, atendente_id) values (1009, '377236730', TO_DATE('19/8/2020', 'DD/MM/YYYY'), TO_TIMESTAMP('17:32:23', 'HH24:MI:SS'), 'DUVIDA SOBRE O HORÁRIO DE FUNCIONAMENTO DA LOJA', 1013, 1006);
insert into Atendimentos (id, protocolo, data, hora, motivo, cliente_id, atendente_id) values (1010, '540362307', TO_DATE('8/3/2020', 'DD/MM/YYYY'), TO_TIMESTAMP('22:36:31', 'HH24:MI:SS'), 'RECLAMAÇÃO DE UM FUNCIONÁRIO/ATENDIMENTO', 1001, 1017);
insert into Atendimentos (id, protocolo, data, hora, motivo, cliente_id, atendente_id) values (1011, '588001712', TO_DATE('27/3/2020', 'DD/MM/YYYY'), TO_TIMESTAMP('21:8:43', 'HH24:MI:SS'), 'RECLAMAÇÃO DE UM FUNCIONÁRIO/ATENDIMENTO', 1005, 1001);
insert into Atendimentos (id, protocolo, data, hora, motivo, cliente_id, atendente_id) values (1012, '327688403', TO_DATE('18/2/2020', 'DD/MM/YYYY'), TO_TIMESTAMP('7:32:28', 'HH24:MI:SS'), 'DUVIDA SE HÁ DISPONIBILIDADE DE UM DETERMINADO PRODUTO NO ESTOQUE/QUANDO CHEGA', 1003, 1013);
insert into Atendimentos (id, protocolo, data, hora, motivo, cliente_id, atendente_id) values (1013, '377138023', TO_DATE('11/7/2020', 'DD/MM/YYYY'), TO_TIMESTAMP('18:46:24', 'HH24:MI:SS'), 'DUVIDA SE HÁ DISPONIBILIDADE DE UM DETERMINADO PRODUTO NO ESTOQUE/QUANDO CHEGA', 1009, 1012);
insert into Atendimentos (id, protocolo, data, hora, motivo, cliente_id, atendente_id) values (1014, '146130665', TO_DATE('11/5/2020', 'DD/MM/YYYY'), TO_TIMESTAMP('4:36:39', 'HH24:MI:SS'), 'RECLAMAÇÃO DE UM DEFEITO NO PRODUTO', 1003, 1017);
insert into Atendimentos (id, protocolo, data, hora, motivo, cliente_id, atendente_id) values (1015, '610601650', TO_DATE('22/12/2020', 'DD/MM/YYYY'), TO_TIMESTAMP('3:3:40', 'HH24:MI:SS'), 'DUVIDA SE HÁ UM PRODUTO DE UMA CERTA NUMERAÇÃO', 1002, 1007);
insert into Atendimentos (id, protocolo, data, hora, motivo, cliente_id, atendente_id) values (1016, '501258860', TO_DATE('3/3/2020', 'DD/MM/YYYY'), TO_TIMESTAMP('1:21:36', 'HH24:MI:SS'), 'DUVIDA SE HÁ UM PRODUTO DE UMA CERTA NUMERAÇÃO', 1010, 1010);
insert into Atendimentos (id, protocolo, data, hora, motivo, cliente_id, atendente_id) values (1017, '812615878', TO_DATE('11/5/2020', 'DD/MM/YYYY'), TO_TIMESTAMP('14:26:9', 'HH24:MI:SS'), 'DUVIDA SE HÁ UM PRODUTO DE UMA CERTA NUMERAÇÃO', 1018, 1006);
insert into Atendimentos (id, protocolo, data, hora, motivo, cliente_id, atendente_id) values (1018, '707371408', TO_DATE('12/11/2020', 'DD/MM/YYYY'), TO_TIMESTAMP('9:16:15', 'HH24:MI:SS'), 'RECLAMAÇÃO DE UM FUNCIONÁRIO/ATENDIMENTO', 1003, 1015);
insert into Atendimentos (id, protocolo, data, hora, motivo, cliente_id, atendente_id) values (1019, '760336017', TO_DATE('15/7/2020', 'DD/MM/YYYY'), TO_TIMESTAMP('8:16:56', 'HH24:MI:SS'), 'RECLAMAÇÃO DE UM DEFEITO NO PRODUTO', 1007, 1001);
insert into Atendimentos (id, protocolo, data, hora, motivo, cliente_id, atendente_id) values (1020, '368228747', TO_DATE('8/6/2020', 'DD/MM/YYYY'), TO_TIMESTAMP('20:7:45', 'HH24:MI:SS'), 'DUVIDA SE HÁ DISPONIBILIDADE DE UM DETERMINADO PRODUTO NO ESTOQUE/QUANDO CHEGA', 1016, 1003);
insert into Atendimentos (id, protocolo, data, hora, motivo, cliente_id, atendente_id) values (1021, '781600831', TO_DATE('14/12/2020', 'DD/MM/YYYY'), TO_TIMESTAMP('21:29:6', 'HH24:MI:SS'), 'DUVIDA SOBRE O PREÇO DE UM PRODUTO', 1018, 1004);
insert into Atendimentos (id, protocolo, data, hora, motivo, cliente_id, atendente_id) values (1022, '335220540', TO_DATE('6/2/2020', 'DD/MM/YYYY'), TO_TIMESTAMP('18:56:48', 'HH24:MI:SS'), 'DUVIDA SE HÁ DISPONIBILIDADE DE UM DETERMINADO PRODUTO NO ESTOQUE/QUANDO CHEGA', 1008, 1018);
insert into Atendimentos (id, protocolo, data, hora, motivo, cliente_id, atendente_id) values (1023, '718512452', TO_DATE('10/7/2020', 'DD/MM/YYYY'), TO_TIMESTAMP('20:22:4', 'HH24:MI:SS'), 'DUVIDA SE HÁ UM PRODUTO DE UMA CERTA NUMERAÇÃO', 1016, 1015);
insert into Atendimentos (id, protocolo, data, hora, motivo, cliente_id, atendente_id) values (1024, '350476023', TO_DATE('2/2/2020', 'DD/MM/YYYY'), TO_TIMESTAMP('10:50:33', 'HH24:MI:SS'), 'DUVIDA SE HÁ UM PRODUTO DE UMA CERTA NUMERAÇÃO', 1000, 1010);
insert into Atendimentos (id, protocolo, data, hora, motivo, cliente_id, atendente_id) values (1025, '226307300', TO_DATE('26/11/2020', 'DD/MM/YYYY'), TO_TIMESTAMP('14:39:35', 'HH24:MI:SS'), 'RECLAMAÇÃO DE UM FUNCIONÁRIO/ATENDIMENTO', 1011, 1005);
insert into Atendimentos (id, protocolo, data, hora, motivo, cliente_id, atendente_id) values (1026, '152066422', TO_DATE('3/9/2020', 'DD/MM/YYYY'), TO_TIMESTAMP('6:27:25', 'HH24:MI:SS'), 'RECLAMAÇÃO DE UM FUNCIONÁRIO/ATENDIMENTO', 1012, 1005);
insert into Atendimentos (id, protocolo, data, hora, motivo, cliente_id, atendente_id) values (1027, '103530286', TO_DATE('25/7/2020', 'DD/MM/YYYY'), TO_TIMESTAMP('8:12:37', 'HH24:MI:SS'), 'DUVIDA SOBRE O HORÁRIO DE FUNCIONAMENTO DA LOJA', 1014, 1008);
insert into Atendimentos (id, protocolo, data, hora, motivo, cliente_id, atendente_id) values (1028, '251742806', TO_DATE('19/11/2020', 'DD/MM/YYYY'), TO_TIMESTAMP('9:4:21', 'HH24:MI:SS'), 'RECLAMAÇÃO DE UM DEFEITO NO PRODUTO', 1010, 1014);
insert into Atendimentos (id, protocolo, data, hora, motivo, cliente_id, atendente_id) values (1029, '676508383', TO_DATE('31/7/2020', 'DD/MM/YYYY'), TO_TIMESTAMP('18:0:48', 'HH24:MI:SS'), 'DUVIDA SE HÁ UM PRODUTO DE UMA CERTA NUMERAÇÃO', 1003, 1019);


-- ITENS
insert into Itens (id, quantidade, venda_id, produto_id) values (1000, 29, 1017, 1013);
insert into Itens (id, quantidade, venda_id, produto_id) values (1001, 96, 1004, 1007);
insert into Itens (id, quantidade, venda_id, produto_id) values (1002, 74, 1009, 1015);
insert into Itens (id, quantidade, venda_id, produto_id) values (1003, 40, 1006, 1006);
insert into Itens (id, quantidade, venda_id, produto_id) values (1004, 13, 1018, 1002);
insert into Itens (id, quantidade, venda_id, produto_id) values (1005, 98, 1011, 1013);
insert into Itens (id, quantidade, venda_id, produto_id) values (1006, 54, 1011, 1019);
insert into Itens (id, quantidade, venda_id, produto_id) values (1007, 68, 1007, 1001);
insert into Itens (id, quantidade, venda_id, produto_id) values (1008, 41, 1008, 1012);
insert into Itens (id, quantidade, venda_id, produto_id) values (1009, 30, 1004, 1010);
insert into Itens (id, quantidade, venda_id, produto_id) values (1010, 20, 1014, 1010);
insert into Itens (id, quantidade, venda_id, produto_id) values (1011, 19, 1017, 1006);
insert into Itens (id, quantidade, venda_id, produto_id) values (1012, 84, 1000, 1010);
insert into Itens (id, quantidade, venda_id, produto_id) values (1013, 85, 1001, 1014);
insert into Itens (id, quantidade, venda_id, produto_id) values (1014, 66, 1019, 1016);
insert into Itens (id, quantidade, venda_id, produto_id) values (1015, 41, 1003, 1012);
insert into Itens (id, quantidade, venda_id, produto_id) values (1016, 87, 1016, 1001);
insert into Itens (id, quantidade, venda_id, produto_id) values (1017, 35, 1000, 1009);
insert into Itens (id, quantidade, venda_id, produto_id) values (1018, 85, 1015, 1015);
insert into Itens (id, quantidade, venda_id, produto_id) values (1019, 85, 1002, 1005);
insert into Itens (id, quantidade, venda_id, produto_id) values (1020, 34, 1004, 1015);
insert into Itens (id, quantidade, venda_id, produto_id) values (1021, 76, 1001, 1004);
insert into Itens (id, quantidade, venda_id, produto_id) values (1022, 22, 1012, 1013);
insert into Itens (id, quantidade, venda_id, produto_id) values (1023, 54, 1006, 1007);
insert into Itens (id, quantidade, venda_id, produto_id) values (1024, 7, 1017, 1005);
insert into Itens (id, quantidade, venda_id, produto_id) values (1025, 51, 1002, 1001);
insert into Itens (id, quantidade, venda_id, produto_id) values (1026, 19, 1019, 1007);
insert into Itens (id, quantidade, venda_id, produto_id) values (1027, 22, 1015, 1011);
insert into Itens (id, quantidade, venda_id, produto_id) values (1028, 10, 1002, 1000);
insert into Itens (id, quantidade, venda_id, produto_id) values (1029, 32, 1007, 1015);
