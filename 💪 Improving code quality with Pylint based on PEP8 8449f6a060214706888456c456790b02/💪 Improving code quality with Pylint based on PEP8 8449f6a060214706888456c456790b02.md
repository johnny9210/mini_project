# 💪 Improving code quality with Pylint based on PEP8

*by. 반재광, 손유진, 이진영, 이홍주, 정일균*

# 1. 기존 코드 📝

Q. 미스코리아 대회에서 점수가 높은 순서대로 진, 선, 미를 선발한다. 

선발에는 심사위원 점수와 실시간 투표 점수를 합한 총점이 활용된다. 

참가자들의 점수를 바탕으로 진, 선, 미를 선발하는 코드를 개발한다.

```python
entry =[
  ("김사랑",70,75),
  ("이하늬",60,65),  
  ("이지은",80,85),
  ("서윤희",90,95),
  ("김은정",85,95)]  
sum = []

def makeSum(entry,
  sum) :
    if not entry:
      print("entry list is empty")
    else:
        for i in range(len(entry)) :
            sum.append(entry[i][1]+entry[i][2])
        sum.sort(reverse=True)
        print ("진",list(filter(lambda x:x[1]+x[2]==sum[0],entry)))
        print ("선",list(filter(lambda x:x[1]+x[2]==sum[1],entry)))
        print ("미",list(filter(lambda x:x[1]+x[2]==sum[ 2 ],entry)))

makeSum(entry,sum)
```

---

# 2. Pylint 분석 🔍

![%F0%9F%92%AA%20Improving%20code%20quality%20with%20Pylint%20based%20on%20PEP8%208449f6a060214706888456c456790b02/ff.jpg](%F0%9F%92%AA%20Improving%20code%20quality%20with%20Pylint%20based%20on%20PEP8%208449f6a060214706888456c456790b02/ff.jpg)

- C0303 : 잘못된 공백
- W0311 : 잘못된 들여쓰기
- C0304 : 마지막 행의 개행
- C0114 : module docstring 필요
- W0622 : 시스템 내부 변수와 중복된 변수명
- C0103 : 잘못된 함수 및 변수 이름 style - camelCase
- W0621 : 함수 내외에서 중복된 변수명
- C0116 : function docstring 필요

```python
# """
# C0114: module docstring 필요
# """
entry =[
  ("김사랑",70,75), # C0303: 잘못된 공백 (line6 ↓)
  ("이하늬",60,65),  
  ("이지은",80,85),
  ("서윤희",90,95),
  ("김은정",85,95)]  
sum = [] # W0622: 시스템 내부 변수와 중복된 변수명

def makeSum(entry, # C0103: 잘못된 함수 및 변수 이름 style - camelCase (snake_case)
  sum) : # W0621: 함수 내외에서 중복된 변수명
    # """
    # C0116 : function docstring 필요
    # """
    if not entry:
      print("entry list is empty") # W0311: 잘못된 들여쓰기
    else:
        for i in range(len(entry)) :
            sum.append(entry[i][1]+entry[i][2])
        sum.sort(reverse=True)
        print ("진",list(filter(lambda x:x[1]+x[2]==sum[0],entry)))
        print ("선",list(filter(lambda x:x[1]+x[2]==sum[1],entry)))
        print ("미",list(filter(lambda x:x[1]+x[2]==sum[ 2 ],entry)))

makeSum(entry,sum) # C0304: 마지막 행의 개행
```

---

# 3. pylint에서 체크 되지 않은 코드👿

### pylint 분석에서 걸리지 않았지만 기존 코드에서 위배한 PEP8 가이드라인의 종류

- ignore_01 : 괄호 안의 인수는 세로로 정렬해서는 안 된다
- ignore_02 : 연산자 앞뒤 공백이 있어야 한다
- ignore_03 : print문에서 print와 괄호 사이의 공백은 없어야 한다
- ignore_04 : 대괄호([]) 안의 공백은 없어야 한다

