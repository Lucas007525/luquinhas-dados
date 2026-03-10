
-- 1. Verificação de férias da vendedora Cláudia Morais

-- Usei o SELECT para buscar colunas específicas.
-- O WHERE filtra a linha exata combinando Nome E Bairro com o operador AND.
SELECT nome, de_ferias, bairro 
FROM vendedores 
WHERE nome = 'Cláudia Morais' AND bairro = 'Jardins';



-- 2. Vendedores com comissão > 0.10 e de férias

-- Aqui o operador '>' compara valores numéricos.
-- O 'de_ferias = 1' assume que o banco usa 1 para Verdadeiro (True).
SELECT * FROM vendedores 
WHERE comissao > 0.10 AND de_ferias = 1;



-- 3. Consulta de Notas Fiscais (Uso do OR)

-- O operador OR é usado porque a atividade pede uma condição OU outra.
-- Se qualquer uma das duas for verdadeira, o registro aparece.
SELECT * FROM notas_fiscais 
WHERE matricula = '00237' OR data_venda = '2015-01-12';

/* POR QUE O CPF NÃO É PK NESTA TABELA?
   Resposta: Em um modelo de vendas, o CPF identifica o CLIENTE, não a VENDA. 
   Se o CPF fosse a Chave Primária (PK), o cliente só poderia comprar UMA VEZ na vida na loja, 
   pois a PK não permite valores duplicados. A PK desta tabela deve ser o 'NUMERO' da nota.
*/



-- 4. Itens com quantidade >= 99 e maior valor

-- O operador >= inclui o valor 99 na busca.
SELECT codigo_produto, quantidade 
FROM itens_notas_fiscais 
WHERE quantidade >= 99;

-- Para descobrir o maior valor de venda (Quantidade * Preço):
-- Multiplicamos as colunas e ordenamos do maior para o menor (DESC).
SELECT codigo_produto, (quantidade * preco) AS valor_total 
FROM itens_notas_fiscais 
ORDER BY valor_total DESC 
LIMIT 1;



-- 5. Consulta Complexa (JOINs)

/* POR QUE USAR JOIN? 
   Os dados estão espalhados: Nome do cliente (tabela clientes), Nome do produto (tabela produtos), 
   e a venda (tabela notas_fiscais). O JOIN "gruda" as tabelas usando as Chaves Estrangeiras (FK).
*/

SELECT 
    C.nome AS Nome_Cliente, 
    V.nome AS Nome_Vendedor, 
    P.nome_produto, 
    P.sabor
FROM notas_fiscais NF
-- Une a Nota ao Cliente pelo CPF
INNER JOIN clientes C ON NF.cpf = C.cpf
-- Une a Nota ao Vendedor pela Matrícula
INNER JOIN vendedores V ON NF.matricula = V.matricula
-- Une a Nota aos Itens pelo Número da Nota
INNER JOIN itens_notas_fiscais INF ON NF.numero = INF.numero
-- Une o Item ao Produto pelo Código do Produto
INNER JOIN produtos P ON INF.codigo_produto = P.codigo_produto
WHERE INF.quantidade = 84 
  AND INF.codigo_produto = '1101035' 
  AND NF.numero = 102;
