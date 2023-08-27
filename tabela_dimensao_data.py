import csv
from faker import Faker
from datetime import datetime

fake = Faker()

# Função para gerar dados fictícios para a tabela de dimensão "Datas"


def generate_datas(num_records):
    datas = []
    for i in range(1, num_records + 1):
        data = fake.date_between(start_date='-5y', end_date='today')
        datas.append((i, data.strftime('%Y-%m-%d'),
                     data.strftime('%A'), data.strftime('%B'), data.year))
    return datas


# Gerar dados fictícios para a tabela de dimensão "Datas"
num_records = 20000
datas_data = generate_datas(num_records)

# Exportar dados para um arquivo CSV
with open('datas.csv', 'w', newline='', encoding='utf-8') as file:
    csv_writer = csv.writer(file)
    csv_writer.writerow(['data_id', 'data', 'dia_semana', 'mes', 'ano'])
    csv_writer.writerows(datas_data)
