import sqlite3
import keyboard as keyboard
import telebot
from telebot import types
# подключение к бд
conn = sqlite3.connect("D:/Program file/SQlite/db.db", check_same_thread=False)
cur = conn.cursor()
# подключение к телеграмм
bot = telebot.TeleBot('5833847309:AAHxr8pjj4KmMcxdBOZ64MpgLMfeUFD0nbg')
# Метод, который получает сообщения и обрабатывает их
@bot.message_handler(commands=['start'])
def get_text_messages(message):
    # Готовим кнопки
    keyboard = types.ReplyKeyboardMarkup(resize_keyboard=True)
    # добавление кнопок
    key_visitka = types.KeyboardButton('О нас / Телефон')
    key_sait = types.KeyboardButton('Наш сайт')
    key_komplect = types.KeyboardButton('Услуги')
    key_map = types.KeyboardButton('Показать нас на карте')
    keyboard.add(key_visitka, key_sait, key_komplect)
    keyboard.add(key_map)
    bot.delete_message(message.chat.id,message.message_id - 0)
    bot.send_message(message.chat.id, text='Выбери категорию.', reply_markup=keyboard)
# Работа с меню
@bot.message_handler(content_types=['text'])
def callback_worker(message):
    if message.text == 'О нас / Телефон':
        bot.delete_message(message.chat.id,message.message_id - 0)
        bot.send_message(message.chat.id,
                        'Супермен - сеть мужских и женских парикмахерких, без излишеств. Доступные стрижки с качеством барбершопа. '
                        '\n\n «Супермен» - одно из самых известных парикмахерских в Самаре по работе с кожей головы и волосами, заслужившее доверие своих клиентов. Сильная команда профессионалов поможет подобрать оригинальную стрижку в соответствии с Вашим вкусом. '
                        '\n\n Спектр наших услуг состоит от простых стрижек до сваденбных:'
                        '\n 1. Мужские стрижки, тел: +7 (927) 325 45-43'            
                        '\n 2. Женские стрижки, тел: +7 (927) 325 45-34')
    elif message.text == 'Наш сайт':
        bot.delete_message(message.chat.id,message.message_id - 0)
        bot.send_message(message.chat.id, 'Представляю Вашему вниманию наш сайт, с помощью котрого вы можете посмотреть всю актуальную информацию по оказанию услуг и цене : https://supermancut.ru/?sity=%D1%E0%EC%E0%F0%E0')
    elif message.text == 'Показать нас на карте':
        bot.delete_message(message.chat.id,message.message_id - 0)
        bot.send_message(message.chat.id, 'Мы находимся по адресу: г.Самара, ул. Ново-Вокзальная, 144Б' \
                    '   Вот наше местоположение на карте:')
        bot.send_location(message.from_user.id, 53.240000, 50.213327, )
    elif message.text == 'Услуги':
        keyboard = types.ReplyKeyboardMarkup(resize_keyboard=True)
        key_vc = types.KeyboardButton('Мужские стрижки')
        key_vc2 = types.KeyboardButton('Женские стрижки')
        key_back = types.KeyboardButton('Меню')
        keyboard.add(key_vc, key_vc2, key_back)
        bot.delete_message(message.chat.id,message.message_id - 0)
        bot.send_message(message.chat.id, 'Выберите, пожалуйста, тему для показания услуг', reply_markup=keyboard)
    elif message.text == 'Назад':
        keyboard = types.ReplyKeyboardMarkup(resize_keyboard=True)
        key_pl = types.KeyboardButton('Мужской зал')
        key_mb = types.KeyboardButton('Женский зал')
        key_back = types.KeyboardButton('Меню')
        keyboard.add(key_pl, key_mb, key_back)
        bot.delete_message(message.chat.id,message.message_id - 0)
        bot.send_message(message.chat.id, 'Выберите, пожалуйста, тему для показания услуг', reply_markup=keyboard)
    elif message.text == 'Меню':
        keyboard = types.ReplyKeyboardMarkup(resize_keyboard=True)
        key_visitk = types.KeyboardButton('О нас / Телефон')
        key_sat = types.KeyboardButton('Наш сайт')
        key_komplec = types.KeyboardButton('Услуги')
        key_map = types.KeyboardButton('Показать нас на карте')
        keyboard.add(key_visitk, key_sat, key_komplec)
        keyboard.add(key_map)
        bot.delete_message(message.chat.id,message.message_id - 0)
        bot.send_message(message.chat.id, text='Выбери категорию.', reply_markup=keyboard)
    elif message.text == 'Мужские специалисты и стрижки':
        keyboard = types.ReplyKeyboardMarkup(resize_keyboard=True)
        key_pl = types.KeyboardButton('Мужские стрижки')
        key_mb = types.KeyboardButton('Мужские специалисты')
        key_back_str = types.KeyboardButton('Назад')
        keyboard.add(key_pl, key_mb, key_back_str)
        bot.delete_message(message.chat.id,message.message_id - 0)
        bot.send_message(message.chat.id, 'Выберите, пожалуйста, тему для показания услуг', reply_markup=keyboard)
    elif message.text == 'Женские специалисты и стрижки':
        keyboard = types.ReplyKeyboardMarkup(resize_keyboard=True)
        key_pl = types.KeyboardButton('Женские стрижки')
        key_mb = types.KeyboardButton('Женские специалисты')
        key_back_str = types.KeyboardButton('Назад')
        keyboard.add(key_pl, key_mb, key_back_str)
        bot.delete_message(message.chat.id,message.message_id - 0)
        bot.send_message(message.chat.id, 'Выберите, пожалуйста, тему для показания услуг', reply_markup=keyboard)
