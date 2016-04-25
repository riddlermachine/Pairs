#ifndef CELL_HPP
#define CELL_HPP
#include <QVector>
#include <QObject>

class Cell : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int key READ key NOTIFY keyChanged)
    Q_PROPERTY(bool isOpen READ isOpen NOTIFY openChanged)

public:
    explicit Cell(QObject *parent = 0);

    int key() const { return m_key; }

    void setKey(int key);

    bool isOpen() const { return m_open; }

public slots:
    void open();

signals:
    void keyChanged(int key);
    void openChanged();

private:
    int m_key;
    bool m_open;
};

#endif // CELL_HPP
