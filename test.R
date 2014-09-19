setwd("/Users/parthamajumdar/Documents/Education/John Hopkins University/Data Science/Work/DSCoursePMLProject")

training <- read.csv("pml-training.csv", sep=",", header=TRUE)
testing <- read.csv("pml-testing.csv", sep=",", header=TRUE)

training1 <- training[,-1:-5]
testing1 <- testing[,-1:-5]

columnsToRemove <- nearZeroVar(training1)
training2 <- training1[,-columnsToRemove]
testing2 <- testing1[,-columnsToRemove]

#training3 <- subset(training2, select = -c(classe, stddev_pitch_forearm, avg_pitch_forearm, stddev_roll_forearm, amplitude_roll_forearm, avg_roll_dumbbell, stddev_roll_dumbbell, avg_pitch_dumbbell, stddev_pitch_dumbbell, var_pitch_dumbbell, avg_yaw_dumbbell, stddev_yaw_dumbbell, amplitude_roll_dumbbell, amplitude_roll_arm, amplitude_pitch_arm, amplitude_roll_arm, amplitude_pitch_arm, var_accel_arm, avg_roll_arm, stddev_roll_arm, var_roll_arm, avg_pitch_arm, stddev_pitch_arm, amplitude_roll_belt, var_total_accel_belt, stddev_roll_belt, var_roll_belt, stddev_pitch_belt, var_pitch_belt, avg_yaw_belt, stddev_yaw_belt, var_yaw_belt, var_yaw_dumbbell))
training3 <- subset(training2, select = -c(classe, avg_roll_dumbbell, stddev_roll_dumbbell, avg_pitch_dumbbell, stddev_pitch_dumbbell, var_pitch_dumbbell, avg_yaw_dumbbell, stddev_yaw_dumbbell, amplitude_roll_dumbbell,   var_accel_arm, amplitude_roll_belt, var_total_accel_belt, stddev_roll_belt, var_roll_belt, stddev_pitch_belt, var_pitch_belt, avg_yaw_belt, stddev_yaw_belt, var_yaw_belt, var_yaw_dumbbell, max_picth_forearm, min_pitch_forearm, amplitude_pitch_forearm , var_accel_forearm, max_picth_arm, max_yaw_arm, min_yaw_arm, amplitude_yaw_arm, max_roll_dumbbell, max_picth_dumbbell, min_roll_dumbbell, min_pitch_dumbbell, amplitude_pitch_dumbbell, var_accel_dumbbell, var_roll_dumbbell, max_roll_belt, max_picth_belt, min_roll_belt, min_pitch_belt, amplitude_pitch_belt, avg_roll_belt, avg_pitch_belt, max_picth_forearm, min_pitch_forearm, amplitude_pitch_forearm, var_accel_forearm, max_picth_arm, max_yaw_arm, min_yaw_arm, amplitude_yaw_arm, max_roll_dumbbell, max_picth_dumbbell, min_roll_dumbbell, min_pitch_dumbbell, amplitude_pitch_dumbbell, var_accel_dumbbell, var_roll_dumbbell, max_roll_belt, max_picth_belt, min_roll_belt, min_pitch_belt, amplitude_pitch_belt, avg_roll_belt, avg_pitch_belt))
i <- sapply(training3, is.factor)
training3[i] <- lapply(training3[i], as.numeric)

