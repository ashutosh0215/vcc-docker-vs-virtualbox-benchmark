from sklearn.datasets import load_iris
from sklearn.linear_model import LogisticRegression
import joblib

# Load and train
X, y = load_iris(return_X_y=True)
model = LogisticRegression(max_iter=200)
model.fit(X, y)

# Save model
joblib.dump(model, 'model.pkl')
print("Model saved as model.pkl")
