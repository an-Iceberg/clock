import sys

from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine

from backend import Backend

app = QGuiApplication(sys.argv)

engine = QQmlApplicationEngine()
engine.addImportPath(sys.path[0])
engine.quit.connect(app.quit)
engine.loadFromModule("UI", "Main")

backend = Backend()

engine.rootObjects()[0].setProperty("backend", backend)

exit_code = app.exec()
sys.exit(exit_code)
