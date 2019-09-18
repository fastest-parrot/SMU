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

# # File Organization and Databases 
# This notebook introduces additional methods of accessing structured data using the python pandas package.
#
# In this notebook we will look at methods to 
# * load data from file into a dataframe
#
# * Optimize memory management using pandas
#
# * Inspect data using head and tail functions
#
# * fetch summary statistics
#
# * access data using pandas functions
#



#Jupyter notebook provides a mechanism to run OS commands
# !ls data

# Read the data file into a pandas dataframe
df = pd.read_csv("data/AmesHousing.csv")

#Show the first 5 records from the data
df.head(5)

#Examine the summary of the variables in the dataset. The info() function lists all the columns with their counts and datatypes
#Pandas assigns default datatypes for the columns based on the data housed in them
df.info()

#Examine the shape of the data : The # of Records and # Columns
df.shape

## Lets now look at the total memory consumed by the pandas dataframe in memory 
for dtype in ['float','int','object']:
    selected_dtype = df.select_dtypes(include=[dtype])
    mean_usage_b = selected_dtype.memory_usage(deep=True).mean()
    mean_usage_mb = mean_usage_b 
    print("Average memory usage for {} columns: {:03.2f} KB".format(dtype,mean_usage_mb))

##Notice that the integer fields are listed as "int64" : which implies 64 bits of storage allocated each field.
## The maximum value that can be stored in any int64 field is :  (9,223,372,036,854,775,808) . DO we need so much space for our int fields. 
## Lets examine the values stored in 3 int64 fields YearBuilt , PoolArea and SalePrice
print("Highest value of the SalesPrice in the data set is %d"%df.SalePrice.max())
print("Highest value of the LotArea in the data set is %d"%df.LotArea.max())

## We will optimize the storage for the integer fields by reducing the amount of storage reserved for the integer columns
##update the data type for columns for optimal storage
for colName in df.select_dtypes(include=['int']).columns:
    df[colName] = df[colName].astype("int32")

##memory usage storage after updating the column size 
for dtype in ['float','int','object']:
    selected_dtype = df.select_dtypes(include=[dtype])
    mean_usage_b = selected_dtype.memory_usage(deep=True).mean()
    mean_usage_mb = mean_usage_b
    print("Average memory usage for {} columns: {:03.2f} KB".format(dtype,mean_usage_mb))

##List all columns
df.columns

##select a column from the dataframe
df["BldgType"]

##List all distinct Neighborhood values from the dataframe
df["BldgType"].unique()

##Get Summary statistics of the numeric columns
df.describe()

##Different results when Categorical variables are described
df[["Neighborhood","BldgType","HouseStyle"]].describe()

##Conditionally select homes single family homes only
dfSingleFamHomes = df[df["BldgType"]=="1Fam"]
print (dfSingleFamHomes.shape)



##Conditionally describe single family homes only
df[df.BldgType=="1Fam"].describe()

##Select homes built after year 2000 
df[df.YearBuilt>=2000].describe()

# +
##Built in functions to get additional details on one/more columns 

## What is the oldest house in the dataset
print("Year the oldest house was built : %d " % df.YearBuilt.min())

##List the avg number of rooms
print("Avg number of rooms per room in the dataset : %d  " % (df.TotRmsAbvGrd.mean()))

# +
##Get average SalesPrice by total number of bedrooms for each neighborhood

#Lets inspect and see how many unique values exist for Number of Bedrooms
print(df.BedroomAbvGr.unique())

#to get the Saleprice by the # of rooms - Use groupby function and apply mean()
df.groupby([df.BedroomAbvGr,df.Neighborhood]).mean()["SalePrice"]
# -



##When was the most recent home built in the OldTown neighborhood
df[df.Neighborhood=="OldTown"].YearBuilt.max()

# # DataSetExploration exercise

# ##### Question 1 : Create a dataframe with the following columns : YearBuilt , HomePrice , LotArea , BedroomAbvGr and FullBaths



# ##### Question 2 : What is the avg price of single family homes 



# ##### Question 3 : What is the mean home price of the single family homes built after 1950



# ##### Question 4 : What is the median home price per number of bedrooms in the house?



# ##### Question 5 : What is the most expensive home in each Neighborhood



# ##### Question 6 :Sort homes by the year built


