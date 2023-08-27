import csv
import random

# Função para gerar dados fictícios para a tabela de fatos "Dados de Vendas"


def generate_dados_de_vendas(num_records):
    dados_vendas = []
    for i in range(1, num_records + 1):
        id_cliente = random.randint(1, num_records)
        id_produto = random.randint(1, num_records)
        id_vendedor = random.randint(1, num_records)
        valor_venda = round(random.uniform(50, 1000), 2)
        dados_vendas.append(
            (i, id_cliente, id_produto, id_vendedor, valor_venda))
    return dados_vendas


# Gerar dados fictícios para a tabela de fatos "Dados de Vendas"
num_records = 20000
dados_de_vendas_data = generate_dados_de_vendas(num_records)

# Exportar dados para um arquivo CSV
with open('dados_de_vendas.csv', 'w', newline='', encoding='utf-8') as file:
    csv_writer = csv.writer(file)
    csv_writer.writerow(
        ['id_venda', 'id_cliente', 'id_produto', 'id_vendedor', 'valor_venda'])
    csv_writer.writerows(dados_de_vendas_data)
