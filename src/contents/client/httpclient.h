#ifndef HTTPCLIENT_H
#define HTTPCLIENT_H

#include <QObject>
#include <QNetworkAccessManager>

#include <contents/model/requestmodel.h>

class HttpClient : public QObject
{
    Q_OBJECT
public:
    HttpClient(QObject *parent = nullptr);
public slots:
    // TODO: Accept all request parameters
    void initiateRequest(RequestModel *request);
private slots:
    void requestFinished(QNetworkReply *reply);
private:
    QNetworkAccessManager* m_manager;
};

#endif // HTTPCLIENT_H
