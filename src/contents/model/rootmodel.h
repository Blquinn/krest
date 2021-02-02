#ifndef ROOTMODEL_H
#define ROOTMODEL_H

#include "requestmodel.h"

#include <QObject>

#include <contents/model/requestmodel.h>
#include <contents/client/httpclient.h>

class RootModel : public QObject
{
    Q_OBJECT
    Q_PROPERTY(RequestModel* activeRequest READ activeRequest WRITE setActiveRequest NOTIFY activeRequestChanged)
public:
    explicit RootModel(HttpClient *client, QObject *parent = nullptr);

    RequestModel* activeRequest() const { return m_activeRequest; }

    void setActiveRequest(RequestModel* req)
    {
        m_activeRequest = req;
        emit activeRequestChanged();
    }
public slots:
    void performRequest();
signals:
    void activeRequestChanged();
private:
     RequestModel *m_activeRequest;
     HttpClient *m_httpClient;
};

#endif // ROOTMODEL_H
