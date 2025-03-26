import sys
from PyQt5.QtWidgets import *
from PyQt5.QtGui import *
from PyQt5 import QtGui, QtWidgets,uic
import cx_Oracle as oci

sid = 'XE'
host = 'localhost'
port = 1521
username = 'attendance'
password = '12345'
basic_msg = '출석체크'

class MainWindow(QMainWindow):
    def __init__(self):
        super(MainWindow, self).__init__()
        self.initUI()
        # self.loadData()

    def initUI(self):
        uic.loadUi('./프로젝트/관리자 출결 체크.ui', self)
        self.setWindowTitle('출결관리앱')
        self.setWindowIcon(QIcon('./image/kitty.png'))

        self.show()

if __name__ == '__main__':
    app = QApplication(sys.argv)
    win = MainWindow()
    app.exec_()
