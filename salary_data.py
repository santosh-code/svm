import pandas as pd
import numpy as np
salary_data_train=pd.read_csv("C:/Users/USER/Desktop/svm/SalaryData_Train.csv")
salary_data_test=pd.read_csv("C:/Users/USER/Desktop/svm/SalaryData_Test.csv")
dum1=pd.get_dummies(data=salary_data_train,columns=['workclass','education','maritalstatus','occupation','relationship','race','sex','native','Salary'])
dum2_test=pd.get_dummies(data=salary_data_test,columns=['workclass','education','maritalstatus','occupation','relationship','race','sex','native','Salary'])

from sklearn.svm import SVC
from sklearn import svm


salary_data_train.columns


train_X = dum1.iloc[0:500:,0:102]
train_y = dum1.iloc[0:500:,103]
test_X  = dum2_test.iloc[0:500:,0:102]
test_y  = dum2_test.iloc[0:500:,103]


model_linear = SVC(kernel = "linear",C=1,gamma=0.1)
model_linear.fit(train_X,train_y)
pred_test_linear = model_linear.predict(test_X)
np.mean(pred_test_linear==test_y)####test acc=0.82

pred_train_linear = model_linear.predict(train_X)
np.mean(pred_train_linear==train_y) ###train acc=0.87



###################



######################
model_poly = SVC(kernel = "poly")
model_poly.fit(train_X,train_y)
pred_test_poly = model_poly.predict(test_X)
np.mean(pred_test_poly==test_y) ###test acc=0.80

pred_train_poly = model_poly.predict(train_X)
np.mean(pred_train_poly==train_y) ###test acc=0.81



######################

model_rbf = SVC(kernel = "rbf")
model_rbf.fit(train_X,train_y)
pred_test_rbf = model_rbf.predict(test_X)
np.mean(pred_test_rbf==test_y)####test acc=0.804

pred_train_rbf = model_rbf.predict(train_X)
np.mean(pred_train_rbf==train_y)####test acc=0.812



