# Prediction-of-demand-for-sharing-bikes-in-Seoul

This project aims at solving the problem of imbalance between the demand and supply for sharing bikes in Seoul. Our goal is to predict the hourly demand for sharing bikes in Seoul using regression methods and get inferences about the most influential factors. 

We first tried to draw inferences by fitting linear regression models, but it turns out that the linear assumptions are violated even after some transformations on the linear model, so we turn to nonlinear methods. 

We tried three nonlinear models (regression tree, random forest, and gradient boosting) and estimated their test MSE using 10-fold cross- validation. Among them, the random forest model gives us the best estimated test error, hence it is chosen as our final model. The test error of the prediction based on the random forest is 8719.738. 

The random forest illustrates that the most influential factors on demand of sharing bikes are the hour in a day, temperature, and humidity. 

The limitations of this study lie in the neglect of time-varying effect on data splitting process, failure to include interaction terms, limitation of hardware ability, and failure to address post-pandemic issues since the data is from 2017 to 2018.
