import pandas as pd
import numpy as np
forest_fire=pd.read_csv("C:/Users/USER/Desktop/svm/forestfires.csv")
salary_data_train.info()

from sklearn.svm import SVC
from sklearn.model_selection import train_test_split
x = forest_fire.iloc[:,2:30]
y = forest_fire.iloc[:,30]

from sklearn.model_selection import train_test_split
train_x,test_x,train_y,test_y=train_test_split(x,y,test_size=0.2,random_state=0)
help(SVC)
model_linear = SVC(kernel = "linear")
model_linear.fit(train_x,train_y)
pred_test_linear = model_linear.predict(test_x)
np.mean(pred_test_linear==test_y)###test_acc=0.97

pred_train_linear = model_linear.predict(train_x)
np.mean(pred_train_linear==train_y)####train_acc=1


######################
model_poly = SVC(kernel = "poly")
model_poly.fit(train_x,train_y)
pred_test_poly = model_poly.predict(test_x)
np.mean(pred_test_poly==test_y) ###test_acc=0.77

pred_train_poly = model_poly.predict(train_x)
np.mean(pred_train_poly==train_y)  ####train acc=0.76

######################

model_rbf = SVC(kernel = "rbf")
model_rbf.fit(train_x,train_y)
pred_test_rbf = model_rbf.predict(test_x)
np.mean(pred_test_rbf==test_y) ###test_acc=0.74

pred_train_rbf = model_rbf.predict(train_x)
np.mean(pred_train_rbf==train_y) ###train_acc=0.75

