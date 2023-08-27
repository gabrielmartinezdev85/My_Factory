import csv
import random
from faker import Faker
import datetime

fake = Faker('pt_BR')

# Função para gerar uma data fictícia dentro de um intervalo


def random_date(start_date, end_date):
    return start_date + datetime.timedelta(seconds=random.randint(0, int((end_date - start_date).total_seconds())))


# Gerar dados fictícios de vendas
num_records = 20000

with open('dados_de_vendas.csv', 'w', newline='', encoding='utf-8') as csvfile:
    fieldnames = ['id_venda', 'id_cliente',
                  'id_produto', 'data_venda', 'valor_venda']
    writer = csv.DictWriter(csvfile, fieldnames=fieldnames)

    writer.writeheader()

    for _ in range(num_records):
        writer.writerow({
            'id_venda': fake.random_int(min=1, max=num_records),
            'id_cliente': fake.random_int(min=1, max=1000),
            'id_produto': fake.random_int(min=1, max=100),
            'data_venda': random_date(datetime.datetime(2018, 1, 1), datetime.datetime(2023, 1, 1)).strftime('%Y-%m-%d'),
            'valor_venda': round(random.uniform(50, 500), 2)
        })
