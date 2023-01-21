// Laba1Vkms.cpp : Этот файл содержит функцию "main". Здесь начинается и заканчивается выполнение программы.
//

#include <iostream>
#include <QNetworkInterface>


void HostAddress(const QString& path) {
    QFile f(path);
    f.open(QIODevice::WriteOnly);
    QList<QHostAddress> ipList = QNetworkInterface::allAddresses();
    QString s;
    for (auto i : ipList) {
        s = QString("\r\n"
            "\r\nIP: \t%1"
            "\r\nscope: \t%2"
            "\r\nglobal: \t%3"
            "\r\nlocal: \t%4"
            "\r\nloopback: \t%5"
            "\r\nbroadcast: \t%6"
            "\r\nmulticast: \t%7").arg(i.toString())
            .arg(i.scopeId())
            .arg((i.isGlobal()) ? "да" : "нет")
            .arg((i.isLinkLocal()) ? "да" : "нет")
            .arg((i.isLoopback()) ? "да" : "нет")
            .arg((i.isBroadcast()) ? "да" : "нет")
            .arg((i.isMulticast()) ? "да" : "нет");
        f.write(s.toUtf8());
    }
    f.close();
}

void NetworkInterface(const QString& path) {
    QFile f(path);
    f.open(QIODevice::WriteOnly);
    QList<QNetworkInterface> interfaceList = QNetworkInterface::allInterfaces();
    QNetworkInterface::InterfaceFlags fl;
    QNetworkInterface::InterfaceType t;
    QList<QNetworkAddressEntry> ipList;
    QString flag;
    QString type;
    for (auto i : interfaceList) {
        f.write("\r\n");
        fl = i.flags();
        flag = QString("\tisUP: \t%1, \trun: \t%2, \tbrodcast: \t%3, "
            "\tloop: \t%4, \tp-to-p: \t%5, "
            "\tmulticast: \t%6")
            .arg((fl & QNetworkInterface::IsUp) ? "да" : "нет")
            .arg((fl & QNetworkInterface::IsRunning) ? "да" : "нет")
            .arg((fl & QNetworkInterface::CanBroadcast) ? "да" : "нет")
            .arg((fl & QNetworkInterface::IsLoopBack) ? "да" : "нет")
            .arg((fl & QNetworkInterface::IsPointToPoint) ? "да" : "нет")
            .arg((fl & QNetworkInterface::CanMulticast) ? "да" : "нет");
        t = i.type();
        type = QString("virtual: %1, "
            "ethernet: %2, Wifi: %3").arg(t & QNetworkInterface::Virtual)
            .arg(t & QNetworkInterface::Ethernet)
            .arg(t & QNetworkInterface::Wifi);
        f.write("\r\n");
        f.write(QString("\r\nВалидность: \t%1"
            "\r\nИмя: \t%2"
            "\r\nЧитаемое имя: \t%3"
            "\r\nТип: \t%4"
            "\r\nФлаг: \t%5"
            "\r\nMAC: \t%6"
            "\r\nUnit: \t%7")
            .arg((i.isValid()) ? "да" : "нет")
            .arg(i.name())
            .arg(i.humanReadableName())
            .arg(type)
            .arg(flag)
            .arg(i.hardwareAddress())
            .arg(i.maximumTransmissionUnit()).toUtf8());
        ipList = i.addressEntries();
        if (!ipList.isEmpty())
            f.write("\r\nIP\tДлина\tМаска\tШироковещательный");
        for (auto x : ipList)
            f.write(QString("\r\n"
                "%1\t%2\t%3\t%4")
                .arg(x.ip().toString())
                .arg(x.prefixLength())
                .arg(x.netmask().toString())
                .arg(x.broadcast().toString()).toUtf8());
    }
    f.close();
}

QByteArray httpDownload(const QUrl& url, const int sec, QString *error) {
    QByteArray data;              // Здесь будет результат
    QTime t=QTime::currentTime(); // Текущее время
    QEventLoop loop; // Цикл событий для перевода в синхронный вызов
    // Обеспечение принудительного прерывания по времени
    QTimer::singleShot(1000*((sec>0)?sec:10), &loop, SLOT(quit()));  
    QNetworkAccessManager manager; // Диспетчер сети
    QNetworkRequest request;       // Запрос
    // Разрешаем переходить по редиректам
    request.setAttribute(QNetworkRequest::FollowRedirectsAttribute, true);
    request.setUrl(url); 	    // Задаем URL запроса
    QNetworkReply *reply=manager.get(request); // Выполнение GET запроса
    // Отслеживание динамики отправки запроса
    QObject::connect(reply,
                     &QNetworkReply::uploadProgress,
                     [](qint64 bytesReceived, qint64 bytesTotal){
        // Обработка
    });
    // Отслеживание динамики загрузки ответа
    QObject::connect(reply,
                     &QNetworkReply::downloadProgress,
                     [](qint64 bytesReceived, qint64 bytesTotal){
        // Обработка
    });
    // Переадресация
    QObject::connect(reply,
                     &QNetworkReply::redirected,
                     [](const QUrl &url){
          // Обработка
    });
    // Отслеживание окончания загрузки
    QObject::connect(reply,
                     &QNetworkReply::finished,
                     [&loop,&data,error,reply](){
        if(!reply->error())
            data=reply->readAll();
        else if(error!=nullptr) *error=reply->errorString();
        loop.quit();
    });
    // Обработка ошибок
    QObject::connect(reply,
                     &QNetworkReply::errorOccurred,
                     [&loop,reply,error](QNetworkReply::NetworkError code){
        if(error!=nullptr) *error=reply->errorString();
        loop.quit();
    });
    // Запрос сертификата SSL
    QObject::connect(reply,
                     &QNetworkReply::preSharedKeyAuthenticationRequired,
                     [&loop,error](QSslPreSharedKeyAuthenticator *authenticator) {
        if(error!=nullptr) *error="Auth";
        loop.quit();
    });
    loop.exec();            // Цикл ожидания по времени с НЕ блокировкой событий
    QList<QByteArray> h=reply->rawHeaderList(); // Заголовки ответа
    // Заголовки ответа и значения заголовков
    QList<QNetworkReply::RawHeaderPair> e=reply->rawHeaderPairs();
    reply->deleteLater();  // Пометка объекта для безопасного удаление
    // Время выполнения запроса в милисекундах с учетом времени соединения
    int time=t.msecsTo(QTime::currentTime());    
    return data;
}


int main()
{
    std::cout << "Hello World!\n";
}
