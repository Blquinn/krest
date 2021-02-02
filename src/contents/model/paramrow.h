#ifndef PARAMROW_H
#define PARAMROW_H

#include <QObject>

class ParamRow : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString key MEMBER m_key NOTIFY keyChanged)
    Q_PROPERTY(QString value MEMBER m_value NOTIFY valueChanged)
    // TODO: Rename me to "description"
    Q_PROPERTY(QString display MEMBER m_display NOTIFY displayChanged)
public:
    explicit ParamRow(QObject *parent = nullptr);
    explicit ParamRow(QString key, QString value, QString display, QObject *parent = nullptr);
signals:
    void keyChanged();
    void valueChanged();
    void displayChanged();
private:
    QString m_key;
    QString m_value;
    QString m_display;
};

#endif // PARAMROW_H
