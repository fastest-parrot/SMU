# ---
# jupyter:
#   jupytext:
#     text_representation:
#       extension: .py
#       format_name: light
#       format_version: '1.4'
#       jupytext_version: 1.2.1
#   kernelspec:
#     display_name: Python 3
#     language: python
#     name: python3
# ---

# ## Hello World

# I can't believe we have to do this.... but whatever
# Sean Kennedy
# MSDS 7330 401
# hello_world.py
# 9-16-2019
stupid_text_we_have_to_display = "Hello World"
stupid_text_we_have_to_display

# or if you're a complete muppet
print(stupid_text_we_have_to_display)

# ## ProTip
#
#     pip install jupytext and never worry about creating a .py file ever again!!!! :)

# ## Tic Tac Toe

tic_tac_toe_board = '''
                       |   |
                   -------------
                       |   |
                   -------------
                       |   |
                       '''
print(tic_tac_toe_board)


# ## Bonus:
#
#     Free lesson in f-strings and dictionaries!

def set_move_on_board(position, player):
    if position_dict[position] == '':
        position_dict[position] = player
        tic_tac_toe_board = f'''{position_dict['1']} | {position_dict['2']} | {position_dict['3']}
---------
{position_dict['4']} | {position_dict['5']} | {position_dict['6']}
---------
{position_dict['7']} | {position_dict['8']} | {position_dict['9']}'''
    else:
        raise('That position is already taken!')
    return tic_tac_toe_board


# +
position_dict = {
    '1':'',
    '2':'',
    '3':'',
    '4':'',
    '5':'',
    '6':'',
    '7':'',
    '8':'',
    '9':''
}

tic_tac_toe_board = f'''{position_dict['1']} | {position_dict['2']} | {position_dict['3']}
---------
{position_dict['4']} | {position_dict['5']} | {position_dict['6']}
---------
{position_dict['7']} | {position_dict['8']} | {position_dict['9']}
                       '''
print(tic_tac_toe_board)
# -

game_on = input('Would you like to play a game? Y/N')

# +
if(game_on) == 'Y':
    x_move = input('Great! You are Xs and I am Os, because Os are great and you suck!\n Now make a move player X, choose a slot! (1-9)')
    tic_tac_toe_board = set_move_on_board(x_move, 'X')
    

# -

print(tic_tac_toe_board)

# - Could write some loops and more interactions here (and some checks to see when/if game is over - but I'm bored and have real work to do :)

#import the pandas library 
import pandas as pd

# # DataSetExploration exercise

housing = pd.read_csv('data/AmesHousing.csv')
housing.describe()

housing.columns

# ##### Question 1 : Create a dataframe with the following columns : YearBuilt , HomePrice , LotArea , BedroomAbvGr and FullBaths

housing_reduced = housing[['YearBuilt', 'SalePrice', 'LotArea', 'BedroomAbvGr', 'FullBath']]
housing_reduced.describe()

# ##### Question 2 : What is the avg price of single family homes 

avg_prices_by_style = housing.groupby(['BldgType']).mean()[['SalePrice']].reset_index()
avg_prices_by_style

# ##### Question 3 : What is the mean home price of the single family homes built after 1950

avg_prices_by_style_after_1950 = housing[housing.YearBuilt > 1950].groupby(['BldgType']).mean()[['SalePrice']].reset_index()
avg_prices_by_style_after_1950

# ##### Question 4 : What is the median home price per number of bedrooms in the house?

median_prices_by_bedroom_count = housing.groupby(['BedroomAbvGr']).median()[['SalePrice']].reset_index()
median_prices_by_bedroom_count

# ##### Question 5 : What is the most expensive home in each Neighborhood

most_expensive_homes_by_neighborhood = housing.sort_values(['SalePrice']
                                                           , ascending=False).groupby(['Neighborhood'])[['SalePrice']].first()
most_expensive_homes_by_neighborhood

# ##### Question 6 :Sort homes by the year built

sort_by_year = housing.sort_values(['YearBuilt'], ascending=False)
sort_by_year
