library(readr)
salary_data_train<-read.csv(file.choose())
salary_data_test<-read.csv(file.choose())
str(salary_data_train)

summary(salary_data_train)
library(fastDummies)
salary_data_train$workclass<-as.factor(salary_data_train$workclass)
salary_data_test$workclass<-as.factor(salary_data_test$workclass)

salary_data_train$education<-as.factor(salary_data_train$education)
salary_data_test$education<-as.factor(salary_data_test$education)

salary_data_train$maritalstatus<-as.factor(salary_data_train$maritalstatus)
salary_data_test$maritalstatus<-as.factor(salary_data_test$maritalstatus)

salary_data_train$occupation<-as.factor(salary_data_train$occupation)
salary_data_test$occupation<-as.factor(salary_data_test$occupation)

salary_data_train$relationship<-as.factor(salary_data_train$relationship)
salary_data_test$relationship<-as.factor(salary_data_test$relationship)

salary_data_train$race<-as.factor(salary_data_train$race)
salary_data_test$race<-as.factor(salary_data_test$race)

salary_data_train$sex<-as.factor(salary_data_train$sex)
salary_data_test$sex<-as.factor(salary_data_test$sex)

salary_data_train$native<-as.factor(salary_data_train$native)
salary_data_test$native<-as.factor(salary_data_test$native)

salary_data_train$Salary<-as.factor(salary_data_train$Salary)
salary_data_test$Salary<-as.factor(salary_data_test$Salary)

str(salary_data_train)
str(salary_data_test)

library(kernlab)
salary_classifier <- ksvm(Salary ~ ., data = salary_data_train,
                        kernel = "vanilladot")


salary_predictions <- predict(salary_classifier, salary_data_test)
table(salary_predictions, salary_data_test$Salary)
test_acc <-mean (salary_predictions == salary_data_test$Salary)
test_acc

salary_predictions <- predict(salary_classifier, salary_data_train)
table(salary_predictions, salary_data_train$Salary)
train_acc <-mean (salary_predictions == salary_data_train$Salary)
train_acc

########

salary_classifier <- ksvm(Salary ~ ., data = salary_data_train,
                          kernel = "laplacedot")


salary_predictions <- predict(salary_classifier, salary_data_test)
test_acc <- mean(salary_predictions == salary_data_test$Salary)
test_acc


salary_predictions <- predict(salary_classifier, salary_data_train)
train_acc <- mean(salary_predictions == salary_data_train$Salary)
train_acc

#########
salary_classifier <- ksvm(Salary ~ ., data = salary_data_train,
                          kernel = "rbfdot")


salary_predictions <- predict(salary_classifier, salary_data_test)
test_acc <- mean(salary_predictions == salary_data_test$Salary)
test_acc


salary_predictions <- predict(salary_classifier, salary_data_train)
train_acc <- mean(salary_predictions == salary_data_train$Salary)
train_acc

#########

salary_classifier <- ksvm(Salary ~ ., data = salary_data_train,
                          kernel = "tanhdot")


salary_predictions <- predict(salary_classifier, salary_data_test)
test_acc <- mean(salary_predictions == salary_data_test$Salary)
test_acc


salary_predictions <- predict(salary_classifier, salary_data_train)
train_acc <- mean(salary_predictions == salary_data_train$Salary)
train_acc

##########
salary_classifier <- ksvm(Salary ~ ., data = salary_data_train,
                          kernel = "polydot")


salary_predictions <- predict(salary_classifier, salary_data_test)
test_acc <- mean(salary_predictions == salary_data_test$Salary)
test_acc

salary_predictions <- predict(salary_classifier, salary_data_train)
train_acc <- mean(salary_predictions == salary_data_train$Salary)
train_acc

