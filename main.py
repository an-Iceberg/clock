import sys

from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine

from backend import Backend

app = QGuiApplication(sys.argv)

engine = QQmlApplicationEngine()
engine.quit.connect(app.quit)
engine.load("Main.qml")

backend = Backend()

engine.rootObjects()[0].setProperty("backend", backend)

exit_code = app.exec()
sys.exit(exit_code)
