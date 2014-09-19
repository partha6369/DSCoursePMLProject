library(caret)
library(randomForest)
library(kernlab)
library(pROC)



setwd("/Users/parthamajumdar/Documents/Education/John Hopkins University/Data Science/Work/DSCoursePMLProject")



training <- read.csv("pml-training.csv", sep=",", header=TRUE)
testing <- read.csv("pml-testing.csv", sep=",", header=TRUE)



training1 <- training[,-1:-5]
testing1 <- testing[,-1:-5]



columnsToRemove <- nearZeroVar(training1)
training2 <- training1[,-columnsToRemove]
testing2 <- testing1[,-columnsToRemove]



i <- sapply(training2, is.factor)
training2[i] <- lapply(training2[i], as.numeric)
dataCorr <- cor(training2)
training3 <- training2[!sapply(dataCorr[1,], function(x) is.na(x))]
training3 <- subset(training3, select=-c(classe))
i <- sapply(training3, is.factor)
training3[i] <- lapply(training3[i], as.numeric)

testing3 <- testing2[!sapply(dataCorr[1,], function(x) is.na(x))]
testing3 <- subset(testing3, select=-c(problem_id))
i <- sapply(testing3, is.factor)
testing3[i] <- lapply(testing3[i], as.numeric)

dataCorr <- cor(training3)
highCorr <- findCorrelation(dataCorr, 0.90)
training4 <- training3[, -highCorr]
testing4 <- testing3[, -highCorr]



training5 <- training4[!sapply(testing4, function(x) all(is.na(x)))]

testing5 <- testing4[!sapply(testing4, function(x) all(is.na(x)))]



xTrans <- preProcess(training5, method="pca")
training6 <- predict(xTrans, training5)
testing6 <- predict(xTrans, testing5)



training7 <- cbind(training6, classe=training$classe)
x <- rownames(training7)
rownames(training7) <- make.names(x, unique=TRUE)



bootControl <- trainControl(number = 25)
set.seed(2)
fitRF <- train(classe ~ ., data=training7, method = "rf", tuneLength = 5, trControl = bootControl, scaled = FALSE)
fitSVM <- train(classe ~ ., data=training7, method = "svmRadial", tuneLength = 5, trControl = bootControl, scaled = FALSE)



fitRF
fitRF$finalModel



fitSVM
fitSVM$finalModel



par(mfrow=c(2,2))
plot(fitRF)
plot(fitRF, metric = "Kappa")
resampleHist(fitRF)



par(mfrow=c(2,2))
plot(fitSVM)
plot(fitSVM, metric = "Kappa")
resampleHist(fitSVM)



predict(fitRF$finalModel, newdata = testing6)
predict(fitSVM$finalModel, newdata = testing6)



confusionMatrix(fitSVM)
varImp(fitSVM)



confusionMatrix(fitRF)
varImp(fitRF)

#[1] B A C A A E D B A A B C B A E E A B B B
#12:48