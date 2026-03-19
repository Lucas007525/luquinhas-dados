select * from cadastrocliente where nome = 'Gael do Reis Moraes';

select * from tabela_de_produtos where sabor = 'Manga' and tamanho = '3 ml';

select * from tabela_de_produtos where sabor = 'Manga' and not (tamanho = '470 ml');
select * from tabela_de_produtos where sabor = 'Manga' or not (tamanho = '470 ml');
select * from tabela_de_produtos where sabor in ('Manga', 'Laranja');

select * from tabela_de_clientes where cidade in ('Rio de Janeiro', 'São Paulo') and idade >= 20;

#USO DA CONDIÇÃO DISTINCT

select embalagem, tamanho from tabela_de_produtos;

select distinct embalagem, tamanho from tabela_de_produtos;

select distinct embalagem, tamanho, sabor from tabela_de_produtos where sabor = 'Laranja';

-- obtenha as 10 primeiras vendas 
-- do dia 01/01/2017

SELECT * FROM tabela_de_vendas 
WHERE data_venda = '2017-01-01' 
LIMIT 10;

-- ultilizando order by

SELECT * from tabela_de_produtos order by sabor, embalagem;
select * from tabela_de_produtos order by  preço_de_lista, embalagem; 

-- Quais foram as maiores vendas ?
-- do produto "linha refrescante" - 1 litro - morango/limão em quantidade e preço ?

select * from tabela_de_produtos where NOME_DO_PRODUTO = 'linha refrescante - 1 litro - morango/limão';

select * from itens_notas_fiscais
where CODIGO_DO_PRODUTO = '1101035'
order by quantidade desc, preço desc; 

-- Agrupando os resultados (group by) 

-- Classificar o valor dos produtos:
select nome_do_produto, preco_de_lista, 
CASE
when preco_de_lista >= 14 then "produto caro"
when preco_de_lista >= 7 and "preco da lista" <12 then "produto em conta"
else "produto barato"
end as status_preco from tabela_de_produtos
order by preco_de_lista
-- veja o ano de nascimento dos clientes e classifique-os como:
-- nascidos antes de 1990 são velhos,nascidos em 1990 e 1995 são jovens.
-- nascidos depois de 1995 são crianças
-- listem os nomes dos clientes e a classificação
select nome , data_de_nascimento 
case
when data_de_nascimento >1990 