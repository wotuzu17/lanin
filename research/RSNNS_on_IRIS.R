library("RSNNS")
data("iris")

# shuffle dataset
iris <- iris[sample(1:nrow(iris), length(1:nrow(iris))), 1:ncol(iris)]

# filter for inputs
irisValues <- iris[,1:4]

# filter for outputs
irisTargets <- iris[,5]

# 3 columns with binary definitions of each species
irisDecTargets <- decodeClassLabels(irisTargets)

# iris will be list of 4: iris$inputsTrain, iris$targetsTrain, iris$inputsTest, iris$targetsTest
iris <- splitForTrainingAndTest(irisValues, irisDecTargets, ratio=0.15)

# the norm values(colmean and colsd) are calculated from the iris$inputsTrain. 
# These values are applied to to the inputsTest columns. 
# values are normalized to zero mean and variance one.
# the targetTrain and targetTests columns are not normed.
# In classification problems, normalizing the targets normally makes no sense. 
# For regression, normalizing also the targets is usually a good idea.
iris <- normTrainingAndTestSet(iris)

model <- mlp(iris$inputsTrain, iris$targetsTrain, size=5,
             learnFuncParams = .1, maxit=60, 
             inputsTest = iris$inputsTest, targetsTest = iris$targetsTest)

# predict on test set
predictions <- predict(model, iris$inputsTest)

# create plots
plotIterativeError(model)
plotRegressionError(predictions[,1], iris$targetsTest[,1], pch=3)
plotRegressionError(predictions[,2], iris$targetsTest[,2], pch=3)
plotRegressionError(predictions[,3], iris$targetsTest[,3], pch=3)
# display ROC receiver operating characteristcs
plotROC(fitted.values(model)[,2], iris$targetsTrain[,2])
plotROC(predictions[,2], iris$targetsTest[,2])

# WTA = winner takes it all algorithm

# confusion matrices for the training set:
RSNNS::confusionMatrix(iris$targetsTrain, fitted.values(model))

# confusion matrix for the test set:
RSNNS::confusionMatrix(iris$targetsTest, predictions)

# confusion matrix for the 402040 method:
# 402040 method: divide [0,1] interval into lower part with 40% of values and upper part
# containing 40% of values. The 20% middle class are treated as unclassified.
confusionMatrix(iris$targetsTrain, encodeClassLabels(fitted.values(model),
                method = "402040", l=.4, h=.6))

# take a look at the weigths of the newly trained network
weightMatrix(model)
