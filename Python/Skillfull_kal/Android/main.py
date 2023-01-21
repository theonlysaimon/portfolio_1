from kivy.app import App
from kivy.uix.button import Button
from kivy.uix.gridlayout import GridLayout
from kivy.uix.label import Label
from kivy.uix.boxlayout import BoxLayout
from kivy.lang.builder import Builder

from kivy.core.window import Window
Window.clearcolor = (.14, .14, .14, 1)

def get_boxes(length, width, height):
    
    x = width + height
    if x >= 450 and x <= 500:
        x = 500
    else:
        x = width + height
    S = ((length + width) * 2 + 35) * x * 1e-06

    price = '{:.0f}'.format(S * 110 + 10)

    return price

def get_ingrid(length, width, height, count):
    
    if count!=0 and length!=0 and width!=0 and height!=0:
        price = get_boxes(length, width, height)
        circulation = '{:.0f}'.format(float((int(price))*count))
    
    elif count==0 and length!=0 and width!=0 and height!=0:
        price = get_boxes(length, width, height)
        circulation = 0
    
    else:
        price = 0
        circulation = 0

    return { 'price':price, 'circulation':circulation, 'count':count}


class Container(GridLayout):
    
    def calculate(self):
        try:
            length = int(self.input_length.text)
            width = int(self.input_width.text)
            height = int(self.input_height.text)
            count = int(self.input_count.text)
        except:
            length = 0
            width = 0
            height = 0
            count = 0

        ingrid=get_ingrid(length, width, height, count)

        self.price.text = str(ingrid.get('price'))
        self.circulation.text = str(ingrid.get('circulation'))

Builder.load_file('./data/my.kv')

class MyApp(App):
    def build(self):
        return Container()

if __name__ == '__main__':
    MyApp().run()