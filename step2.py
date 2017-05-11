# encoding:utf-8
import MySQLdb

conn = MySQLdb.connect(
    host='localhost',
    port=3306,
    user='root',
    passwd='wjc.1314520',
    charset='utf8',
    db='university'
)

cur = conn.cursor()

pathDept = "/home/carson/university/department.txt"
pathStds = "/home/carson/university/student.txt"
pathExam = "/home/carson/university/exam.txt"

def insertFunc(pthOfTxt, table):
    with open(pthOfTxt) as f:
        for line in f.readlines():
            line = line.strip("\n")
            values = line
            values = values.replace(' ', '","')
            sql_cur = 'insert into '+ table + ' values ("' + values + '")'
            cur.execute(sql_cur)
            conn.commit()
            print sql_cur

insertFunc(pathDept, 'department')
insertFunc(pathStds, 'student')
insertFunc(pathExam, 'exam')

conn.close()
