from flask import Flask, request, render_template
from dao import EmpDAO
from dto import EmpDTO
from dao_main import ComDAO
from dto_main import ComDTO
from dao_chart import ChtDAO
from dto_chart import ChtDTO

app=Flask(__name__)

@app.route("/", methods=["GET"])
def get():
    return render_template("main.html")

@app.route("/choice", methods=["GET"])
def choice():
    return render_template("reqres.html")


@app.route("/contact", methods=["GET"])
def contact():

    # a=request.form.getlist('Industry')
    # b=request.form.getlist('Tech_Stack')
    # c=request.form.getlist('Salary')
    # d=request.form.getlist('Company_Size')
    # e=request.form.getlist('Hirecareer')

    return render_template("contact.html")



@app.route("/chart", methods=["GET"])
def chart():
    return render_template("chart.html")

@app.route("/showchart", methods=["POST"])
def showchart():
    return ChtDAO().chartall()


# 게시판은 완료!!
@app.route("/board", methods=["get"])
def board():
    return render_template("review123.html")


@app.route("/insert", methods=["POST"])
def insertreview():
    print("----------")
    dao = EmpDAO()
    dto = EmpDTO(request.form.get("id"), request.form.get("cname"), request.form.get("score"), request.form.get("review"))
    dao.insert(dto)
    print("================")
    return dao.boardone(request.form.get('id'))


# 모든 리뷰정보를 요청 및 응답하는 함수
@app.route("/insertboard", methods=["GET"])
def insertboard():
    print("app구동완료!")
    return EmpDAO().boardall()


@app.route("/Hyundai", methods=["GET"])
def Hyundai():
    return render_template("Hyundai.html")

@app.route("/AhnLab", methods=["GET"])
def AhnLab():
    return render_template("AhnLab.html")

@app.route("/Banksalad", methods=["GET"])
def Banksalad():
    return render_template("Banksalad.html")

@app.route("/ADT_caps", methods=["GET"])
def ADT_caps():
    return render_template("Caps.html")

@app.route("/InBody", methods=["GET"])
def InBody():
    return render_template("InBody.html")

@app.route("/Kakao", methods=["GET"])
def Kakao():
    return render_template("Kakao.html")

@app.route("/KAKAO_BANK", methods=["GET"])
def KAKAO_BANK():
    return render_template("Kakao.html")

@app.route("/KIA", methods=["GET"])
def KIA():
    return render_template("KIA.html")

@app.route("/Naver", methods=["GET"])
def Naver():
    return render_template("Naver.html")

@app.route("/SECUI", methods=["GET"])
def SECUI():
    return render_template("SECUI.html")
    
@app.route("/Seegene", methods=["GET"])
def Seegene():
    return render_template("Seegene.html")

@app.route("/Shinhan", methods=["GET"])
def Shinhan():
    return render_template("Shinhan.html")

@app.route("/Tesla", methods=["GET"])
def Tesla():
    return render_template("Tesla.html")

@app.route("/Vuno", methods=["GET"])
def Vuno():
    return render_template("Vuno.html")

@app.route("/Googlekr", methods=["GET"])
def Googlekr():
    return render_template("Googlekr.html")


if __name__=="__main__":
    app.run(debug=True, host="127.0.0.1", port="5000")



# select cname from Company where industry in ('finance', 'Security') and 
# tech_stack in ('MachineLearning', 'Cloud_Security') and 
# sal_grade in (1, 2) and 
# scale in ('big', 'medium', 'small') and 
# hirecareer in ('experience', 'newcomer');
