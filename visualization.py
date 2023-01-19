# %% Interactive Python Cell
import psycopg2
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

con = psycopg2.connect("dbname=nfl_stats user=postgres host=localhost port=5432")


def sql_to_df(sql_query: str):
    """Get result set of sql_query as a pandas DataFrame."""
    return pd.read_sql(sql_query, con)

title = "Total Wins by Team 2022-2023"
query = """
        SELECT name AS team_name, wins, losses
        FROM teams
        ORDER BY wins ASC;
    """
dataframe = sql_to_df(query)

# %%

fig, axes = plt.subplots(figsize=(20, 10))
axes.set_title(title, fontsize=14)
# get evenly spaced x-axis positions
xpos = np.arange(len(dataframe))
# at each x, add bar (height based on count data)
wins_bars = axes.bar(xpos, (dataframe["wins"]), width=0.25)
losses_bars = axes.bar(xpos + 0.25, (dataframe["losses"]), width=0.25)
# at each x, add tick mark
axes.set_xticks(xpos)
# at each x, add label based on dept data
axes.set_xticklabels(dataframe["team_name"])
# Set y limits
axes.set_ylim(2, 15)
# label y-axis
axes.set_ylabel("Wins/Losses", fontsize=12)
axes.set_xlabel("Teams", fontsize=12)
# rotate x-axis labels to prevent overlap
plt.setp(axes.get_xticklabels(), rotation=30, horizontalalignment='right')

for bar in wins_bars:
        height = bar.get_height()
        axes.annotate(f'{height}',
                    xy = (bar.get_x() + bar.get_width() / 2, height),
                    xytext = (0, 1),  # 3 points vertical offset
                    textcoords = 'offset points',
                    ha = 'center',
                    va = 'bottom',
                    fontweight = 'semibold')
for bar in losses_bars:
        height = bar.get_height()
        axes.annotate(f'{height}',
                    xy = (bar.get_x() + bar.get_width() / 2, height),
                    xytext = (0, 1),  # 3 points vertical offset
                    textcoords = 'offset points',
                    ha = 'center',
                    va = 'bottom',
                    fontweight = 'semibold')

plt.legend(['Wins', 'Losses'], loc='upper center')

plt.show()
# %%
query2 = """
        SELECT
            home_color,
            COUNT(*) AS Count
        FROM teams
        GROUP BY home_color
        ORDER BY Count DESC;
    """
dataframe2 = sql_to_df(query2)
dataframe2

# %%
explode = np.zeros(len(dataframe2['home_color']))
explode[0] = 0.05
colors = []

for i in range(len(dataframe2['home_color'])):
    if dataframe2['home_color'][i] == 'Burgundy':
        colors.append('Maroon')
        continue
    if dataframe2['home_color'][i] == 'Black':
        colors.append('Silver')
        continue
    if dataframe2['home_color'][i] == 'Blue':
        colors.append('royalblue')
        continue
    colors.append(dataframe2['home_color'][i])

figure, ax = plt.subplots(figsize=(20, 10))

ax.pie(
    dataframe2['count'], 
    explode = explode, 
    labels = dataframe2['home_color'], 
    shadow = True, 
    startangle = 90, 
    textprops = {'fontsize': 16}, 
    colors = colors, 
    autopct = '%1.1f%%',
    labeldistance = 1.07,
    pctdistance = 0.85,
)

ax.axis('equal')

plt.title(label = 'Home Color by Teams', fontdict = {'fontsize': 24, 'fontweight': 'semibold', 'font': 'Impact'}, pad = 20)
plt.legend(title = 'Colors in NFL:')
plt.show()
# %%