###Comando DDl Create
create database basededados;
create database basededados2;

##Comando DDL chamado DROP
drop database basededados;

## Criar a primeira tabela com o comando DDL 

CREATE TABLE Cadastro(
id_cad INT NOT NULL AUTO_INCREMENT,  ## Campos auto incremente criam os ids ou numeros automaticamente.
Nome VARCHAR(100) NOT NULL,			 ## Não é necessário informar um INSERT.
Sobrenome VARCHAR(100) NOT NULL,
CPF varchar(11) NOT NULL,
PRIMARY KEY ( id_cad )
);

CREATE TABLE Endereco(
id_end INT NOT NULL AUTO_INCREMENT,
Rua VARCHAR(100) NOT NULL,
Número CHAR(8) NOT NULL,
Bairro VARCHAR(100) NOT NULL,
Cidade VARCHAR(100) NOT NULL,
Estado CHAR (2) NOT NULL,
PRIMARY KEY ( id_end )
);

##Vamos fazer um insert. Comando DML 

insert into cadastro(Nome,Sobrenome,CPF) values ("Gabriel","Martins","12345678978")

##insert into endereco(Rua,Número,Bairro,Cidade,Estado) values("Pedra Ruby","38","Bela Vista","Palhoça","SC")

##Executar o comado DQL Select
select * from cadastro

##Comando para delete DML
delete from cadastro where id_cad= 02

 ### Comand DML para excluir Registro DELETE

delete from cadastro where id_cad = 25

#### Limpar dados de uma tabela zerando os campos autoincrement ###

truncate cadastro

### Comando DML de Atualização de Registros UPDATE.

update cadastro set Nome = "José" where id_cad = 2


### 2 Comando de DML que necessitam obrigatória uma clause Where é o DELETE e o UPDATE

### Comando DDL para Adicionar Campos em uma tabela Existente

alter table cadastro add CEP integer(9) after CPF 

## Comando update para popular o campo CEP

update cadastro set CEP = 123456789
