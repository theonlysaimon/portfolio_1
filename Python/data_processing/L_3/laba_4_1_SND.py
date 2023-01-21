import numpy as np

class perceptron():

    def __init__(self, X,y, threshold = 0.5, learning_rate = 0.62, max_epochs = 105):
        self.threshold = threshold
        self.learning_rate = learning_rate
        self.X = X
        self.y = y
        self.max_epochs = max_epochs

    def initialize(self, init_type = 'zeros'):
        if init_type == 'random':
            self.weights = np.random.rand(len(self.X[0])) * 0.05
        if init_type == 'zeros':
            self.weights = np.zeros(len(self.X[0]))

    def train(self):
        epoch = 0
        while True:
            error_count = 0
            epoch += 1
            for (X,y) in zip(self.X, self.y):
                error_count += self.train_observation(X,y,error_count)

            if error_count == 0:
                print ("обучение успешно завершено")
            break
            if epoch >= self.max_epochs:
                print ("достигнуто максимальное количество эпох, оптимального прогноза не найдено")
            break

    def train_observation(self,X,y, error_count):
        result = np.dot(X, self.weights) > self.threshold
        error = y - result

        if error != 0:
            error_count += 1
            for index, value in enumerate(X):
                self.weights[index] += self.learning_rate * error * value
        return error_count

    def predict(self, X):
        return int(np.dot(X, self.weights) > self.threshold)
    
X = [(1,0,0),(1,1,0),(1,1,1),(1,1,1),(1,0,1),(1,0,1),(1,0,0),(1,1,0),(1,1,1),(1,1,1),(1,0,1),(1,0,0),(0,0,0),(1,1,0),(0,1,1),(1,1,0),(1,0,1),(1,1,1),(1,0,1),(1,0,0)]
y = [0,0,1,1,1,0]

T = [(1,0,1),(1,0,0),(1,0,1),(1,1,1),(1,0,1),(1,1,1),(1,0,0),(0,1,0),(1,0,0),(0,1,1),(1,0,1),(1,0,0),(0,1,1),(1,1,0),(0,0,1),(1,1,0),(1,0,1),(1,1,1),(1,0,1),(1,0,0)]
t = [1,0,1,0,1,0]

R = [(0,0,0),(1,1,0),(1,0,1),(1,1,1),(1,1,1),(1,0,1),(1,0,0),(1,1,0),(1,1,1),(1,0,1),(1,0,1),(1,1,1),(0,0,0),(1,1,0),(0,0,1),(1,1,1),(1,0,1),(1,1,1),(1,0,1),(1,0,0)]
r = [1,0,1,0,1,0]

E = [(1,1,0),(1,1,0),(1,0,1),(1,1,1),(1,0,1),(1,0,1),(1,1,0),(1,1,0),(1,1,1),(1,1,1),(1,0,1),(1,1,0),(0,1,0),(1,1,0),(0,1,1),(1,1,1),(1,0,1),(1,1,1),(1,0,1),(1,0,0)]
e = [1,0,1,1,1,1]

W = [(1,1,0),(1,1,0),(1,0,1),(1,1,1),(1,1,1),(1,0,1),(1,0,0),(1,1,0),(1,0,1),(1,1,1),(1,1,1),(1,0,0),(0,0,0),(1,0,0),(0,1,1),(1,1,0),(1,0,1),(1,1,1),(1,0,1),(1,0,0)]
w = [0,1,0,1,1,0]

list_a = [X,T,R,E,W]
list_b = [y,t,r,e,w]

for k,j in zip(list_a,list_b):
    p = perceptron(k,j)
    p.initialize()
    p.train()
    print("Целевая перменная X: ", k)
    print("Независимая переменная y: ", j)
    print (p.predict((1,0,1)))
    print (p.predict((1,1,1)))
    print (p.predict((0,0,1)))
