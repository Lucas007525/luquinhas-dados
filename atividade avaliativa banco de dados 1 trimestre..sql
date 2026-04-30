#Selecionamos o banco de dados sucos vendas e realizamos as consultas.
use sucos_vendas;

select * from tabela_de_produtos;
select * from itens_notas_fiscais;
select * from notas_fiscais;

#Verificamos um erro no banco de dados, todos os dados estavam em VARCHAR, não retorna números float (números decimais).
select * from tabela_de_produtos where tamanho > 1;

# Apelidamos todo o código de x e colocamos entre parênteses, dividimos os litros dividimos pelo número total 
#multiplicamos por 100 e apelidamos de participação, desta forma descobrindo a porcentagem.
select x.sabor, x.Ano, x.Litros, (x.Litros / 1081029064064) * 100 as Participação
from(

# Selecionamos a coluna sabor vimos as datas e apelidamos como ano, somamos os litros vendidos durante o ano e usamos 
#um case para transformas os mls em litros encerramos e apelidamos de litros.
select tp.sabor,
date_format(nf.data_venda, "%Y") as Ano,
sum(case
when tp.embalagem != "PET"
    then tp.tamanho / 1000 * inf.quantidade
    else tp.tamanho * inf.quantidade
    end) as Litros
    
# Selecionamos a tabela de produtos e apelidamos de tp, juntamos ao item notas fiscais e apelidamos de inf pelo código 
#de produto, depois juntamos a tabela notas fiscais apartir do número.
from tabela_de_produtos as tp
inner join itens_notas_fiscais as inf
on tp.codigo_do_produto = inf.codigo_do_produto
inner join notas_fiscais as nf
on nf.numero = inf.numero

where date_format(nf.data_venda, "%Y") = 2016

#Agrupamos as informações por data e sabor.
group by date_format(nf.data_venda, "%Y"), sabor) x

#Ordenamos os dados por ordem decrescente.
order by Participação DESC;