#======================Мужские стрижки====================================================================================
    elif message.text == 'Мужской зал':
        keyboard = types.ReplyKeyboardMarkup(resize_keyboard=True)
        key_mb1 = types.KeyboardButton('Мужские стрижки')
        key_mb2 = types.KeyboardButton('Мужские специалисты')
        key_back = types.KeyboardButton('Назад')
        keyboard.add(key_mb1, key_mb2, key_back)
        bot.delete_message(message.chat.id,message.message_id - 0)
        bot.send_message(message.chat.id, 'Посмотрите стрижки и спецалистов.', reply_markup=keyboard)
    elif message.text == 'Мужские стрижки':
        # добавление подменю
        keyboard = types.ReplyKeyboardMarkup(resize_keyboard=True)
        str_1 = types.KeyboardButton('Бокс')
        str_2 = types.KeyboardButton('Полубокс')
        str_3 = types.KeyboardButton('Классика')
        str_4 = types.KeyboardButton('Канадка')
        key_back_str = types.KeyboardButton('Мужские специалисты и стрижки')
        keyboard.add(str_1, str_2, str_3, str_4, key_back_str)
        bot.delete_message(message.chat.id,message.message_id - 0)
        bot.send_message(message.chat.id, 'Узнайте наименование услуги и её цену.', reply_markup=keyboard)
    #====================== Стрижки ====================================================================================
    elif message.text == 'Бокс':
        keyboard = types.ReplyKeyboardMarkup(resize_keyboard=True)
        # Бокс
        bot.delete_message(message.chat.id,message.message_id - 0)
        bot.send_photo(message.chat.id, photo=open(str(conn.execute('Select Sourse from Men_str WHERE id == 1').fetchone()[0]), 'rb'), caption=conn.execute('Select Name from Men_str WHERE id == 1').fetchone(), reply_markup=keyboard)
    elif message.text == 'Полубокс':
        keyboard = types.ReplyKeyboardMarkup(resize_keyboard=True)
        # Полубокс
        bot.delete_message(message.chat.id,message.message_id - 0)
        bot.send_photo(message.chat.id, photo=open(str(conn.execute('Select Sourse from Men_str WHERE id == 2').fetchone()[0]), 'rb'), caption=conn.execute('Select Name from Men_str WHERE id == 2').fetchone(), reply_markup=keyboard)
    elif message.text == 'Классика':
        keyboard = types.ReplyKeyboardMarkup(resize_keyboard=True)
        # Классика
        bot.delete_message(message.chat.id,message.message_id - 0)
        bot.send_photo(message.chat.id, photo=open(str(conn.execute('Select Sourse from Men_str WHERE id == 3').fetchone()[0]), 'rb'), caption=conn.execute('Select Name from Men_str WHERE id == 3').fetchone(), reply_markup=keyboard)
    elif message.text == 'Канадка':
        keyboard = types.ReplyKeyboardMarkup(resize_keyboard=True)
        # Канадка
        bot.delete_message(message.chat.id,message.message_id - 0)
        bot.send_photo(message.chat.id, photo=open(str(conn.execute('Select Sourse from Men_str WHERE id == 4').fetchone()[0]), 'rb'), caption=conn.execute('Select Name from Men_str WHERE id == 4').fetchone(), reply_markup=keyboard)
    #====================== Специалисты ====================================================================================
    elif message.text == 'Мужские специалисты':
        # добавление подменю
        keyboard = types.ReplyKeyboardMarkup(resize_keyboard=True)
        spc_1 = types.KeyboardButton('Фёдор')
        spc_2 = types.KeyboardButton('Иван')
        spc_3 = types.KeyboardButton('Пётр')
        spc_4 = types.KeyboardButton('Виктор')
        key_back_str = types.KeyboardButton('Мужские специалисты и стрижки')
        keyboard.add(spc_1, spc_2, spc_3, spc_4, key_back_str)
        bot.delete_message(message.chat.id,message.message_id - 0)
        bot.send_message(message.chat.id, 'Узнайте подробнее о специалистах.', reply_markup=keyboard) 
    #====================== Специалисты подробно ====================================================================================
    elif message.text == 'Фёдор':
        keyboard = types.ReplyKeyboardMarkup(resize_keyboard=True)
        # Фёдор
        bot.delete_message(message.chat.id,message.message_id - 0)
        bot.send_photo(message.chat.id, photo=open(str(conn.execute('Select Sourse from Special_men WHERE id == 1').fetchone()[0]), 'rb'), caption=conn.execute('Select Name from Special_men WHERE id == 1').fetchone(), reply_markup=keyboard)   
    elif message.text == 'Иван':
        keyboard = types.ReplyKeyboardMarkup(resize_keyboard=True)
        # Иван
        bot.delete_message(message.chat.id,message.message_id - 0)
        bot.send_photo(message.chat.id, photo=open(str(conn.execute('Select Sourse from Special_men WHERE id == 2').fetchone()[0]), 'rb'), caption=conn.execute('Select Name from Special_men WHERE id == 2').fetchone(), reply_markup=keyboard)
    elif message.text == 'Пётр':
        keyboard = types.ReplyKeyboardMarkup(resize_keyboard=True)
        # Пётр
        bot.delete_message(message.chat.id,message.message_id - 0)
        bot.send_photo(message.chat.id, photo=open(str(conn.execute('Select Sourse from Special_men WHERE id == 3').fetchone()[0]), 'rb'), caption=conn.execute('Select Name from Special_men WHERE id == 3').fetchone(), reply_markup=keyboard)
    elif message.text == 'Виктор':
        keyboard = types.ReplyKeyboardMarkup(resize_keyboard=True)
        # Виктор
        bot.delete_message(message.chat.id,message.message_id - 0)
        bot.send_photo(message.chat.id, photo=open(str(conn.execute('Select Sourse from Special_men WHERE id == 4').fetchone()[0]), 'rb'), caption=conn.execute('Select Name from Special_men WHERE id == 4').fetchone(), reply_markup=keyboard)
