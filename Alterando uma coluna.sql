/*O volume de compra (tabela_de_clientes) é a quantidade máxima (L)
que um cliente pode comprar no mês.
A quantidade (itens_notas_fiscais) é o campo que representa a quantidade do produto
comprado.
Apartir da comparação do volume de compras e da quantidade é possível dizer se as
vendas do mês foram válidas ou inválidas*/

#SELEÇÃO DAS COLUNAS DE INTERESSE.

SELECT TP.SABOR,NF.DATA_VENDA, INF.QUANTIDADE
FROM TABELA_DE_PRODUTOS AS TP
INNER JOIN ITENS_NOTAS_FISCAIS AS INF 
ON TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO
INNER JOIN NOTAS_FISCAIS AS NF 
ON NF.NUMERO = INF.NUMERO;


#ALTERAR A COLUNA DE DATA.
SELECT TP.SABOR, DATE FORMAT (NF.DATA_VENDA) "%y" - "%m", INF.QUANTIDADE
FROM TABELA_DE_PRODUTOS AS TP
INNER JOIN ITENS_NOTAS_FISCAIS AS INF 
ON TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO
INNER JOIN NOTAS_FISCAIS AS NF 
ON NF.NUMERO = INF.NUMERO;