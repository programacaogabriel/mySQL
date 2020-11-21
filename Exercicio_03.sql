select * from clientes;
select * from vendas_produtos;

###Criando o subselect 
create table Vendas_Produtos2(select * from  Vendas_Produtos where Quantidade >= 3);

select * from vendas_produtos2;

###Registro de vendas_produtos
select Nome,Quantidade,Nome_Produtos,PrecoVendas,CustoProduto
from clientes
join vendas_produtos on
clientes.id_clientes = vendas_produtos.id_clientes
order by Nome 

###Soma de valores
select sum(CustoProduto) as Preco_total_custo, sum(PrecoVendas) as Preco_total_vendas, sum(Quantidade) Quantidade_Total from vendas_produtos;

select * from vendas_produtos;

###Função de adição valor e quantidade
select (Quantidade + PrecoVendas) as Adição from vendas_produtos 
where id_vendasProdutos = 2;

select (Quantidade + PrecoVendas) as Adição from vendas_produtos 
where id_vendasProdutos = 4;

##Função total de preço de custo e quantitade 
select Nome_Produtos, (Quantidade * CustoProduto) as Total from vendas_produtos 
where id_vendasProdutos = 1;
