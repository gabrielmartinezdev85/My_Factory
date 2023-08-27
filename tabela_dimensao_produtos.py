import csv
import random

# Lista de palavras-chave para criar nomes de produtos de informática
palavras_informatica = ['Notebook', 'Desktop', 'Monitor', 'Teclado', 'Mouse', 'Impressora', 'Roteador', 'SSD', 'Placa de Vídeo', 'Processador']

# Função para gerar nomes de produtos de informática fictícios
def generate_nome_produto_informatica():
    return f'{random.choice(palavras_informatica)} {random.randint(100, 999)}'

# Função para gerar dados fictícios para a tabela de dimensão "Produtos"
def generate_produtos_informatica(num_records):
    categorias = ['Eletrônicos', 'Informática']
    produtos = []
    for i in range(1, num_records + 1):
        produtos.append((i, generate_nome_produto_informatica(), random.choice(categorias), round(random.uniform(50, 1000), 2)))
    return produtos

# Gerar dados fictícios para a tabela de dimensão "Produtos"
num_records = 20000
produtos_data = generate_produtos_informatica(num_records)

# Exportar dados para um arquivo CSV
with open('produtos_informatica.csv', 'w', newline='', encoding='utf-8') as file:
    csv_writer = csv.writer(file)
    csv_writer.writerow(['id_produto', 'nome_produto', 'categoria', 'preco'])
    csv_writer.writerows(produtos_data)
    


