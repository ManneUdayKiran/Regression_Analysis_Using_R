# Load dataset
data(iris)

# ✅ Create binary target for Setosa
iris$IsSetosa <- ifelse(iris$Species == "setosa", 1, 0)

# Filter data for versicolor vs virginica for model2
iris2 <- iris[iris$Species != "setosa", ]
iris2$IsVirginica <- ifelse(iris2$Species == "virginica", 1, 0)

# Fit logistic model for Setosa classification
model <- glm(IsSetosa ~ Petal.Length + Petal.Width, data = iris, family = "binomial")

# Predict and classify
probs <- predict(model, type = "response")
pred <- ifelse(probs > 0.5, 1, 0)

# Confusion matrix
cm <- table(Predicted = pred, Actual = iris$IsSetosa)
print(cm)

# Plot and save image
if (!dir.exists("plots")) dir.create("plots")
iris$Prediction <- factor(pred, labels = c("Not Setosa", "Setosa"))

png("plots/logistic_classification_plot.png")
plot(iris$Petal.Length, iris$Petal.Width,
     col = ifelse(iris$Prediction == "Setosa", "blue", "orange"),
     pch = 19,
     xlab = "Petal Length", ylab = "Petal Width",
     main = "Logistic Regression Classification: Setosa vs Others")
legend("topright", legend = c("Setosa", "Not Setosa"), col = c("blue", "orange"), pch = 19)
dev.off()
