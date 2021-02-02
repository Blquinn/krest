#include "httpclient.h"

#include <QNetworkReply>

HttpClient::HttpClient(QObject *parent)
    : QObject(parent)
    , m_manager(new QNetworkAccessManager)
{
    connect(this->m_manager, &QNetworkAccessManager::finished,
            this, &HttpClient::requestFinished);
}

void HttpClient::initiateRequest(RequestModel *request)
{
    QNetworkRequest req;
    // TODO: Translate the rest of the request parameters.
    req.setUrl(request->url());
    m_manager->sendCustomRequest(req, request->method().toUtf8());
}

void HttpClient::requestFinished(QNetworkReply *reply)
{
    if (reply->error())
    {
        qDebug() << "Network request error " << reply->errorString();
        return;
    }

    auto body = reply->readAll();
    qDebug() << "Network reply: " << QString(body);
}
