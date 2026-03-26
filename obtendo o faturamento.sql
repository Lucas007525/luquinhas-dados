-- Pesquise o que são subquery em SQL e aplicar um exemplo em sala com o banco
-- de dados sucos-vendas.

-- práticas da aula do dia, pesquisa ainda não realizada.
-- juntando tabelas e consultas.

select * from tabela_de_vendedores;
select * from notas_fiscais;

select * from tabela_de_vendedores as TV
inner join notas_fiscais NF
on TV.matricula = NF.MATRICULA;

-- Quantas notas fiscais cada vendedor emitiu ? 
select TV.MATRICULA, TV.NOME, count(*) as TOTAL_NF 
from tabela_de_vendedores as TV
inner join notas_fiscais as NF 
on TV.MATRICULA = NF.MATRICULA
group by TV.MATRICULA, TV.NOME;

/* obtenha o faturamento anual da empresa, levando em consideração que o valor
/* financeiro das vendas é obtido pela multiplicação da quantidade pelo preço*/

select * from notas_fiscais as NF
inner join itens_notas_fiscais as INF 
on NF.NUMERO = INF.NUMERO; 

sum(X * Y)
