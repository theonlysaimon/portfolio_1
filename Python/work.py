class Cat:
    breed='pers'

    def drive(*args):
        print('Погнали',args)

    def show_breed(instance):
        print(f'my breed is {instance.breed}')


a=Cat()

class Person:
    name='Ivan'
    age=30

'''
print(Person.name)
print(Person.age)
#print(Person.__dict__)
print(getattr(Person,'name'))
print(getattr(Person,'c','no attr'))

Person.name = 'Misha'
Person.x = [23,45,23]
print(Person.name)
print(Person.x)

setattr(Person, 'x', 234)
setattr(Person, 'y', 30)

print(Person.y)
print(Person.x)

del Person.x
print(Person.__dict__)

delattr(Person, 'y')
print(Person.__dict__)

a=Person()
b=Person()

a1=Cat()
a2=Cat()
print(a1.engine)

a1.seat=4
print(a1.__dict__, a1.seat)

a1.model='Lada'
print(a1.__dict__,a1.model)
print(a2.__dict__,a2.model)

a2.size=80
print(a2.__dict__,a2.size)

print(Cat.__dict__)
Cat.drive()
getattr(Cat, 'drive')()

a1.drive()
a2.drive()

'''

walt=Cat()
walt.show_breed()

walt.breed = 'siam'
walt.show_breed()