#==================================Конец мужских стрижек==================================================================
#==================================Женские стрижки========================================================================
    elif message.text == 'Женский зал':
        keyboard = types.ReplyKeyboardMarkup(resize_keyboard=True)
        key_mb1 = types.KeyboardButton('Женские стрижки')
        key_mb2 = types.KeyboardButton('Женские специалисты')
        key_back = types.KeyboardButton('Назад')
        keyboard.add(key_mb1, key_mb2, key_back)
        bot.delete_message(message.chat.id,message.message_id - 0)
        bot.send_message(message.chat.id, 'Посмотрите стрижки и спецалистов.', reply_markup=keyboard)
    elif message.text == 'Женские стрижки':
        # добавление подменю
        keyboard = types.ReplyKeyboardMarkup(resize_keyboard=True)
        str_wm_1 = types.KeyboardButton('Пикси')
        str_wm_2 = types.KeyboardButton('Паж')
        str_wm_3 = types.KeyboardButton('Каре')
        str_wm_4 = types.KeyboardButton('Каскад')
        key_back_str_wm = types.KeyboardButton('Женские специалисты и стрижки')
        keyboard.add(str_wm_1, str_wm_2, str_wm_3, str_wm_4, key_back_str_wm)
        bot.delete_message(message.chat.id,message.message_id - 0)
        bot.send_message(message.chat.id, 'Узнайте наименование услуги и её цену.', reply_markup=keyboard)
    #====================== Стрижки ====================================================================================
    elif message.text == 'Пикси':
        keyboard = types.ReplyKeyboardMarkup(resize_keyboard=True)
        # Пикси
        bot.delete_message(message.chat.id,message.message_id - 0)
        bot.send_photo(message.chat.id, photo=open(str(conn.execute('Select Sourse from Women_str WHERE id == 1').fetchone()[0]), 'rb'), caption=conn.execute('Select Name from Women_str WHERE id == 1').fetchone(), reply_markup=keyboard)
    elif message.text == 'Паж':
        keyboard = types.ReplyKeyboardMarkup(resize_keyboard=True)
        # Паж
        bot.delete_message(message.chat.id,message.message_id - 0)
        bot.send_photo(message.chat.id, photo=open(str(conn.execute('Select Sourse from Women_str WHERE id == 2').fetchone()[0]), 'rb'), caption=conn.execute('Select Name from Women_str WHERE id == 2').fetchone(), reply_markup=keyboard)
    elif message.text == 'Каре':
        keyboard = types.ReplyKeyboardMarkup(resize_keyboard=True)
        # Каре
        bot.delete_message(message.chat.id,message.message_id - 0)
        bot.send_photo(message.chat.id, photo=open(str(conn.execute('Select Sourse from Women_str WHERE id == 3').fetchone()[0]), 'rb'), caption=conn.execute('Select Name from Women_str WHERE id == 3').fetchone(), reply_markup=keyboard)
    elif message.text == 'Каскад':
        keyboard = types.ReplyKeyboardMarkup(resize_keyboard=True)
        # Каскад
        bot.delete_message(message.chat.id,message.message_id - 0)
        bot.send_photo(message.chat.id, photo=open(str(conn.execute('Select Sourse from Women_str WHERE id == 4').fetchone()[0]), 'rb'), caption=conn.execute('Select Name from Women_str WHERE id == 4').fetchone(), reply_markup=keyboard)
