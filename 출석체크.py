import sys
from PyQt5.QtWidgets import *
from PyQt5.QtGui import *
from PyQt5 import QtGui, QtWidgets,uic
import cx_Oracle as oci
from PyQt5.QtCore import QDate

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
        uic.loadUi('./프로젝트/출석관리,통계-작성중', self)
        self.setWindowTitle('출결관리앱')
        self.setWindowIcon(QIcon('./image/kitty.png'))

        self.show()



# 실행
if __name__ == "__main__":
    app = QtWidgets.QApplication(sys.argv)
    window = AttendanceApp(external_attendance_data)  # 외부 출결 데이터 전달
    window.show()
    sys.exit(app.exec_())

if __name__ == '__main__':
    app = QApplication(sys.argv)
    win = MainWindow()
    app.exec_()
