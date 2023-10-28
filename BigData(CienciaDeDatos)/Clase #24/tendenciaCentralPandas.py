import pandas as pd

df = pd.read_csv('cars_depurado.csv')
print(df)
print()

# PROMEDIO PRECIOS
print('Media de precios (USD):', df['price_usd'].mean())
print()

# MEDIANA PRECIOS
print('Mediana de precios (USD):', df['price_usd'].median())
print()
