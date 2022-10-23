DROP TABLE IF EXISTS PESSOA CASCADE;
CREATE TABLE PESSOA (
    codigo INT PRIMARY KEY,
    nome VARCHAR
);

DROP TABLE IF EXISTS PRODUTO CASCADE;
CREATE TABLE PRODUTO (
    codigo INT PRIMARY KEY,
    nome VARCHAR,
    preco DOUBLE PRECISION
);

DROP TABLE IF EXISTS CANDIDATO CASCADE;
CREATE TABLE CANDIDATO (
    fk_PESSOA_codigo INT REFERENCES PESSOA (codigo),
    cpf VARCHAR PRIMARY KEY,
    qualificacao_profissional VARCHAR,
    tipo_formacao VARCHAR,
    area_formacao VARCHAR,
    genero VARCHAR
);

DROP TABLE IF EXISTS EMPRESA CASCADE;
CREATE TABLE EMPRESA (
    fk_PESSOA_codigo INT REFERENCES PESSOA (codigo),
    cnpj VARCHAR PRIMARY KEY,
    tipo_empresa VARCHAR
);

DROP TABLE IF EXISTS PESSOA_TELEFONE CASCADE;
CREATE TABLE Pessoa_Telefone (
    fk_PESSOA_codigo INT REFERENCES PESSOA (codigo),
    telefone VARCHAR
);

DROP TABLE IF EXISTS PESSOA_EMAIL CASCADE;
CREATE TABLE Pessoa_Email (
    fk_PESSOA_codigo INT REFERENCES PESSOA (codigo),
    email VARCHAR
);

DROP TABLE IF EXISTS CANDIDATO_EMPRESA CASCADE;
CREATE TABLE Candidato_Empresa (
    fk_CANDIDATO_cpf VARCHAR REFERENCES CANDIDATO (cpf),
    fk_EMPRESA_cnpj VARCHAR REFERENCES EMPRESA (cnpj),
    codigo INT PRIMARY KEY,
    data_hora TIMESTAMP,
    tipo_logradouro VARCHAR,
    nome_logradouro VARCHAR,
    numero_logradouro INT,
    bairro VARCHAR,
    cep INT,
    municipio VARCHAR,
    estado VARCHAR,
    complemento VARCHAR
);

DROP TABLE IF EXISTS PESSOA_PRODUTO CASCADE;
CREATE TABLE Pessoa_Produto (
    fk_PESSOA_codigo INT REFERENCES PESSOA (codigo),
    fk_PRODUTO_codigo INT REFERENCES PRODUTO (codigo),
    codigo INT PRIMARY KEY,
    data_hora TIMESTAMP
);


/* INSERT */

insert into PESSOA (codigo, nome)
VALUES
	(1, 'Wilsiman'),
	(7, 'Hilário'),
	(5, 'Fidelis'),
	(9, 'Raynan'),
	(4, 'Paulo Cezar'),
	(40, 'Gaia AgroTech'),
	(50, 'IFES'),
	(60, 'IMPA'),
	(70, 'Incaper'),
	(80, 'Unicamp');

insert into PRODUTO (codigo, nome, preco)
values
	(534,	'Coca Cola',	6.00),
	(345,	'Água',	4.00),
	(578,	'Livros',	45.00),
	(353,	'Notebook',	1200.00),
	(658,	'Cadeira',	100.00);
	
insert into CANDIDATO (fk_pessoa_codigo, cpf, qualificacao_profissional, tipo_formacao, area_formacao, genero)
VALUES
	(1,	'12234324565',	'desenvolvedor de sistemas',	'ensino técnico',	'informática',	'feminino'),
	(4,	'76576465346',	'professor',	'mestrado',	'matemática',	'masculino'),
	(5,	'56476547654',	'professor',	'doutorado',	'matemática',	'masculino'),
	(7,	'53832447987',	'programador',	'doutorado',	'ciência da computação',	'masculino'),
	(9,	'39897567564',	'programador',	'ensino superior',	'sistemas de informação',	'masculino');
	
insert into EMPRESA (fk_PESSOA_codigo, cnpj, tipo_empresa)
values
	(40,	'65465467000109',	'LTDA'),
	(50,	'10838653000106',	'LTDA'),
	(60,	'03447568000143',	'LTDA'),
	(70,	'27273416000130',	'LTDA'),
	(80,	'46068425000133',	'LTDA');
	
