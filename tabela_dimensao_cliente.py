from faker import Faker
import csv

fake = Faker('pt_BR')

# Função para obter a UF a partir do estado
def get_uf(estado):
    estados_uf = {
        'AC': 'Acre', 'AL': 'Alagoas', 'AP': 'Amapá', 'AM': 'Amazonas', 'BA': 'Bahia',
        'CE': 'Ceará', 'DF': 'Distrito Federal', 'ES': 'Espírito Santo', 'GO': 'Goiás',
        'MA': 'Maranhão', 'MT': 'Mato Grosso', 'MS': 'Mato Grosso do Sul', 'MG': 'Minas Gerais',
        'PA': 'Pará', 'PB': 'Paraíba', 'PR': 'Paraná', 'PE': 'Pernambuco', 'PI': 'Piauí',
        'RJ': 'Rio de Janeiro', 'RN': 'Rio Grande do Norte', 'RS': 'Rio Grande do Sul',
        'RO': 'Rondônia', 'RR': 'Roraima', 'SC': 'Santa Catarina', 'SP': 'São Paulo',
        'SE': 'Sergipe', 'TO': 'Tocantins'
    }
    return estados_uf.get(estado, '')

# Função para gerar dados fictícios para a tabela de dimensão "Clientes"
def generate_clientes(num_records):
    clientes = []
    for i in range(1, num_records + 1):
        estado = fake.state_abbr()
        clientes.append((i, fake.first_name(), fake.city(), estado, get_uf(estado)))
    return clientes

# Gerar dados fictícios para a tabela de dimensão "Clientes"
num_records = 20000
clientes_data = generate_clientes(num_records)

# Exportar dados para um arquivo CSV
with open('clientes.csv', 'w', newline='', encoding='utf-8') as file:
    csv_writer = csv.writer(file)
    csv_writer.writerow(['ID', 'Nome', 'Cidade', 'Estado', 'Unidade Federativa (UF)'])
    csv_writer.writerows(clientes_data)




