from sklearn.model_selection import train_test_split
from sklearn.naive_bayes import GaussianNB
from sklearn.metrics import confusion_matrix
from sklearn import preprocessing
from sklearn.decomposition import PCA
import pandas as pd
import matplotlib.pyplot as plt

url = "D:\\Desktop\\Study\\5 семестр\\ОС и ОБД\\Лабораторные\\№3\\data2.csv"
data = pd.read_csv(url, sep= ";")
X = data[[u'fixed_acidity', u'volatile_acidity', u'citric_acid',
u'residual_sugar', u'chlorides', u'free_sulfur_dioxide',
u'total_sulfur_dioxide', u'density', u'pH', u'sulphates',
u'alcohol',]]
print(X)
y = data.quality
print(y)
X = preprocessing.StandardScaler().fit(X).transform(X)

gnb = GaussianNB()

predicted_correct = []
for i in range(1,10):
    model = PCA(n_components = i)
    results = model.fit(X)
    Z = results.transform(X)
    fit = gnb.fit(Z,y)
    pred = fit.predict(Z)
    predicted_correct.append(confusion_matrix(pred,y).trace())
    print (predicted_correct)
    plt.plot(predicted_correct)
plt.show()

pd.DataFrame(results.components_, columns = list([u'fixed_acidity', u'volatile_acidity', u'citric_acid', u'residual_sugar', u'chlorides', u'free_sulfur_dioxide', u'total_sulfur_dioxide', u'density', u'pH', u'sulphates', u'alcohol',])).to_csv('D:\\Desktop\\Study\\table3.csv')