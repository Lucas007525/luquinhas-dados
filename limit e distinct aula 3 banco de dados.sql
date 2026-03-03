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