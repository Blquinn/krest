#include "rootmodel.h"

RootModel::RootModel(HttpClient *client, QObject *parent)
    : QObject(parent)
    , m_activeRequest(nullptr)
    , m_httpClient(client)
{

}

void RootModel::performRequest()
{
    assert(m_activeRequest);
    m_httpClient->initiateRequest(m_activeRequest);
}
