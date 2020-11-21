## Select é o comando DQL onde fazemos consulta de forma de filtros e condições e funções

## select * tras tdos camps de uma tabela. Usamos quando não sabemos a a estrutura da tabela
select  * from cadastro;

##Porem podemos trabalhar com clausular.
## A clausa Order by. Ordernar por ordem alfabetica
select Nome,Sobrenome from cadastro 
order by Nome  #desc = ordem decrescente

## Utilizando a clausula where(onde)
select Nome,Sobrenome from cadastro
Where Nome = "j"

##utilizando Operadores Relacionais
## > < >= <= = !=
select Nome,Sobrenome from cadastro
where nome !="João"

select id_cad, Nome,Sobrenome from cadastro
where id_cad > 3

## Coringa função like de busca
select Nome,Sobrenome from cadastro
where Nome like "Jo%"

select Nome,Sobrenome from cadastro
where Nome like "ria%"

### Operadores lógicos
## OR AND NOT

### Select com o Operador OR
select id_cad, Nome,Sobrenome,CPF from cadastro 
where Nome ="Roberto" or Sobrenome ="Silva"

### Select com o Operador AND
select id_cad, Nome,Sobrenome from cadastro
where Nome="Roberto" and Sobrenome="Ferreira"

select id_cad, Nome,Sobrenome from cadastro
where not Nome="Roberto" and Sobrenome like "Fer%"

### select com Operador NOT
select id_cad, Nome,Sobrenome from cadastro
where not Nome="Roberto"  and not Sobrenome ="Ferreira"

###Subconsulta IN e NOT IN
###Subconsulta utilizamos quando não fazemos um JOIN

# IN trabalha com varios valores buscando dentro da tabela
select id_cad,Nome,Sobrenome from cadastro
where id_cad in(1,2)

select id_cad,Nome,Sobrenome from cadastro 
where id_cad not in(1,2)

## SubSelect simples ##
#Subselect é quando passamos um select dentro de outro select
select Nome,Sobrenome from cadastro
where Nome in (select nome from cadastro where Nome ="Jose")
select Nome,Sobrenome from cadastro
where Nome not in (select nome from cadastro where Nome ="Jose")

##Distinct valores não repetidos
select distinct Sobrenome from cadastro

##Trabalhando Relacionamento e criando a chave estrangeira
## Criar tabela

create table produtos(
id_prod int not null auto_increment,
Nome varchar (100) not null,
Valor float (10,2) not null,
Quantidade int(11) not null,
id_cad int(11) not null,
primary key (id_prod)
);

### Criação da Constraint (Chave Estrangeira)
## Comando DDL pois vai alterar a tabela

alter table produtos add constraint fk_cadastro_produtos
foreign key(id_cad)
references cadastro(id_cad)
on delete no action 
on update no action

##select tabela produtos
select * from produtos
## Criar as tabelas, criar as forengkeys e depois começar a colocar os dados
##Subconsultas com tabelas distintas
select Nome,Sobrenome from cadastro
where id_cad in (select id_cad from produtos where id_cad)

select Nome,Sobrenome from cadastro
where id_cad not in (select id_cad from produtos where id_cad)

##Subselectr com os campos de normalização ou campos de relacionamente.
select Nome,(select Nome from cadastro where id_cad = produtos.id_cad) from produtos

##Uso de Aliases para os campos de um select
select Nome,(select Nome from cadastro where id_cad = produtos.id_cad) as Clientes from produtos

##Select sem join
select Nome_Cliente,Nome_produto,Sobrenome,Quantidade,Valor
from produtos,cadastro
where cadastro.id_cad = produtos.id_cad
order by Quantidade

##Ajustando campos Ambiguos comando DDL alter

##Alterando nome do campo Nome da tabela cadastro
alter table cadastro change Nome Nome_Cliente varchar(100)
alter table produtos change Nome Nome_Produto varchar(100)

## Clausula JOIN ou INNER JOIN
select * from produtos
join cadastro where 

##Select com JOIN  e campos de relacionamento
select Nome_Cliente,Nome_produto,Valor,Quantidade from produtos
JOIN cadastro on
produtos.id_cad = cadastro.id_cad
order by Nome_Cliente

##Left Join
select * from cadastro
left join produtos on
produtos.id_cad = cadastro.id_cad

##Right Join
select * from  produtos
right join cadastro on
produtos.id_cad = cadastro.id_cad





















