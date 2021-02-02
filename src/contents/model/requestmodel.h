#ifndef REQUESTMODEL_H
#define REQUESTMODEL_H

#include "paramrow.h"
#include "paramtablemodel.h"

#include <QObject>

class RequestModel : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString url READ url WRITE setUrl NOTIFY urlChanged)
    Q_PROPERTY(QString method READ method WRITE setMethod NOTIFY methodChanged)
    Q_PROPERTY(ParamTableModel* params READ params WRITE setParams NOTIFY paramsChanged)
    Q_PROPERTY(ParamTableModel* headers READ headers WRITE setHeaders NOTIFY headersChanged)
    Q_PROPERTY(QString body READ body WRITE setBody NOTIFY bodyChanged)
public:
    explicit RequestModel(QObject *parent = nullptr);

    QString url() const { return m_url; }
    ParamTableModel* params() const { return m_params; }
    ParamTableModel* headers() const { return m_headers; }
    QString body() const { return m_body; }
    QString method() const { return m_method; }

    void setParams(ParamTableModel* p)
    {
        m_params = p;
        emit paramsChanged();
    }

    void setHeaders(ParamTableModel* h)
    {
        m_headers = h;
        emit headersChanged();
    }

    void setBody(QString b)
    {
        m_body = b;
        emit bodyChanged();
    }

    void setUrl(QString u)
    {
        m_url = u;
        emit urlChanged();
    }

    void setMethod(QString m)
    {
        m_method = m;
        emit methodChanged();
    }
signals:
    void urlChanged();
    void paramsChanged();
    void headersChanged();
    void bodyChanged();
    void methodChanged();
private:
    QString m_url;
    ParamTableModel* m_params;
    ParamTableModel* m_headers;
    // TODO: Variant body types.
    QString m_body;
    QString m_method;
};

#endif // REQUESTMODEL_H
