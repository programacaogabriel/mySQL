create table Clientes(
id_clientes INT NOT NULL AUTO_INCREMENT,
Nome varchar(100) NOT NULL,
Sobrenome VARCHAR(100) NOT NULL,
Endereco VARCHAR(255) NOT NULL,
CPF varchar(11) NOT NULL,
Email varchar(100)NOT NULL,
Telefone varchar(10) NOT NULL,
primary key(id_clientes)
);
drop table clientes
drop table vendas_produtos2

create table Vendas_Produtos(
id_vendasProdutos INT NOT NULL AUTO_INCREMENT,
Nome_Produtos varchar(100) NOT NULL,
PrecoVendas float(10,2) NOT NULL,
CustoProduto float(10,2) NOT NULL,
Quantidade int(100) NOT NULL,
id_clientes int(11) Not Null,
primary key(id_vendasProdutos)
);

alter table vendas_produtos
add constraint fk_vendas_produtos
foreign key(id_clientes)
references Clientes(id_clientes)
on delete no action 
on update no action

select * from clientes
select * from vendas_produtos

select * from clientes
INNER JOIN vendas_produtos
ON Clientes.id_clientes = Vendas_Produtos.id_vendasProdutos;

select * from vendas_produtos
INNER JOIN clientes
on Vendas_Produtos.id_vendasProdutos = Clientes.id_clientes;



