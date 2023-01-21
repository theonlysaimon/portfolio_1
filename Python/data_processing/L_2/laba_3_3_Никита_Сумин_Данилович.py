from sklearn.model_selection import train_test_split
from sklearn.naive_bayes import GaussianNB
from sklearn.metrics import confusion_matrix
from sklearn import preprocessing
from sklearn.decomposition import PCA
import pandas as pd
import matplotlib.pyplot as plt

url = "D:\\Desktop\\Study\\5_semestr\\OS_I_OBD\\Laba\\#3\\data4.csv"	

data = pd.read_csv(url, sep= ";")
X = data[[u'sample_number', u'quantity', u'copper', u'zinc',
u'calcium', u'gold', u'silver', u'organic',]]
print(X)
y = data.sample_number
print(y)
X = preprocessing.StandardScaler().fit(X).transform(X)

gnb = GaussianNB()

predicted_correct = []
for i in range(1,9):
    model = PCA(n_components = i)
    results = model.fit(X)
    Z = results.transform(X)
    fit = gnb.fit(Z,y)
    pred = fit.predict(Z)
    predicted_correct.append(confusion_matrix(pred,y).trace())
    print (predicted_correct)
    plt.plot(predicted_correct)
plt.show()

pd.DataFrame(results.components_, columns = list([u'sample_number', u'quantity', u'copper', u'zinc', u'calcium', u'gold', u'silver', u'organic',])).to_csv('D:\\Desktop\\Study\\table4.csv')