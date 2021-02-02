#ifndef PARAMTABLEMODEL_H
#define PARAMTABLEMODEL_H

#include <QObject>

#include <contents/model/paramrow.h>

class ParamTableModel : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QList<ParamRow*> params READ params WRITE setParams NOTIFY paramsChanged)
public:
    explicit ParamTableModel(QObject *parent = nullptr);

    QList<ParamRow*> params() const { return m_params; }

    void setParams(const QList<ParamRow*> &p)
    {
        m_params = p;
        emit paramsChanged();
    }

public slots:
    void addRow(ParamRow *row)
    {
        m_params.append(row);
        emit paramsChanged();
    }

    void addEmptyRow()
    {
        m_params.append(new ParamRow());
        emit paramsChanged();
    }

    void removeRow(int idx)
    {
        m_params.removeAt(idx);
        emit paramsChanged();
    }

signals:
    void paramsChanged();

private:
    QList<ParamRow*> m_params;
};

#endif // PARAMTABLEMODEL_H
