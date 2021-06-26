class EmpDTO:
    def __init__(self, newcname, newid, newscore, newreview):
        self.cname = newcname
        self.id = newid
        self.score = newscore
        self.review = newreview

    def getCname(self):
        return self.cname
    
    def setCname(self, newCname):
        self.Cname = newCname

    def getID(self):
        return self.id
    
    def setID(self, newid):
        self.id = newid

    def getScore(self):
        return self.score
    
    def setScore(self, newscore):
        self.score = newscore
    
    def getReview(self):
        return self.review

    def setReview(self, newreview):
        self.review = newreview



    def __str__(self):
        return ' 이름 : ' + self.Cname + ' 아이디 : ' + self.id + ' 점수 : ' + self.score + ' 리뷰 : ' + self.review

# if __name__ == '__main__':
#     d = EmpDTO('1', '정현','dd', '1','노잼')
#     print(d)
    