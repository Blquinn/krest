#include "paramrow.h"

ParamRow::ParamRow(QObject *parent)
    : QObject(parent)
    , m_key("")
    , m_value("")
    , m_display("")
{
}

ParamRow::ParamRow(QString key, QString value, QString display, QObject *parent)
    : QObject(parent)
    , m_key(key)
    , m_value(value)
    , m_display(display)
{
}
