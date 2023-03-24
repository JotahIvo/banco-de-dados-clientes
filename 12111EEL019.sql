create schema trabalho1;

--criando tabela de clientes
create table trabalho1.clientes(
	id_cliente	integer,
	nome 		varchar(64) constraint nn_nome 			not null,
	telefone	varchar(12) constraint nn_telefone 		not null,
	email 		varchar(64) constraint nn_email 		not null,
	endereco	varchar(64) constraint nn_endereco 		not null,
	cidade 		varchar(64) constraint nn_cidade 		not null,
	cep			varchar(12) constraint nn_cep 			not null,
	constraint pk_id_cliente primary key (id_cliente)
);

--criando tabela de funcionarios
create table trabalho1.funcionarios(
	id_funcionarios	integer,
	nome 			varchar(64) constraint nn_nome 			not null,
	telefone		varchar(12) constraint nn_telefone 		not null,
	email 			varchar(64) constraint nn_email 		not null,
	endereco		varchar(64) constraint nn_endereco 		not null,
	cidade 			varchar(64) constraint nn_cidade 		not null,
	cep				varchar(12) constraint nn_cep 			not null,
	constraint pk_id_funcionarios primary key (id_funcionarios)
);

--criando tabela pedidos
create table trabalho1.pedidos(
	id_pedidos		integer,
	id_cliente 		integer,
	id_funcionarios integer,
	data_compra		timestamp,
	data_envio		timestamp,
	constraint pk_id_pedidos primary key (id_pedidos),
	constraint fk_ped_id_cliente foreign key (id_cliente) references trabalho1.clientes(id_cliente),
	constraint fk_ped_id_funcionarios foreign key (id_funcionarios) 
				references trabalho1.funcionarios(id_funcionarios)
);

--criando tabela produtos
create table trabalho1.produtos(
	id_produtos		integer,
	descricao 		varchar(64) constraint nn_descricao		not null,
	vl_compra 		numeric(12, 2),
	estoque			numeric(12, 2),
	vl_venda		numeric(12, 2),
	constraint pk_id_produtos primary key (id_produtos)
);

--criando tabela itens pedidos
create table trabalho1.itens_pedidos(
	id_itens_pedidos		integer,
	id_pedidos				integer,
	id_produtos				integer,
	quantidade				integer,
	vl_item					numeric(12, 2),
	vl_total				numeric(12, 2),
	desconto 				numeric(12, 2),
	constraint pk_id_itens_pedidos primary key (id_itens_pedidos),
	constraint fk_ip_id_pedidos foreign key (id_pedidos) references trabalho1.pedidos(id_pedidos),
	constraint fk_ip_id_produtos foreign key (id_produtos) references trabalho1.produtos(id_produtos)
);

select * from trabalho1.itens_pedidos;
