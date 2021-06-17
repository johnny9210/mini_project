# emp01 table의 crud 로직을 전담하는 클래스
import cx_Oracle

class EmpDAO:
    # 사번으로 직원명, 급여를 검색해서 반환 
    def empone(self, empno):  
        data = ''
        try:
            conn = cx_Oracle.connect(user="SCOTT", password="TIGER", dsn="xe")
            cur = conn.cursor()

            try:
                # :v - 동적으로 데이터가 변경 가능한 상황을 처리 할수 있는 동적 변수(binding 변수)
                cur.execute("select * from emp01 where empno=:v", v=empno) 
                row = cur.fetchone()  # set 타입으로 반환 따라서 고유한 index로 각 요소들 활용 가능
                # print(row) # (7369, 'SMITH', 800.0)
                # print(row[0])  # 7369
                # json 포멧으로 편집  data = '{"ename":"SMITH", "sal":800.0}'
                data = '{"ename":"' + row[1] + '", "sal":' + str(row[2]) +'}'
            except Exception as e: # 예외..
                print(e) # print e
        finally:
            cur.close() # 자원 반환
            conn.close()

        return data

# if __name__ == "__main__":
#     dao = EmpDAO()
#     print(dao.empone(7369))

'''
dao.py의 모든 코드들은  app.py에서 호출해서 사용
단 구현시에 제대로 구현하는지 구현 로직별로 확인
단위 test 지칭

방법 : 파일단위(모듈)별로 실행 가능하게 if __name__ == "__main__": 
py 파일 독립적으로 실행 가능하게 해주는 독립실행 코드
>python dao.py 
'''