#==================================Конец женских стрижек==================================================================
#====================== Специалисты ====================================================================================
    elif message.text == 'Женские специалисты':
        # добавление подменю
        keyboard = types.ReplyKeyboardMarkup(resize_keyboard=True)
        spc_1 = types.KeyboardButton('Екатерина')
        spc_2 = types.KeyboardButton('Виолетта')
        spc_3 = types.KeyboardButton('Виктория')
        spc_4 = types.KeyboardButton('Яна')
        key_back_str = types.KeyboardButton('Женские специалисты и стрижки')
        keyboard.add(spc_1, spc_2, spc_3, spc_4, key_back_str)
        bot.delete_message(message.chat.id,message.message_id - 0)
        bot.send_message(message.chat.id, 'Узнайте подробнее о специалистах.', reply_markup=keyboard)
    #====================== Специалисты подробно ====================================================================================
    elif message.text == 'Екатерина':
        keyboard = types.ReplyKeyboardMarkup(resize_keyboard=True)
        # Фёдор
        bot.delete_message(message.chat.id,message.message_id - 0)
        bot.send_photo(message.chat.id, photo=open(str(conn.execute('Select Sourse from Special_women WHERE id == 1').fetchone()[0]), 'rb'), caption=conn.execute('Select Name from Special_women WHERE id == 1').fetchone(), reply_markup=keyboard)
    elif message.text == 'Виолетта':
        keyboard = types.ReplyKeyboardMarkup(resize_keyboard=True)
        # Иван
        bot.delete_message(message.chat.id,message.message_id - 0)
        bot.send_photo(message.chat.id, photo=open(str(conn.execute('Select Sourse from Special_women WHERE id == 2').fetchone()[0]), 'rb'), caption=conn.execute('Select Name from Special_women WHERE id == 2').fetchone(), reply_markup=keyboard)
    elif message.text == 'Виктория':
        keyboard = types.ReplyKeyboardMarkup(resize_keyboard=True)
        # Пётр
        bot.delete_message(message.chat.id,message.message_id - 0)
        bot.send_photo(message.chat.id, photo=open(str(conn.execute('Select Sourse from Special_women WHERE id == 3').fetchone()[0]), 'rb'), caption=conn.execute('Select Name from Special_women WHERE id == 3').fetchone(), reply_markup=keyboard)
    elif message.text == 'Яна':
        keyboard = types.ReplyKeyboardMarkup(resize_keyboard=True)
        # Виктор
        bot.delete_message(message.chat.id,message.message_id - 0)
        bot.send_photo(message.chat.id, photo=open(str(conn.execute('Select Sourse from Special_women WHERE id == 4').fetchone()[0]), 'rb'), caption=conn.execute('Select Name from Special_women WHERE id == 4').fetchone(), reply_markup=keyboard)
#==================================Конец женских специалистов==================================================================
bot.polling(none_stop=True, interval=0)
