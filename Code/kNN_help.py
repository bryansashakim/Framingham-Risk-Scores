import numpy as np
import pandas as pd
from sklearn.impute import KNNImputer
from sklearn.ensemble import RandomForestClassifier
from sklearn.impute import KNNImputer
from sklearn.model_selection import cross_val_score
from sklearn.model_selection import RepeatedStratifiedKFold
from sklearn.pipeline import Pipeline
from sklearn.preprocessing import MinMaxScaler
from sklearn.model_selection import train_test_split
from sklearn import neighbors
from sklearn.metrics import mean_squared_error
from math import sqrt
from sklearn.preprocessing import StandardScaler
import matplotlib.pyplot as plt
import matplotlib as mpl

df = pd.read_stata("/Users/bryankim/Documents/NBER/Framingham /Data/nhanes_2017_2018_frs.dta")
## KEEP ONLY THESE TWO
df = df[["lbxgh","fpg"]]
## DROPPING ROWS WHERE LBXGH is null, because we are only predicting the null values for FPG
df = df[df['lbxgh'].notna()]
scaler = MinMaxScaler()
df = pd.DataFrame(scaler.fit_transform(df), columns = df.columns)
imputer = KNNImputer(n_neighbors=9)
df = pd.DataFrame(imputer.fit_transform(df),columns = df.columns)
df = pd.DataFrame(scaler.inverse_transform(df))

df_final = pd.concat([df_final, df], axis=1)

# len(df)
df_final.to_csv("/Users/bryankim/Documents/NBER/Framingham /Data/kNN.csv")
df.head()


#####################################################################################################################

df = pd.read_csv("/Users/bryankim/Documents/NBER/Framingham /Data/Train.csv")
df.head()
df.isnull().sum()
#missing values in Item_weight and Outlet_size needs to be imputed
mean = df['Item_Weight'].mean() #imputing item_weight with mean
df['Item_Weight'].fillna(mean, inplace =True)

mode = df['Outlet_Size'].mode() #imputing outlet size with mode
df['Outlet_Size'].fillna(mode[0], inplace =True)
df.isnull().sum()
df.drop(['Item_Identifier', 'Outlet_Identifier'], axis=1, inplace=True)
df = pd.get_dummies(df)
train , test = train_test_split(df, test_size = 0.3)
x_train = train.drop('Item_Outlet_Sales', axis=1)
y_train = train['Item_Outlet_Sales']
x_test = test.drop('Item_Outlet_Sales', axis = 1)
y_test = test['Item_Outlet_Sales']
scaler = MinMaxScaler(feature_range=(0, 1))
x_train_scaled = scaler.fit_transform(x_train)
x_train = pd.DataFrame(x_train_scaled)
x_test_scaled = scaler.fit_transform(x_test)
x_test = pd.DataFrame(x_test_scaled)
rmse_val = [] #to store rmse values for different k
for K in range(20):
    K = K+1
    model = neighbors.KNeighborsRegressor(n_neighbors = K)
    model.fit(x_train, y_train)  #fit the model
    pred=model.predict(x_test) #make prediction on test set
    error = sqrt(mean_squared_error(y_test,pred)) #calculate rmse
    rmse_val.append(error) #store rmse values
    print('RMSE value for k= ' , K , 'is:', error)

train , test = train_test_split(df, test_size = 0.3)

x_train = train.drop('fpg', axis=1)
y_train = train['fpg']

x_test = test.drop('fpg', axis = 1)
y_test = test['fpg']

scaler = MinMaxScaler(feature_range=(0, 1))
x_train_scaled = scaler.fit_transform(x_train)
x_train = pd.DataFrame(x_train_scaled)
x_test_scaled = scaler.fit_transform(x_test)
x_test = pd.DataFrame(x_test_scaled)

## Let us have a look at the error rate for different k values
rmse_val = [] #to store rmse values for different k
for K in range(20):
    K = K+1
    model = neighbors.KNeighborsRegressor(n_neighbors = K)

    model.fit(x_train, y_train)  #fit the model
    # pred=model.predict(x_test) #make prediction on test set
    # error = sqrt(mean_squared_error(y_test,pred)) #calculate rmse
    # rmse_val.append(error) #store rmse values
    # print('RMSE value for k= ' , K , 'is:', error)