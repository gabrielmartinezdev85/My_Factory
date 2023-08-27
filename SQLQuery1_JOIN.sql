SELECT 
    dv.id_venda,
    c.Nome,
    c.cidade,
    c.estado,
    c.UF,
    dp.data,
    dp.dia_semana,
    dp.mes,
    dp.ano,
    p.nome_produto,
    p.categoria,
    p.preco,
    vd.nome_vendedor,
    vd.area_vendas
FROM 
    dados_de_vendas dv
JOIN 
    clientes c ON dv.id_cliente = c.Nome
JOIN 
    datas dp ON dv.id_venda = dp.data_id
JOIN 
    produtos_informatica p ON dv.id_produto = p.nome_produto
JOIN 
    vendedores vd ON dv.id_vendedor = vd.id_vendedor;
