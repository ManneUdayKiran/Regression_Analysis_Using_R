data(mtcars)
model <- lm(mpg ~ hp + wt, data = mtcars)
summary(model)

pred <- predict(model, mtcars)

# ✅ Create plots folder if it doesn't exist
if (!dir.exists("plots")) dir.create("plots")

# 📊 Save plot
png("plots/mpg_prediction_plot.png")
plot(mtcars$mpg, pred, col = "blue", pch = 19,
     xlab = "Actual MPG", ylab = "Predicted MPG", main = "Linear Regression")
abline(0, 1, col = "red")
dev.off()