```python
entry =[
    ("김사랑",70,75),
    ("이하늬",60,65),  
    ("이지은",80,85),
    ("서윤희",90,95),
    ("김은정",85,95)]  
sum = []
def makeSum(entry, # ignore_01 : 괄호 안의 인수는 세로로 정렬해서는 안 된다
  sum) :
    if not entry:
      print("entry list is empty")
		else:
        for i in range(len(entry)) :
            sum.append(entry[i][1]+entry[i][2])
        sum.sort(reverse=True) # ignore_02 : 연산자 앞뒤 공백이 있어야 한다
        print ("진",list(filter(lambda x:x[1]+x[2]==sum[0],entry)))
				# ignore_03 : print문에서 print와 괄호 사이의 공백은 없어야 한다
        print ("선",list(filter(lambda x:x[1]+x[2]==sum[1],entry)))
        print ("미",list(filter(lambda x:x[1]+x[2]==sum[ 2 ],entry)))
				# ignore_04 : 대괄호([]) 안의 공백은 없어야 한다

makeSum(entry,sum)
```

---

# 4. 코드 개선 및 결과 ⚒️

```python
"""
    두 점수를 합산하여 미스코리아 상위 3명을 가려 진선미를 선출한다.
"""
entry = [
    ("김사랑", 70, 75),
    ("이하늬", 60, 65),
    ("이지은", 80, 85),
    ("서윤희", 90, 95),
    ("김은정", 85, 95)]

total = []

def make_sum(inner_entry, inner_total) :
    """
        inner_entry {list} : 명단
        inner_sum {list} : 진, 선, 미를 가려 저장할 명단
    """
    if not inner_entry:
        print("entry list is empty")
    else:
        for i in range(len(inner_entry)) :
            inner_total.append(inner_entry[i][1] + inner_entry[i][2])

        inner_total.sort(reverse = True)

        print("진", list(filter(lambda x : x[1] + x[2] == inner_total[0], inner_entry)))
        print("선", list(filter(lambda x : x[1] + x[2] == inner_total[1], inner_entry)))
        print("미", list(filter(lambda x : x[1] + x[2] == inner_total[2], inner_entry)))

make_sum(entry, total)

```

## ✅ 개선된 코드 pylint 분석 결과

![%F0%9F%92%AA%20Improving%20code%20quality%20with%20Pylint%20based%20on%20PEP8%208449f6a060214706888456c456790b02/result.jpg](%F0%9F%92%AA%20Improving%20code%20quality%20with%20Pylint%20based%20on%20PEP8%208449f6a060214706888456c456790b02/result.jpg)

## ✅ 코드 비교

![%F0%9F%92%AA%20Improving%20code%20quality%20with%20Pylint%20based%20on%20PEP8%208449f6a060214706888456c456790b02/Untitled.png](%F0%9F%92%AA%20Improving%20code%20quality%20with%20Pylint%20based%20on%20PEP8%208449f6a060214706888456c456790b02/Untitled.png)

---

# 5.  참고 문헌 및 활용 툴 👀

- [http://pylint-messages.wikidot.com/all-codes](http://pylint-messages.wikidot.com/all-codes) - pylint 메세지
- [https://ichi.pro/ko/pylintlo-kodeu-pumjil-hwag-in-270308761879581](https://ichi.pro/ko/pylintlo-kodeu-pumjil-hwag-in-270308761879581) - PEP8 코딩 규칙
- [https://kongdols-room.tistory.com/18](https://kongdols-room.tistory.com/18) - PEP8 코딩 규칙
- [https://itholic.github.io/python-static-analysis/](https://itholic.github.io/python-static-analysis/) - Pylint와 정적 분석
- [https://www.python.org/dev/peps/pep-0008/](https://www.python.org/dev/peps/pep-0008/) - PEP8 공식문서
- [http://meonggae.blogspot.com/2017/03/git-pylint-pep8.html](http://meonggae.blogspot.com/2017/03/git-pylint-pep8.html) - pylint, pep8 사용하여 검사
- [https://pep8.org/](https://pep8.org/) - pep8 코딩 규칙
- [https://winmerge.org/](https://winmerge.org/) - 소스 코드 비교 툴