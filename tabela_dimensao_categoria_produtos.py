import csv
import random

# Função para gerar dados fictícios para a tabela de dimensão "Categorias de Produtos"


def generate_categorias_produtos(num_records):
    categorias_produtos = ['Eletrônicos', 'Vestuário',
                           'Alimentos', 'Móveis', 'Jogos', 'Esportes']
    categorias = []
    for i in range(1, num_records + 1):
        categorias.append((i, random.choice(categorias_produtos)))
    return categorias


# Gerar dados fictícios para a tabela de dimensão "Categorias de Produtos"
num_records = 20000
categorias_data = generate_categorias_produtos(num_records)

# Exportar dados para um arquivo CSV
with open('categorias_produtos.csv', 'w', newline='', encoding='utf-8') as file:
    csv_writer = csv.writer(file)
    csv_writer.writerow(['id_categoria', 'nome_categoria'])
    csv_writer.writerows(categorias_data)
