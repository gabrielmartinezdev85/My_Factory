-- Calculando total de vendas
SELECT 
	SUM (valor_venda) AS Total_vendas 
FROM 
	dados_de_vendas;
	--

-- Determinando o valor médio das vendas
SELECT 
	AVG (valor_venda) AS Media_Vendas 
FROM 
	dados_de_vendas;

-- Encontando produtos mais vendidos
SELECT 
	id_produto, MAX(valor_venda) AS maior_valor_venda
FROM 
	dados_de_vendas
GROUP BY 
	id_produto;
	--

-- Encontrando melhores clientes
SELECT 
	id_cliente, MAX(valor_venda) AS maior_valor_venda
FROM 
	dados_de_vendas
GROUP BY 
	id_cliente 
ORDER BY 
	maior_valor_venda DESC;
	--

-- Clientes que fizeram compras repetidas

SELECT
    c.nome AS nome_cliemte,
    c.cidade,
    c.estado,
    COUNT(*) AS quantidade_compras
FROM
    clientes c
JOIN
    dados_de_vendas dv ON c.id = dv.id_cliente
GROUP BY
    c.nome, c.cidade, c.estado
HAVING
    COUNT(*) > 1
ORDER BY
    quantidade_compras DESC;
	--

-- Valor médio gasto por cliente

SELECT
    c.nome AS nome_cliente,
    AVG(dv.valor_venda) AS valor_medio_gasto
FROM
    clientes c
JOIN
    dados_de_vendas dv ON c.id = dv.id_cliente
GROUP BY
    c.nome
ORDER BY
    valor_medio_gasto DESC;
	--

-- ANÁLISE TEMPORAL

-- Encontando meses com mais vendas

SELECT
    dp.mes,
    SUM(dv.valor_venda) AS total_vendas
FROM
    dados_de_vendas dv
JOIN
    datas dp ON dv.id_venda = dp.data_id
GROUP BY
    dp.mes
ORDER BY
    total_vendas DESC;
	--

-- Encontrando a receita mensal ao longo do tempo

SELECT
    d.ano,
    d.mes,
    SUM(v.valor_venda) AS receita_mensal
FROM
    datas d
JOIN
    dados_de_vendas v ON d.data_id = v.id_venda
GROUP BY
    d.ano, d.mes 
ORDER BY
    d.ano DESC, d.mes;
	--

-- Encontrando a sazonalidade semanal

SELECT
    dp.dia_semana,
    SUM(dv.valor_venda) AS total_vendas
FROM
    dados_de_vendas dv
JOIN
    datas dp ON dv.id_venda = dp.data_id
GROUP BY
    dp.dia_semana
ORDER BY
    total_vendas DESC;
	--
-- Segmentação de Clientes
-- Agrupando os clientes por Estado e calculando o valor total das vendas em cada Estado.
-- Destacando o prosuto preferido em cada Estado

WITH VendasPorEstado AS (
    SELECT
        c.Estado,
        SUM(dv.valor_venda) AS total_vendas
    FROM
        clientes c
    JOIN
        dados_de_vendas dv ON c.ID = dv.id_cliente
    GROUP BY
        c.Estado
),
ProdutosPreferidosPorEstado AS (
    SELECT
        c.Estado,
        p.nome_produto,
        COUNT(*) AS quantidade_vendida
    FROM
        clientes c
    JOIN
        dados_de_vendas dv ON c.ID = dv.id_cliente
    JOIN
        produtos_informatica p ON dv.id_produto = p.id_produto
    GROUP BY
        c.Estado, p.nome_produto
    HAVING
        COUNT(*) > 0
)
SELECT
    v.Estado,
    v.total_vendas,
    pp.nome_produto AS produto_preferido,
    pp.quantidade_vendida
FROM
    VendasPorEstado v
LEFT JOIN
    (
        SELECT
            pp.Estado,
            pp.nome_produto,
            pp.quantidade_vendida,
            ROW_NUMBER() OVER (PARTITION BY pp.Estado ORDER BY pp.quantidade_vendida DESC) AS rn
        FROM
            ProdutosPreferidosPorEstado pp
    ) pp ON v.Estado = pp.Estado AND pp.rn = 1
ORDER BY
    v.Estado;
	--

-- Produtos
-- Calculando a receira total por categoria de produtos

SELECT
    p.categoria,
    SUM(dv.valor_venda) AS receita_total
FROM
    dados_de_vendas dv
JOIN
    produtos_informatica p ON dv.id_produto = p.id_produto
GROUP BY
    p.categoria;
	--
-- Produto Mais Caro

SELECT
    p.nome_produto,
    p.preco
FROM
    produtos_informatica p
WHERE
    p.preco = (SELECT MAX(preco) FROM produtos_informatica);
	--
-- Produto Mais Barato

SELECT
    p.nome_produto,
    p.preco
FROM
    produtos_informatica p
WHERE
    p.preco = (SELECT MIN(preco) FROM produtos_informatica);
	--

--Ranking de Vendedores (TOP 10)

SELECT TOP(10)
    vd.nome_vendedor,
    SUM(dv.valor_venda) AS total_vendas
FROM
    dados_de_vendas dv
JOIN
    vendedores vd ON dv.id_vendedor = vd.id_vendedor
GROUP BY
    vd.nome_vendedor
ORDER BY
    total_vendas DESC;
	--

--Comissionamento por Vendedor

SELECT
    vd.nome_vendedor,
    SUM(dv.valor_venda) AS total_vendas,
    ROUND(SUM(dv.valor_venda * 0.01), 2) AS comissao
FROM
    dados_de_vendas dv
JOIN
    vendedores vd ON dv.id_vendedor = vd.id_vendedor
GROUP BY
    vd.nome_vendedor
ORDER BY
    total_vendas DESC;
	--


