#testing3 <- subset(testing2, select = -c(problem_id, stddev_pitch_forearm, avg_pitch_forearm, stddev_roll_forearm, amplitude_roll_forearm, avg_roll_dumbbell, stddev_roll_dumbbell, avg_pitch_dumbbell, stddev_pitch_dumbbell, var_pitch_dumbbell, avg_yaw_dumbbell, stddev_yaw_dumbbell, amplitude_roll_dumbbell, amplitude_roll_arm, amplitude_pitch_arm, amplitude_roll_arm, amplitude_pitch_arm, var_accel_arm, avg_roll_arm, stddev_roll_arm, var_roll_arm, avg_pitch_arm, stddev_pitch_arm, amplitude_roll_belt, var_total_accel_belt, stddev_roll_belt, var_roll_belt, stddev_pitch_belt, var_pitch_belt, avg_yaw_belt, stddev_yaw_belt, var_yaw_belt, var_yaw_dumbbell))
testing3 <- subset(testing2, select = -c(problem_id, avg_roll_dumbbell, stddev_roll_dumbbell, avg_pitch_dumbbell, stddev_pitch_dumbbell, var_pitch_dumbbell, avg_yaw_dumbbell, stddev_yaw_dumbbell, amplitude_roll_dumbbell,   var_accel_arm, amplitude_roll_belt, var_total_accel_belt, stddev_roll_belt, var_roll_belt, stddev_pitch_belt, var_pitch_belt, avg_yaw_belt, stddev_yaw_belt, var_yaw_belt, var_yaw_dumbbell, max_picth_forearm, min_pitch_forearm, amplitude_pitch_forearm , var_accel_forearm, max_picth_arm, max_yaw_arm, min_yaw_arm, amplitude_yaw_arm, max_roll_dumbbell, max_picth_dumbbell, min_roll_dumbbell, min_pitch_dumbbell, amplitude_pitch_dumbbell, var_accel_dumbbell, var_roll_dumbbell, max_roll_belt, max_picth_belt, min_roll_belt, min_pitch_belt, amplitude_pitch_belt, avg_roll_belt, avg_pitch_belt, max_picth_forearm, min_pitch_forearm, amplitude_pitch_forearm, var_accel_forearm, max_picth_arm, max_yaw_arm, min_yaw_arm, amplitude_yaw_arm, max_roll_dumbbell, max_picth_dumbbell, min_roll_dumbbell, min_pitch_dumbbell, amplitude_pitch_dumbbell, var_accel_dumbbell, var_roll_dumbbell, max_roll_belt, max_picth_belt, min_roll_belt, min_pitch_belt, amplitude_pitch_belt, avg_roll_belt, avg_pitch_belt))
i <- sapply(testing3, is.factor)
testing3[i] <- lapply(testing3[i], as.numeric)

dataCorr <- cor(training3)
highCorr <- findCorrelation(dataCorr, 0.90)
training4 <- training3[, -highCorr]
testing4 <- testing3[, -highCorr]

#training5 <- subset(training4, select = -c(kurtosis_picth_belt, skewness_roll_belt, skewness_roll_belt.1, min_yaw_belt, amplitude_yaw_belt, kurtosis_roll_arm, kurtosis_picth_arm, kurtosis_yaw_arm, skewness_roll_arm, skewness_pitch_arm, kurtosis_picth_dumbbell, skewness_roll_dumbbell, skewness_pitch_dumbbell, min_yaw_dumbbell, kurtosis_roll_forearm, kurtosis_picth_forearm, skewness_roll_forearm, skewness_pitch_forearm))
#training5 <- training4
training5 <- training4[!sapply(testing4, function(x) all(is.na(x)))]

#testing5 <- subset(testing4, select = -c(kurtosis_picth_belt, skewness_roll_belt, skewness_roll_belt.1, min_yaw_belt, amplitude_yaw_belt, kurtosis_roll_arm, kurtosis_picth_arm, kurtosis_yaw_arm, skewness_roll_arm, skewness_pitch_arm, kurtosis_picth_dumbbell, skewness_roll_dumbbell, skewness_pitch_dumbbell, min_yaw_dumbbell, kurtosis_roll_forearm, kurtosis_picth_forearm, skewness_roll_forearm, skewness_pitch_forearm))
#testing5 <- testing4
testing5 <- testing4[!sapply(testing4, function(x) all(is.na(x)))]

xTrans <- preProcess(training5, method="pca")
#xTrans <- prcomp(training4)
training6 <- predict(xTrans, training5)
testing6 <- predict(xTrans, testing5)

training7 <- cbind(training6, classe=training$classe)
x <- rownames(training7)
rownames(training7) <- make.names(x, unique=TRUE)
#testing6 <- cbind(testing5, problem_id=testing$problem_id)
#x <- rownames(testing6)
#rownames(testing6) <- make.names(x, unique=TRUE)

bootControl <- trainControl(number = 25)
set.seed(2)
fitRF <- train(classe ~ ., data=training7, method = "rf", tuneLength = 5, trControl = bootControl, scaled = FALSE); fitSVM <- train(classe ~ ., data=training7, method = "svmRadial", tuneLength = 5, trControl = bootControl, scaled = FALSE)

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

models <- list(svm = fitSVM, rf = fitRF)
predict(models, newdata = testing6)
predict(fitRF$finalModel, newdata = testing6)
predict(fitSVM$finalModel, newdata = testing6)


[1] B A C A A E D B A A B C B A E E A B B B
Levels: A B C D E
