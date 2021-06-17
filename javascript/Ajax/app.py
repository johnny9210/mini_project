from flask import Flask, request, render_template
from dao import EmpDAO

app = Flask(__name__)

# http://127.0.0.1:5000   -> http://127.0.0.1:5000/ 동일한 표현 
# methods속성 생략시 get 방식 
@app.route('/', methods=['get'])
def get():
    print('get')
    return render_template('reqres.html')  #http://127.0.0.1:5000/reqres.html url 의미


@app.route('/getdata', methods=['get'])
def getdata():
    print("getdata() -----------------")
    return '{"name":"재석", "age":49}'



@app.route("/getemp", methods=['post'])
def datemp():
    # ???
    empno = request.form.get('empno')  # ????? 어떻게 client가 전송하는 데이터를 획득할 수 있는지???
    print("--------------------", empno)

    dao = EmpDAO()  # empone() 메소드를 보유한 객체 생성
    data = dao.empone(empno) # select 후에 json 포멧의 문자열로 가공해서 반환하는 메소드 호출 
    return data



if __name__ == "__main__":
    app.run(debug=True, host="127.0.0.1", port="5000")