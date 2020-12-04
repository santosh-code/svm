library(readr)
forest_fire<-read.csv(file.choose())
forest_fire1<-forest_fire[,-c(1,2)]
forest_fire1$size_category<-as.factor(forest_fire1$size_category)

forest_fire1_train<-forest_fire1[1:350,]
forest_fire1_test<-forest_fire1[351:517,]

library(kernlab)
fire_classifier <- ksvm(size_category ~ ., data = forest_fire1_train,
                          kernel = "vanilladot")

fire_predictions <- predict(fire_classifier, forest_fire1_test)
table(fire_predictions, forest_fire1_test$size_category)
test_acc<-mean(fire_predictions==forest_fire1_test$size_category)
test_acc

fire_predictions <- predict(fire_classifier, forest_fire1_train)
table(fire_predictions, forest_fire1_train$size_category)
train_acc<-mean(fire_predictions==forest_fire1_train$size_category)
train_acc

##########

fire_classifier <- ksvm(size_category ~ ., data = forest_fire1_train,
                        kernel = "rbfdot")

fire_classifier
fire_predictions <- predict(fire_classifier, forest_fire1_test)
table(fire_predictions, forest_fire1_test$size_category)
test_acc <- mean(fire_predictions == forest_fire1_test$size_category)
test_acc

fire_predictions <- predict(fire_classifier, forest_fire1_train)
table(fire_predictions, forest_fire1_train$size_category)
train_acc <- mean(fire_predictions == forest_fire1_train$size_category)
train_acc

##########

fire_classifier <- ksvm(size_category ~ ., data = forest_fire1_train,
                        kernel = "splinedot")

fire_predictions <- predict(fire_classifier, forest_fire1_test)
table(fire_predictions, forest_fire1_test$size_category)
test_acc <- mean(fire_predictions == forest_fire1_test$size_category)
test_acc

fire_predictions <- predict(fire_classifier, forest_fire1_train)
table(fire_predictions, forest_fire1_train$size_category)
train_acc <- mean(fire_predictions == forest_fire1_train$size_category)
train_acc

#########

fire_classifier <- ksvm(size_category ~ ., data = forest_fire1_train,
                        kernel = "tanhdot")

fire_predictions <- predict(fire_classifier, forest_fire1_test)
table(fire_predictions, forest_fire1_test$size_category)
test_acc <- mean(fire_predictions == forest_fire1_test$size_category)
test_acc

fire_predictions <- predict(fire_classifier, forest_fire1_train)

table(fire_predictions, forest_fire1_train$size_category)
train_acc <- mean(fire_predictions == forest_fire1_train$size_category)
train_acc




