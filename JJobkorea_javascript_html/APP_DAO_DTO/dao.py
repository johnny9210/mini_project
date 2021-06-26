import cx_Oracle
from dto import EmpDTO
import json
import collections 


class EmpDAO:
    def delete(self, dto):
        conn = cx_Oracle.connect(user="SCOTT", password="TIGER", dsn="xe")
        cur = conn.cursor()

        cur.execute("delete from board where name=:name and ID=:ID",
                    name = dto.getName(), ID = dto.getID())
        conn.commit()

        cur.close()
        conn.close()

    def update(self, dto):
        conn = cx_Oracle.connect(user="SCOTT", password="TIGER", dsn="xe")
        cur = conn.cursor()

        cur.execute("update board set score=:score, review=:review where ID=:ID and cname=:cname",
                    cname = dto.getCname(), score = dto.getScore(), review = dto.getReview(), ID = dto.getID())
        conn.commit()

        cur.close()
        conn.close()

    # 정보등록!!
    def insert(self, dto):    
        conn = cx_Oracle.connect(user="SCOTT", password="TIGER", dsn="xe")
        cur = conn.cursor()

        try:
            cur.execute("insert into board values (:cname, :id, :score, :review)",
                        cname = dto.getCname(), id=dto.getID(), score = dto.getScore(), review = dto.getReview())
            conn.commit()
        except Exception as e:
            print(e)

        finally:
            cur.close()
            conn.close()

    # 회사 정보 가져오기!!
    def boardone(self, ID):

        data = ''

        try:
            conn = cx_Oracle.connect(user="SCOTT", password="TIGER", dsn="xe")
            cur = conn.cursor()
            cur.execute("select * from board where ID=:ID", ID = ID)
            row = cur.fetchone()
            data = '{"cname":"' + str(row[1]) + '", "score":' + str(row[3]) + '", "review":' + (row[4]) + '}'

        except Exception as e:
            print(e)

        finally:
            cur.close()
            conn.close()

        return data

    def boardall(self):
        data = []

        try:
            conn = cx_Oracle.connect(user="SCOTT", password="TIGER", dsn="xe")
            cur = conn.cursor()
            cur.execute("select * from board")
            rows = cur.fetchall()
            v = []
            for row in rows:
                d = collections.OrderedDict()
                d['id'] = row[0]
                d['cname'] = row[1]
                d['score'] = row[2]
                d['review'] = row[3]

                v.append(d)


            data = json.dumps(v, ensure_ascii=False)
            # print(data)

        except Exception as e:
            print(e)

        finally:
            cur.close()
            conn.close()
        return data



# if __name__ == "__main__":
#     dao = EmpDAO()
# #     dto = EmpDTO(2, 't', 20)
# #     dao.empinsert(dto)
#     dao.boardall()