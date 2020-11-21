##utilizando select e subselect com outros comandos DML e DDL

##Criando uma tabela utilizando o subselect #copia de uma tabela

create table produtos2(select * from produtos where Quantidade >=10)

select * from produtos2;

##Inserir dados a partir de campos de ua tabela #Copia de tabela por campos especificos

insert into produtos2(select id_prod,Nome_Produto,Valor,Quantidade,id_cad from produtos)

select * from produtos;

#Atualizar valores através de subselect - não é recomendado não usar
update produtos2 set Nome_Produto = 'Abacaxi'
where Nome_Produto in(select Nome_produto from produtos) 

#apagar valores utilzando subselect = não usar
delete from produtos2
where Nome_Produtos in(select Nome_Produto from produtos)

##### funções de agregação
# agrupa varios valores de registro em uma unica saida

select Quantidade,Nome_Cliente
from cadastro
join produtos on
cadastro.id_cad = produtos.id_cad
order by Quantidade #order by

Group by # verifica os registro guais e traz apenas 1 opcão saida
insert into produtos (Nome_Produto,Valor,Quantidade,id_cad) values("Laranja",3.50,15,1)

select Nome_Cliente,Nome_Produto as Prod_vendido
from cadastro,produtos
where cadastro.id_cad = produtos.id_cad
group by Nome_produto
order by Nome_produto

##count conta registro de uma tabela
select count(*) from produtos

##having count = trás a contagem de resitros especificando quantidade
select Nome_Cliente,Nome_Produto, count(Nome_Produto)
from produtos, cadastro
where cadastro.id_cad = produtos.id_cad
group by Nome_Produto
having count(Nome_produto)<=3 ## contar os produtos agrupados

##Operador MAX e MIN
select max (Quantidade) as QT_PROD from produtos
select min (Quantidade) as QT_PROD from produtos

select min(Quantidade) as QT_PROD_MIN,max(quantidade) qt_prod_max from produtos

### SUM soma agregada dos valores dos registros dos camplos da tebela
select sum(Quantidade) as Quantidade_Total, sum(valor) valor_Total from produtos

##Media com a função avg
select avg(valor) from produtos
select format(avg(valor),2)from produtos

#### Função string
# trata registro dos campos de dados em varchar ou char

#Funcao substring ou subts obtem partes de um dado de string
#Funcao lenght é utilizada para obter o comprimento de uma cadeia de string

select Nome_Produto from produtos
where substr(Nome_Produto,1,6) = 'laran'

select Nome_Cliente,Sobrenome from cadastro
where substr(Sobrenome,1,3)= 'Sil'
and length (Nome_Cliente)>3

##Concat contactena os campos de string
# concatws concatena os campos de string com um separador; ,
select concat(Nome_Cliente," Gosta de: ",Nome_produto) as Gosto_frutas from
cadastro,produtos
where cadastro.id_cad = produtos.id_cad
order by Nome_cliente

select concat_ws(' ; ',Nome_Produto,Quantidade,Valor) from produtos
where Nome_produto like 'L%'

##lcase retorna os registros em letras minusculas
##Ucase retorna os registros com letras maiúsculas

select lcase(Nome_cliente) from cadastro
select ucase(Nome_cliente) from cadastro

#Funçoes matematicas
##função round arredonda valores numericos utilizado em campos de float
select round(3212.365845,2)from dual ## fake table

##truncate de casas decimais aconselhavel utilzar o format
select truncate(max(valor),5) from produtos

##Funcao matematica Raiz Quadrada
select sqrt(584) as Raiz_Quadrada
select format(sqrt(584),3) as Raiz_Quadrada
select pi()

##Calculos matematicos: +, -, *, /
select (Quantidade * valor) as Multiplicaçao from produtos 
where id_prod = 5

select (Quantidade + valor) as Adiçao from produtos 
where id_prod = 5

select (Quantidade - valor) as subtraçao from produtos 
where id_prod = 5

select (Quantidade / valor) as divisao from produtos 
where id_prod = 5

##Funções de data##
select curdate();

##data e hora atual
select now()
select sysdate()

select curdate()-1 ## TRAS UM DIA MENOS
select curtime()

## intervalo de datas
select dateiff('2020-01-01','2020-11-09')

#Adicionar dias a uma data
select date_add('2019-05-13', interval 90 day)

## tras a data anterior
select date_add(curdate(), interval - 1 day) as DATA_DE_ONTEM

##RETORNO DIA SEMANA
select dayname('2020-11-20')

##retorna dia do mes
select dayofmonth('2020-11-201')

###Extrair o valor com extract
select extract(year from '2014-02-09')

#retorna o utlimo dia do mes
select last_day('2020-02-05')

##formatar a saida de data
select date_format('2014-11-04',get_format(date,'eur'))

## selecionar o valor de string para data
select str_to_date('05.05.2016',get_format(date,'usa'))

### Condicionais dentro do da linguagem sql utilizamos IF e case como conndicional
##Teste condicional com IF if(testelogico,true,False)as name from table

select nome_produto,
if(quantidade <=20,"baixo","alto") as Estoque from produtos2

##teste de valores com operadores
select valor,
if(valor != 10.00,"Diferente","Igual") as testa_valor from produtos2

##Funçaõ case quando trabalhamos com varias condiçoes verdadeiras
select Nome_produto,
case
when quantidade <= 4 then "Baixo estoque"
when quantidade <=15 then "Estoque bom"
when quantidade <=30 then "Estoque Médio"
else "Estoque alto"
end as Quantidade_Estoque,
count(*) Quantidade
from produtos2
group by quantidade

###Analisar cliente com compras acima de 10
##select com if e join
select Nome_cliente,Nome_produto,quantidade,
if(quantidade >=10,"Alta Compra","Baixa Compra") as compras_cliente
from produtos
join cadastro on
cadastro.id_cad = produtos.id_cad
order by compras_cliente ## ordena pelo campo do alias retorna o resultado da condicional

##trazer a quantidade de clientes com vendas boas e ruins com case

select
case
when quantidade <=10 then 'Clientes com poucas vendas'
else 'Cliente com vendas boas'
end as compras_clientes,
count(*)nome_cliente ##Contou e agrupou pelo nome dos clientes
from produtos join cadastro on produtos.id_cad = cadastro.id_cad
group by compras_clientes
order by compras_clientes## Resulttado a condição case


