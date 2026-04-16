#Seleção de colunas de interesse
select * from tabela_de_clientes;
select * from itens_notas_fiscais;

#Seleção de colunas de interesse
select NF.CPF, NF.DATA_VENDA, INF.QUANTIDADE
from notas_fiscais as NF
inner join itens_notas_fiscais as INF
on NF.NUMERO = INF.NUMERO;

#Manipular a data (ano e mês)
select NF.CPF,
date_format(NF.DATA_VENDA, '%Y-%m') as DATA_VENDA,
INF.QUANTIDADE
from notas_fiscais as NF
inner join itens_notas_fiscais as INF
on NF.NUMERO = INF.NUMERO;

#Soma para obter a quantidade total
select NF.CPF, TC.nome, TC.volume_de_compra,
sum(TC.VOLUME_DE_COMPRA) as volume_compra,
date_format(NF.DATA_VENDA, '%Y-%m') as DATA_VENDA,
sum(INF.QUANTIDADE) as QUANTIDADE
from notas_fiscais as NF
inner join itens_notas_fiscais as INF
on NF.NUMERO = INF.NUMERO
inner join tabela_de_clientes as tc
on TC.cpf = nf.cpf
group by NF.cpf, quantidade, data_venda;

/*Obter o volume de compra da tabela de clientes*/
select * from tabela_de_clientes;

select TC.cpf,tc.nome, tc.volume_de_compra as qntd_limite
from tabela_de_clientes as TC;
