import sklearn
from sklearn.datasets import load_breast_cancer
from sklearn import cluster
import pandas as pd

data =  load_breast_cancer()
X = pd.DataFrame(data.data, columns = list(data.feature_names))
print (X[:5])

model = cluster.KMeans(n_clusters=95, random_state=145)
results = model.fit(X)

X["cluster"] = results.predict(X)
X["target"] = data.target
X["c"] = "lookatmeIamimportant"

classification_result=X[["cluster", "target","c"]].groupby(["cluster","target"]).agg("count")
print(classification_result)
