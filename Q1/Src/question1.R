raw_yield_data <- read.csv("Desktop/PDS DATASET.csv")
View (raw_yield_data)
cleaned_yield_data <- na.omit (raw_yield_data[raw_yield_data$Frailty !="N",])
View (cleaned_yield_data)

plot(raw_yield_data$Height..inches,raw_yield_data$Weight..lbs,xlab="Height",ylab="Weight",main=("plot between height and weight"))
# Load necessary libraries
library(caret)
# Load data
raw_yield_data <- read.csv("Desktop/PDS DATASET.csv") # Remove rows with missing values
cleaned_yield_data <- na.omit(raw_yield_data)
# Convert Frailty column to a factor
cleaned_yield_data$Frailty <- as.factor(cleaned_yield_data$Frailty)
# Split data into training and testing sets
set.seed(123)
trainIndex <- createDataPartition(cleaned_yield_data$Frailty, p=.7, list=FALSE)
train <- cleaned_yield_data[trainIndex, ]
test <- cleaned_yield_data[-trainIndex,]
# Fit logistic regression model
lr_model <- train(Frailty~.,data = train,method ="glm",family ="binomial")
# Fit support vector machine model
svm_model <- train(Frailty ~ ., data = train, method = "svmRadial")

dt_model <- train(Frailty ~ ., data = train, method = "rpart")
# Make predictions on test set
lr_pred <- predict(lr_model, newdata = test) 
svm_pred <- predict(svm_model, newdata = test) 
dt_pred <- predict(dt_model, newdata = test)
# Evaluate performance of models confusionMatrix(lr_pred, test$Frailty) confusionMatrix(svm_pred, test$Frailty) confusionMatrix(dt_pred, test$Frailty)

confusionMatrix(lr_pred, test$Frailty)
confusionMatrix(svm_pred, test$Frailty)
confusionMatrix(dt_pred, test$Frailty)
