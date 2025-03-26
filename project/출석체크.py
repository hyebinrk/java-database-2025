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

    from PyQt5.QtGui import QPixmap

    # def paintCell(self, painter, rect, date):
    #     super().paintCell(painter, rect, date)

    #     date_str = date.toString("yyyy-MM-dd")
    #     if date_str in self.attendance_data:
    #         status = self.attendance_data[date_str]

    #         # 아이콘 불러오기 (출석/지각/결석 아이콘 설정)
    #         if status == "출석":
    #             icon = QPixmap("attend_icon.png")
    #         elif status == "지각":
    #             icon = QPixmap("late_icon.png")
    #         elif status == "결석":
    #             icon = QPixmap("absent_icon.png")
            
    #         # 아이콘을 날짜 칸 중앙에 배치
    #         painter.drawPixmap(rect.x() + 10, rect.y() + 10, 20, 20, icon)


    # 새로추가-------------------------------------------------------


# 출결 데이터 (날짜별 출결 상태 + 상세 정보)
external_attendance_data = {
    "2025-03-25": {"status": "출석", "detail": "정상 출석"},
    "2025-03-26": {"status": "지각", "detail": "10분 지각"},
    "2025-03-27": {"status": "결석", "detail": "무단 결석"},
}

# 출결 상태별 아이콘 경로
ICON_PATHS = {
    "출석": "icons/attend.png",
    "지각": "icons/late.png",
    "결석": "icons/absent.png",
}

# QCalendarWidget을 상속하여 출결 상태 표시 기능 추가
class CustomCalendar(QtWidgets.QCalendarWidget):
    def __init__(self, attendance_data, parent=None):
        super().__init__(parent)
        self.attendance_data = attendance_data  # 출결 데이터 저장

    def paintCell(self, painter, rect, date):
        """ 날짜마다 출결 아이콘과 텍스트 표시 """
        super().paintCell(painter, rect, date)

        date_str = date.toString("yyyy-MM-dd")
        if date_str in self.attendance_data:
            status = self.attendance_data[date_str]["status"]

            # 출결 상태별 색상 지정
            if status == "출석":
                painter.setPen(QColor("green"))
            elif status == "지각":
                painter.setPen(QColor("orange"))
            elif status == "결석":
                painter.setPen(QColor("red"))

            # 글꼴 설정
            painter.setFont(QFont("Arial", 10, QFont.Bold))

            # 출결 상태 텍스트 출력
            painter.drawText(rect, 1, status)

            # 아이콘 추가
            if status in ICON_PATHS:
                icon = QPixmap(ICON_PATHS[status])
                painter.drawPixmap(rect.x() + 5, rect.y() + 5, 16, 16, icon)

# UI 파일 로드
class AttendanceApp(QtWidgets.QMainWindow):
    def __init__(self, attendance_data):
        super().__init__()
        uic.loadUi("attendance.ui", self)  # Qt Designer UI 파일 불러오기

        # Qt Designer에서 만든 calendarWidget을 CustomCalendar로 교체
        self.calendar = CustomCalendar(attendance_data, self)
        self.layout().replaceWidget(self.calendarWidget, self.calendar)
        self.calendarWidget.deleteLater()

        # 날짜 클릭 이벤트 연결
        self.calendar.clicked.connect(self.display_attendance)

    def display_attendance(self):
        """ 선택한 날짜의 출결 상세 정보 표시 """
        selected_date = self.calendar.selectedDate().toString("yyyy-MM-dd")
        detail = self.calendar.attendance_data.get(selected_date, {"status": "정보 없음", "detail": "출결 데이터가 없습니다."})
        self.lblStatus.setText(f"{selected_date}: {detail['status']} - {detail['detail']}")

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
