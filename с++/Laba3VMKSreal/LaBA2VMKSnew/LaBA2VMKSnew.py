
import requests
import time
import os.path

print("\nНачалась загрузка файла WinRAR")

startTime = time.time() # время начала замера
ur1 = 'http://winrar-full.com/go/?https://installpack.org/InstallPack.exe?preselecteditems=7-zip&ga_cn=direct_download&ga_cs=WinRAR-Full.com&ga_cm=7-zip&ga_cc=download_installpack_recommended'
#файл winrar
r1 = requests.get(ur1)

with open('D:\WinRAR.zip', 'wb') as f:
    f.write(r1.content)

endTime = time.time() #время конца замера
totalTime = endTime - startTime #вычисляем затраченное время
print("Время, затраченное на загрузку WinRAR: ", round(totalTime, 2) , " секунд")
size_WinRAR = os.path.getsize('D:\WinRAR.zip')
mb_WinRAR=(size_WinRAR*(0.00000095367431640625))
print("Размер файла WinRAR.zip: ", round(mb_WinRAR, 2), " Мб")
# Retrieve HTTP meta-data
if r1.status_code == 200:
    print('Статус WinRAR: успешно')
elif r1.status_code == 404:
    print('Статус WinRAR: не найдено')
print("Заголовок WinRAR HTTP:",r1.headers['content-type'])


print('\n\nНачалась загрузка файла WinZIP')
#файл winzip
startTime_zip = time.time() # время начала замера
url_winzip = 'https://windowszip.ru/downloads/WindowsZipSetup.exe'
r_winzip = requests.get(url_winzip)
with open('D:\WinZIP.zip', 'wb') as f:
    f.write(r_winzip.content)

endTime_zip = time.time() #время конца замера
totalTime_zip = endTime_zip - startTime_zip #вычисляем затраченное время
print("Время, затраченное на загрузку WinRAR: ", round(totalTime_zip, 2) , " секунд")
size_WinZIP = os.path.getsize('D:\WinZIP.zip')
mb_WinZIP=(size_WinZIP*(0.00000095367431640625))
print("Размер файла WinZIP.zip: ", round(mb_WinZIP, 2), " Мб")
# Retrieve HTTP meta-data
if r_winzip.status_code == 200:
    print('Статус WinZIP: успешно')
elif r_winzip.status_code == 404:
    print('Статус WinRAR: не найдено')
print("Заголовок WinZIP HTTP:",r_winzip.headers['content-type'])


print('\n\nНачалась загрузка файла Discord')

#файл dis
startTime_dis = time.time() # время начала замера
url_dis = 'https://inst.setup4pc.ru/wredirect/?u=7b2275746d5f736f75726365223a22646972656374222c2275746d5f6d656469756d223a22637063222c2275746d5f63616d706169676e223a22646973636f7264227d&file=discord'
r_dis = requests.get(url_dis)
with open('D:\Discord.zip', 'wb') as f:
    f.write(r_dis.content)

endTime_dis = time.time() #время конца замера
totalTime_dis = endTime_dis - startTime_dis #вычисляем затраченное время
print("Время, затраченное на загрузку Discord: ", round(totalTime_dis, 2) , " секунд")
size_dis = os.path.getsize('D:\Discord.zip')
mb_dis=(size_dis*(0.00000095367431640625))
print("Размер файла Discord.zip: ", round(mb_dis, 2), " Мб")
# Retrieve HTTP meta-data
if r_dis.status_code == 200:
    print('Статус Discord: успешно')
elif r_dis.status_code == 404:
    print('Статус Discord: не найдено')
print("Заголовок Discord HTTP:",r_dis.headers['content-type'])


print('\n\nНачалась загрузка файла Zoom')

#файл zoom
startTime_zoom = time.time() # время начала замера
url_zoom = 'https://zoom.us/client/latest/ZoomInstaller.exe'
r_zoom = requests.get(url_zoom)
with open('D:\Zoom.zip', 'wb') as f:
    f.write(r_zoom.content)

endTime_zoom = time.time() #время конца замера
totalTime_zoom = endTime_zoom - startTime_zoom #вычисляем затраченное время
print("Время, затраченное на загрузку Zoom: ", round(totalTime_zoom, 2) , " секунд")
size_zoom = os.path.getsize('D:\Zoom.zip')
mb_zoom=(size_zoom*(0.00000095367431640625))
print("Размер файла Zoom.zip: ", round(mb_zoom, 2), " Мб")
# Retrieve HTTP meta-data
if r_zoom.status_code == 200:
    print('Статус Zoom: успешно')
elif r_zoom.status_code == 404:
    print('Статус Zoom: не найдено')
print("Заголовок Zoom HTTP:",r_zoom.headers['content-type'])

print('\n\nНачалась загрузка файла Minecraft')

#файл Minecraft
startTime_min = time.time() # время начала замера
url_min = 'https://tlauncher.org/installer'
r_min = requests.get(url_min)
with open('D:\Minecraft.zip', 'wb') as f:
    f.write(r_zoom.content)

endTime_min = time.time() #время конца замера
totalTime_min = endTime_min - startTime_min #вычисляем затраченное время
print("Время, затраченное на загрузку Minecraft: ", round(totalTime_min, 2) , " секунд")
size_min = os.path.getsize('D:\Minecraft.zip')
mb_min=(size_min*(0.00000095367431640625))
print("Размер файла Minecraft.zip: ", round(mb_min), " Мб")
# Retrieve HTTP meta-data
if r_min.status_code == 200:
    print('Статус Minecraft: успешно')
elif r_min.status_code == 404:
    print('Статус Minecraft: не найдено')
print("Заголовок Minecraft HTTP:",r_min.headers['content-type'])