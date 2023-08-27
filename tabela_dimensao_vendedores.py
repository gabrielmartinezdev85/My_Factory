import csv
from faker import Faker

fake = Faker('pt_BR')

# Função para gerar dados fictícios para a tabela de dimensão "Vendedores"
def generate_vendedores(num_records):
    areas_vendas = ['Região Norte', 'Região Sul', 'Região Leste', 'Região Oeste']
    vendedores = []
    for i in range(1, num_records + 1):
        vendedores.append((i, fake.first_name(), fake.random_element(elements=areas_vendas)))
    return vendedores

# Gerar dados fictícios para a tabela de dimensão "Vendedores"
num_records = 20000
vendedores_data = generate_vendedores(num_records)

# Exportar dados para um arquivo CSV
with open('vendedores.csv', 'w', newline='', encoding='utf-8') as file:
    csv_writer = csv.writer(file)
    csv_writer.writerow(['id_vendedor', 'nome_vendedor', 'id_area_vendas', 'area_vendas'])
    csv_writer.writerows(vendedores_data)

