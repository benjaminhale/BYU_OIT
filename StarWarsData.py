#BYU OIT Technical Exercises

#pip install requests
#pip install pandas
#pip install json

import requests
import pandas as pd
import json

#1. Retrieve data about Star Wars characters from the https://swapi.dev/api/people API. 
	#No authentication is needed.

#load api data as json
r = requests.get("https://swapi.dev/api/people")
json_data = r.json()
data = json_data['results']

#load pandas, prep id
df = pd.DataFrame(data)
df.index += 1


#2. Output a list of the female characters to a text file. 
	#Each row in the file should include
		#row number
		#name
		#ID number
		#eye color

#filter dataframe by row and column
df_filtered = df[df['gender'] == 'female']
df_filtered = df_filtered.reset_index()#reset row count AND set ID number
df_filtered = df_filtered.rename(columns={'index': 'ID number'})
df_filtered = df_filtered[['name','ID number','eye_color']]

#prep row number column
df_filtered.index += 1
df_filtered.index.name = 'row number'

#output to text file
df_filtered.to_csv('StarWarsTest.txt', sep='\t')
