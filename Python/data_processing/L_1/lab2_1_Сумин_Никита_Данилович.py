import statsmodels.api as sm
import numpy as np

predictors = np.random.random(1000).reshape(500, 2)
target = predictors.dot(np.array([0.5, 0.4])) + np.random.random(500)

result = sm.OLS(target, predictors).fit()
text='Результаты регрессии'
print(text.center(len(text)+68))
print(result.summary())