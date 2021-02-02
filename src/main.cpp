#include <QApplication>
#include <QQmlApplicationEngine>
#include <QtQml>
#include <QUrl>
#include <KLocalizedContext>

#include <contents/model/paramrow.h>
#include <contents/model/paramtablemodel.h>
#include <contents/model/rootmodel.h>
#include <contents/client/httpclient.h>

Q_DECL_EXPORT int main(int argc, char *argv[])
{
    QGuiApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QApplication app(argc, argv);
    QCoreApplication::setOrganizationName("KDE");
    QCoreApplication::setOrganizationDomain("kde.org");
    QCoreApplication::setApplicationName("KRest");
    
    QQmlApplicationEngine engine;

//    qmlRegisterType<RootModel>("me.blq.KRest.models", 1, 0, "RootModel");
//    qmlRegisterType<RequestModel>("me.blq.KRest.models", 1, 0, "RequestModel");
    qmlRegisterType<ParamTableModel>("me.blq.KRest.models", 1, 0, "ParamTableModel");

    QScopedPointer<HttpClient> client(new HttpClient);
    QScopedPointer<RequestModel> req(new RequestModel);
    QScopedPointer<RootModel> rootModel(new RootModel(client.get()));

    rootModel->setActiveRequest(req.get());

    engine.rootContext()->setContextObject(new KLocalizedContext(&engine));
    engine.rootContext()->setContextProperty("rootModel", QVariant::fromValue(rootModel.get()));

    engine.load(QUrl(QStringLiteral("qrc:///main.qml")));

    if (engine.rootObjects().isEmpty()) {
        return -1;
    }

    return app.exec();
}
