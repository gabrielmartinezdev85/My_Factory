CREATE TABLE Clientes_1

(id_cliente INT PRIMARY KEY,
nome_cliente VARCHAR(50),
cidade VARCHAR(50),
estado VARCHAR(30),
uf VARCHAR(2)
);

CREATE TABLE Produtos

(id_produto INT PRIMARY KEY,
nome_produto VARCHAR(50),
categoria VARCHAR(50),
preco FLOAT(2)
);

CREATE TABLE Datas (
    data_id INT PRIMARY KEY,
    data DATE,
    dia_semana VARCHAR(15),
    mes INT,
    ano INT
);

CREATE TABLE Vendedores 

(id_vendedor INT PRIMARY KEY,
nome_vendedor VARCHAR(50),
id_area_vendas VARCHAR(30),
area_vendas VARCHAR(50)
);

CREATE TABLE Categorias_Produtos 

(id_categoria INT PRIMARY KEY,
nome_categoria VARCHAR(50)
);

SELECT*FROM dados_de_vendas;

ALTER TABLE dados_de_vendas
ADD CONSTRAINT FK_Clientes_1 FOREIGN KEY (nome_cliente)
REFERENCES Clientes_1 (id_cliente);

SELECT
    dv.id_venda,
    c.nome_cliente,
    c.cidade,
    c.estado,
    p.nome_produto,
    d.data,
    d.dia_semana,
    d.mes,
    d.ano,
    vd.nome_vendedor,
    vd.area_vendas,
    cp.nome_categoria,
    dv.valor_venda
FROM dados_de_vendas dv
JOIN Clientes_1 c ON dv.id_cliente = c.id_cliente
JOIN Produtos p ON dv.id_produto = p.id_produto
JOIN Datas d ON dv.data_venda = d.data
JOIN Vendedores vd ON dv.id_venda = vd.id_vendedor
JOIN Categorias_Produtos cp ON p.categoria = cp.id_categoria;




