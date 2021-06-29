create database bd_abcnoite2
default character set utf8
default collate utf8_general_ci;

use bd_abcnoite2;

create table tb_cliente(
pk_codcliente int(4) zerofill not null auto_increment primary key,
nome varchar(100) not null,
cpf char(14) not null,
senha varchar(16) not null
)engine = InnoDB;

create table tb_contato(
pk_codcontato int(4) zerofill not null auto_increment primary key,
ddd tinyint(2) not null,
numero varchar(15) not null,
tipo varchar(50),
email varchar(100)
)engine = InnoDB;

create table tb_endereco(
pk_codendereco int(4) zerofill not null auto_increment primary key,
rua varchar(255) not null,
numero int(6) not null,
complemento varchar(100),
cep char(9) not null,
bairro varchar(150) not null,
cidade varchar(100) not null
)engine = InnoDB;

create table tb_cargo(
pk_codcargo int(4) zerofill not null auto_increment primary key,
nome varchar(150) not null,
pisosalarial decimal(7,2)
)engine = InnoDB;

create table tb_funcionario(
pk_codfuncionario int(4) zerofill not null auto_increment primary key,
nome varchar(100) not null,
cpf char(14) not null,
senha varchar(16) not null,
fk_codfuncionariogerente int(4) zerofill,
fk_codcargo int(4) zerofill not null,
fk_codendereco int(4) zerofill not null,
foreign key (fk_codfuncionariogerente) references tb_funcionario(pk_codfuncionario),
foreign key (fk_codcargo) references tb_cargo(pk_codcargo),
foreign key (fk_codendereco) references tb_endereco(pk_codendereco)
)engine = InnoDB;

create table tb_venda(
pk_codvenda int(5) zerofill not null auto_increment primary key,
periodo date not null,
valortotal decimal(7,2) not null,
fk_codfuncionario int(4) zerofill,
fk_codcliente int(4) zerofill not null,
foreign key (fk_codfuncionario) references tb_funcionario(pk_codfuncionario),
foreign key (fk_codcliente) references tb_cliente(pk_codcliente)
)engine = InnoDB;

create table tb_produto(
pk_codproduto int(5) zerofill not null auto_increment primary key,
nome varchar(200) not null,
categoria varchar(255),
precounitario decimal(7,2) not null
)engine = InnoDB;

create table tb_funcionario_tb_contato(
fk_codfuncionario int(4) zerofill,
fk_codcontato int(4) zerofill,
foreign key (fk_codfuncionario) references tb_funcionario(pk_codfuncionario),
foreign key (fk_codcontato) references tb_contato(pk_codcontato)
)engine = InnoDB;

create table tb_contato_cliente(
fk_codcontato int(4) zerofill not null,
fk_codcliente int(4) zerofill not null,
foreign key (fk_codcontato) references tb_contato(pk_codcontato),
foreign key (fk_codcliente) references tb_cliente(pk_codcliente)
)engine = InnoDB;

create table tb_endereco_tbcliente(
fk_codendereco int(4) zerofill not null,
fk_codcliente int(4) zerofill not null,
foreign key (fk_codendereco) references tb_endereco (pk_codendereco),
foreign key (fk_codcliente) references tb_cliente (pk_codcliente)
)engine = InnoDB;

create table tb_produto_tb_venda(
quantidade tinyint(3) not null,
fk_codproduto int(5) zerofill not null,
fk_codvenda int(5) zerofill not null,
foreign key (fk_codproduto) references tb_produto(pk_codproduto),
foreign key (fk_codvenda) references tb_venda(pk_codvenda)
)engine = InnoDB;