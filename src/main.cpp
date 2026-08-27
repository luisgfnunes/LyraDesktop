#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QIcon>

using namespace Qt::StringLiterals;

int main(int argc, char *argv[])
{
    QGuiApplication::setApplicationName("LyraDesktop");
    QGuiApplication::setOrganizationName("Lyra");
    QGuiApplication::setOrganizationDomain("lyradesktop.org");

    QGuiApplication app(argc, argv);

    // Opcional: Define um ícone genérico caso o sistema não forneça um
    // app.setWindowIcon(QIcon::fromTheme("multimedia-audio-player"));

    QQmlApplicationEngine engine;

    const QUrl url = QUrl::fromLocalFile(QCoreApplication::applicationDirPath() + "/../src/qml/main.qml");

    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
        &app, [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        }, Qt::QueuedConnection);

    engine.load(url);

    return app.exec();
}