import cx_Oracle
from dto_chart import ChtDTO
import json
import collections 

class ChtDAO:
    def chartone(self, cname):

        data = ''

        try:
            conn = cx_Oracle.connect(user="SCOTT", password="TIGER", dsn="xe")
            cur = conn.cursor()
            cur.execute("select avg_score from Chart where cname=:cname", cname = cname)
            row = cur.fetchone()
            data = '{"cname":"' + str(row[1]) + '", "score":' + str(row[3]) + '", "review":' + (row[4]) + '}'

        except Exception as e:
            print(e)

        finally:
            cur.close()
            conn.close()

        return data


    def chartall(self):
        data = []

        try:
            conn = cx_Oracle.connect(user="SCOTT", password="TIGER", dsn="xe")
            cur = conn.cursor()
            cur.execute("select * from chart")
            rows = cur.fetchall()
            # print(rows)
            v = []
            for row in rows:
                # print(row[0], row[1], row[2])
                # print(row[1])
                d = collections.OrderedDict()
                d['cname'] = row[0]
                d['avg_score'] = row[1]
                d['color'] = row[2]

                v.append(d)


            data = json.dumps(v, ensure_ascii=False)

        except Exception as e:
            print(e)

        finally:
            cur.close()
            conn.close()
        print(data)
        return data


if __name__ == "__main__":
    # a = ChtDAO().chartall()
    print(ChtDAO().chartall())
#     dao = ChtDAO()
#     dto = ChtDTO('BankSalad')
#     dao.boardone(dto)

