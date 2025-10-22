# Automação de Canhotos

import pandas as pd
import os

# Caminho para os dados processados
processed_data_path = '../data/processed/'

# Função para gerar canhotos
def gerar_canhotos(df):
    canhotos = []
    for index, row in df.iterrows():
        canhoto = {
            'ID': row['ID'],
            'Data': row['Data'],
            'Cliente': row['Cliente'],
            'Produto': row['Produto'],
            'Quantidade': row['Quantidade'],
            'Valor Total': row['Valor Total']
        }
        canhotos.append(canhoto)
    return pd.DataFrame(canhotos)

# Função principal
def main():
    # Carregar dados processados
    try:
        df_processados = pd.read_csv(os.path.join(processed_data_path, 'dados_processados.csv'))
    except FileNotFoundError:
        print("Arquivo de dados processados não encontrado.")
        return

    # Gerar canhotos
    canhotos_df = gerar_canhotos(df_processados)

    # Salvar canhotos em um arquivo CSV
    canhotos_df.to_csv(os.path.join(processed_data_path, 'canhotos_gerados.csv'), index=False)
    print("Canhotos gerados e salvos com sucesso.")

if __name__ == "__main__":
    main()