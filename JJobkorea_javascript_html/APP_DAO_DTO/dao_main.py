import cx_Oracle
from dto_main import ComDTO
import json
import collections 

class ComDAO:
    def companyone(self, industry, techstack, sal_grade, scale, hirecarrer):

        data = ''

        try:
            conn = cx_Oracle.connect(user="SCOTT", password="TIGER", dsn="xe")
            cur = conn.cursor()
            cur.execute("select * from board where industry in(:industry) and techstack in (:techstack) and \
                sal_grade in (:sal_grade) and scale in (:scale) and hirecarrer in (:hirecarrer)", \
                    industry=industry, techstack=techstack, sal_grade=sal_grade, scale=scale, hirecarrer=hirecarrer)
            row = cur.fetchone()
            data = '{"cname":"' + str(row[1]) + '}'


        except Exception as e:
            print(e)

        finally:
            cur.close()
            conn.close()

        return data
