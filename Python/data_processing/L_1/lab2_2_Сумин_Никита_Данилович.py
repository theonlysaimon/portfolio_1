from sklearn import neighbors
from sklearn.metrics import confusion_matrix
import numpy as np

predictors = np.random.random(2000).reshape(1000, 2)
target = np.around(predictors.dot(np.array([0.4, 0.6])) + np.random.random(1000))
clf = neighbors.KNeighborsClassifier(n_neighbors = 12)
knn = clf.fit(predictors, target)

print("Значения метрики соответствия: ",knn.score(predictors, target))

prediction = knn.predict(predictors)
print("Матрица несоответсвия: \n",confusion_matrix(target, prediction))