insert into Pessoa_Telefone (fk_PESSOA_codigo, telefone)
values
	(1,	'(27)996570589'),
	(7,	'(27)999999999'),
	(5,	'(27)997980102'),
	(9,	'(27)995273201'),
	(4,	'(27)999769080'),
	(40,	'(27)22342534'),
	(50,	'(27)33577500'),
	(50,	'(27)31829200'),
	(60,	'(21)25295172'),
	(70,	'(27)36369888'),
	(70,	'(27)36369800'),
	(80,	'(19)35217000');
	
insert into Pessoa_Email (fk_PESSOA_codigo, email)
values
	(1,	'wilsiman.evangelista.ifes@gmail.com'),
	(1,	'willsimanevangelista@gmail.com'),
	(7,	'hsjunior@gmail.com'),
	(5,	'fidelis.castro@gmail.com'),
	(9,	'raynan.araujo.ifes@gmail.com'),
	(4,	'pcguedes2016@gmail.com'),
	(40,	'agrotech.gaia@gmail.com'),
	(50,	'dte.sr@ifes.edu.br'),
	(50,	'diretoriaexecutiva@ifes.edu.br'),
	(60,	'imprensa@impa.br'),
	(70,	'diretoria@incaper.es.gov.br'),
	(80,	'sic@unicamp.br');
	
insert into Pessoa_Produto (fk_PESSOA_codigo,	fk_PRODUTO_codigo,	codigo,	data_hora)
values
	(1,	578,	67,	'2016-11-13 10:23:00'),
	(7,	345,	45,	'2015-01-13 13:24:00'),
	(5,	534,	43,	'2022-07-10 15:30:00'),
	(9,	658,	56,	'2020-02-02 14:54:00'),
	(5,	353,	87,	'2020-09-07 19:43:00'),
	(4,	578,	23,	'2016-05-13 20:37:00'),
	(1,	353,	54,	'2007-07-15 11:54:00');
	

insert into Candidato_Empresa (fk_CANDIDATO_cpf,	fk_EMPRESA_cnpj,	codigo,	data_hora,	tipo_logradouro,	nome_logradouro,	numero_logradouro,	bairro,	cep,	municipio,	estado,	complemento)
values
('12234324565',	'65465467000109',	175,	'2022-06-10 10:23:00',	'Avenida',	'Sabiás',	330,	'Morada de Laranjeiras',	29166630,	'Serra',	'Espírito Santo',	'No Leds, dentro do Bloco 8'),
('76576465346',	'10838653000106',	287,	'2022-07-15 13:34:00',	'Avenida',	'Sabiás',	330,	'Morada de Laranjeiras',	29166630,	'Serra',	'Espírito Santo',	'No Auditório dentro do Campus'),
('56476547654',	'03447568000143',	136,	'2022-08-26 15:30:00',	'Estrada',	'Dona Castorina',	110,	'Jardim Botânico',	22460320,	'Rio de Janeiro',	'Rio de Janeiro',	'Na sala de reuniões'),
('53832447987',	'27273416000130',	497,	'2022-06-23 14:54:00',	'Rua',	'Afonso Sarlo',	160,	'Bento Ferreira',	29052010,	'Vitória',	'Espírito Santo',	'Na sala da coordenação'),
('39897567564',	'46068425000133',	285,	'2022-11-13 20:37:00',	'Rua',	'Sérgio Buarque de Holanda',	251,	'Cidade Universitária',	13083859,	'Campinas',	'São Paulo',	'Na sala da direção');

/* Consultas */

/* Cst1 */
select candidato.area_formacao as "Área de formação", count(candidato.area_formacao) as "Quatidade de pessoas na área"
from candidato
inner join  pessoa
ON candidato.fk_pessoa_codigo = pessoa.codigo
group by (candidato.area_formacao)


/* Cst2 */
select candidato.qualificacao_profissional as "Qualificação Profissional", count(candidato.qualificacao_profissional) as "Quantidade  de pessoas com mesma qualificação"
from candidato
inner join pessoa
on candidato.fk_pessoa_codigo = pessoa.codigo
group by (candidato.qualificacao_profissional)

/* Cst3 */
select produto.nome as "Nome do Produto", count(produto.nome)
from pessoa_produto
inner join produto
on produto.codigo = pessoa_produto.fk_produto_codigo
where produto.preco <= 100.00
group by produto.nome
