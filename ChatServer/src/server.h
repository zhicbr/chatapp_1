#ifndef SERVER_H
#define SERVER_H

#include <QTcpServer>
#include <QTcpSocket>
#include <QJsonObject>
#include <QSqlDatabase>
#include "../Common/messageprotocol.h"

class Server : public QObject {
    Q_OBJECT
public:
    explicit Server(QObject *parent = nullptr);
    ~Server();
    void start();

private slots:
    void handleNewConnection();
    void handleClientData();

private:
    struct ClientInfo {
        QTcpSocket *socket;
        bool isLoggedIn = false;
        QString nickname;
    };

    QTcpServer *tcpServer;
    QList<ClientInfo> clients;
    QSqlDatabase db;

    bool initDatabase();
    QString hashPassword(const QString &password);
    bool registerUser(const QString &email, const QString &nickname, const QString &password);
    QString loginUser(const QString &nickname, const QString &password, ClientInfo &client);
    bool addFriend(const QString &user, const QString &friendName);
    QStringList getFriendList(const QString &user);
    bool saveChatMessage(const QString &from, const QString &to, const QString &content);
    QJsonArray getChatHistory(const QString &user1, const QString &user2);
    QString searchUser(const QString &query);
};

#endif