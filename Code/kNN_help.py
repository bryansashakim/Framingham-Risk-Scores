import numpy as np
import pandas as pd
from sklearn.impute import KNNImputer
from sklearn.ensemble import RandomForestClassifier
from sklearn.impute import KNNImputer
from sklearn.model_selection import cross_val_score
from sklearn.model_selection import RepeatedStratifiedKFold
from sklearn.pipeline import Pipeline
from sklearn.preprocessing import MinMaxScaler


df = pd.read_stata("/Users/bryankim/Documents/NBER/Framingham /Data/nhanes_1999_2000_frs.dta")
## KEEP ONLY THESE TWO
df = df[["lbxgh","fpg"]]
## DROPPING ROWS WHERE LBXGH is null
df = df[df['lbxgh'].notna()]
df.head()
len(df)
df.isna().any()
# scaler = MinMaxScaler()
# df = pd.DataFrame(scaler.fit_transform(df), columns = df.columns)
df.head()
imputer = KNNImputer(n_neighbors=5)
df = pd.DataFrame(imputer.fit_transform(df),columns = df.columns)
df.isna().any()
df.head()
# len(df)
df.to_csv("/Users/bryankim/Documents/NBER/Framingham /Data/kNN.csv")
df.head()