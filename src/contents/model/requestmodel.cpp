#include "requestmodel.h"

RequestModel::RequestModel(QObject *parent)
    : QObject(parent)
    , m_url("")
    , m_params(new ParamTableModel(this))
    , m_headers(new ParamTableModel(this))
    , m_body("")
    , m_method("GET")
{
}
