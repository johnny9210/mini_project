# πͺ Improving code quality with Pylint based on PEP8

*by. λ°μ¬κ΄, μμ μ§, μ΄μ§μ, μ΄νμ£Ό, μ μΌκ· *

# 1. κΈ°μ‘΄ μ½λ π

Q. λ―Έμ€μ½λ¦¬μ λνμμ μ μκ° λμ μμλλ‘ μ§, μ , λ―Έλ₯Ό μ λ°νλ€. 

μ λ°μλ μ¬μ¬μμ μ μμ μ€μκ° ν¬ν μ μλ₯Ό ν©ν μ΄μ μ΄ νμ©λλ€. 

μ°Έκ°μλ€μ μ μλ₯Ό λ°νμΌλ‘ μ§, μ , λ―Έλ₯Ό μ λ°νλ μ½λλ₯Ό κ°λ°νλ€.

```python
entry =[
  ("κΉμ¬λ",70,75),
  ("μ΄νλ¬",60,65),  
  ("μ΄μ§μ",80,85),
  ("μμ€ν¬",90,95),
  ("κΉμμ ",85,95)]  
sum = []

def makeSum(entry,
  sum) :
    if not entry:
      print("entry list is empty")
    else:
        for i in range(len(entry)) :
            sum.append(entry[i][1]+entry[i][2])
        sum.sort(reverse=True)
        print ("μ§",list(filter(lambda x:x[1]+x[2]==sum[0],entry)))
        print ("μ ",list(filter(lambda x:x[1]+x[2]==sum[1],entry)))
        print ("λ―Έ",list(filter(lambda x:x[1]+x[2]==sum[ 2 ],entry)))

makeSum(entry,sum)
```

---

# 2. Pylint λΆμ π

![ff](https://user-images.githubusercontent.com/33116818/119454994-233d2d80-bd74-11eb-8067-4edd76d12b18.jpg)

- C0303 : μλͺ»λ κ³΅λ°±
- W0311 : μλͺ»λ λ€μ¬μ°κΈ°
- C0304 : λ§μ§λ§ νμ κ°ν
- C0114 : module docstring νμ
- W0622 : μμ€ν λ΄λΆ λ³μμ μ€λ³΅λ λ³μλͺ
- C0103 : μλͺ»λ ν¨μ λ° λ³μ μ΄λ¦ style - camelCase
- W0621 : ν¨μ λ΄μΈμμ μ€λ³΅λ λ³μλͺ
- C0116 : function docstring νμ

```python
# """
# C0114: module docstring νμ
# """
entry =[
  ("κΉμ¬λ",70,75), # C0303: μλͺ»λ κ³΅λ°± (line6 β)
  ("μ΄νλ¬",60,65),  
  ("μ΄μ§μ",80,85),
  ("μμ€ν¬",90,95),
  ("κΉμμ ",85,95)]  
sum = [] # W0622: μμ€ν λ΄λΆ λ³μμ μ€λ³΅λ λ³μλͺ

def makeSum(entry, # C0103: μλͺ»λ ν¨μ λ° λ³μ μ΄λ¦ style - camelCase (snake_case)
  sum) : # W0621: ν¨μ λ΄μΈμμ μ€λ³΅λ λ³μλͺ
    # """
    # C0116 : function docstring νμ
    # """
    if not entry:
      print("entry list is empty") # W0311: μλͺ»λ λ€μ¬μ°κΈ°
    else:
        for i in range(len(entry)) :
            sum.append(entry[i][1]+entry[i][2])
        sum.sort(reverse=True)
        print ("μ§",list(filter(lambda x:x[1]+x[2]==sum[0],entry)))
        print ("μ ",list(filter(lambda x:x[1]+x[2]==sum[1],entry)))
        print ("λ―Έ",list(filter(lambda x:x[1]+x[2]==sum[ 2 ],entry)))

makeSum(entry,sum) # C0304: λ§μ§λ§ νμ κ°ν
```

---

# 3. pylintμμ μ²΄ν¬ λμ§ μμ μ½λπΏ

### pylint λΆμμμ κ±Έλ¦¬μ§ μμμ§λ§ κΈ°μ‘΄ μ½λμμ μλ°°ν PEP8 κ°μ΄λλΌμΈμ μ’λ₯

- ignore_01 : κ΄νΈ μμ μΈμλ μΈλ‘λ‘ μ λ ¬ν΄μλ μ λλ€
- ignore_02 : μ°μ°μ μλ€ κ³΅λ°±μ΄ μμ΄μΌ νλ€
- ignore_03 : printλ¬Έμμ printμ κ΄νΈ μ¬μ΄μ κ³΅λ°±μ μμ΄μΌ νλ€
- ignore_04 : λκ΄νΈ([]) μμ κ³΅λ°±μ μμ΄μΌ νλ€

```python
entry =[
    ("κΉμ¬λ",70,75),
    ("μ΄νλ¬",60,65),  
    ("μ΄μ§μ",80,85),
    ("μμ€ν¬",90,95),
    ("κΉμμ ",85,95)]  
sum = []
def makeSum(entry, # ignore_01 : κ΄νΈ μμ μΈμλ μΈλ‘λ‘ μ λ ¬ν΄μλ μ λλ€
  sum) :
    if not entry:
      print("entry list is empty")
		else:
        for i in range(len(entry)) :
            sum.append(entry[i][1]+entry[i][2])
        sum.sort(reverse=True) # ignore_02 : μ°μ°μ μλ€ κ³΅λ°±μ΄ μμ΄μΌ νλ€
        print ("μ§",list(filter(lambda x:x[1]+x[2]==sum[0],entry)))
				# ignore_03 : printλ¬Έμμ printμ κ΄νΈ μ¬μ΄μ κ³΅λ°±μ μμ΄μΌ νλ€
        print ("μ ",list(filter(lambda x:x[1]+x[2]==sum[1],entry)))
        print ("λ―Έ",list(filter(lambda x:x[1]+x[2]==sum[ 2 ],entry)))
				# ignore_04 : λκ΄νΈ([]) μμ κ³΅λ°±μ μμ΄μΌ νλ€

makeSum(entry,sum)
```

---

# 4. μ½λ κ°μ  λ° κ²°κ³Ό βοΈ

```python
"""
    λ μ μλ₯Ό ν©μ°νμ¬ λ―Έμ€μ½λ¦¬μ μμ 3λͺμ κ°λ € μ§μ λ―Έλ₯Ό μ μΆνλ€.
"""
entry = [
    ("κΉμ¬λ", 70, 75),
    ("μ΄νλ¬", 60, 65),
    ("μ΄μ§μ", 80, 85),
    ("μμ€ν¬", 90, 95),
    ("κΉμμ ", 85, 95)]

total = []

def make_sum(inner_entry, inner_total) :
    """
        inner_entry {list} : λͺλ¨
        inner_sum {list} : μ§, μ , λ―Έλ₯Ό κ°λ € μ μ₯ν  λͺλ¨
    """
    if not inner_entry:
        print("entry list is empty")
    else:
        for i in range(len(inner_entry)) :
            inner_total.append(inner_entry[i][1] + inner_entry[i][2])

        inner_total.sort(reverse = True)

        print("μ§", list(filter(lambda x : x[1] + x[2] == inner_total[0], inner_entry)))
        print("μ ", list(filter(lambda x : x[1] + x[2] == inner_total[1], inner_entry)))
        print("λ―Έ", list(filter(lambda x : x[1] + x[2] == inner_total[2], inner_entry)))

make_sum(entry, total)

```

## β κ°μ λ μ½λ pylint λΆμ κ²°κ³Ό

![result](https://user-images.githubusercontent.com/33116818/119454967-1c161f80-bd74-11eb-85f5-2a0b7112219d.jpg)

## β μ½λ λΉκ΅

![Untitled](https://user-images.githubusercontent.com/33116818/119455011-259f8780-bd74-11eb-957e-88e988432fe6.png)

---

# 5.  μ°Έκ³  λ¬Έν λ° νμ© ν΄ π

- [http://pylint-messages.wikidot.com/all-codes](http://pylint-messages.wikidot.com/all-codes) - pylint λ©μΈμ§
- [https://ichi.pro/ko/pylintlo-kodeu-pumjil-hwag-in-270308761879581](https://ichi.pro/ko/pylintlo-kodeu-pumjil-hwag-in-270308761879581) - PEP8 μ½λ© κ·μΉ
- [https://kongdols-room.tistory.com/18](https://kongdols-room.tistory.com/18) - PEP8 μ½λ© κ·μΉ
- [https://itholic.github.io/python-static-analysis/](https://itholic.github.io/python-static-analysis/) - Pylintμ μ μ  λΆμ
- [https://www.python.org/dev/peps/pep-0008/](https://www.python.org/dev/peps/pep-0008/) - PEP8 κ³΅μλ¬Έμ
- [http://meonggae.blogspot.com/2017/03/git-pylint-pep8.html](http://meonggae.blogspot.com/2017/03/git-pylint-pep8.html) - pylint, pep8 μ¬μ©νμ¬ κ²μ¬
- [https://pep8.org/](https://pep8.org/) - pep8 μ½λ© κ·μΉ
- [https://winmerge.org/](https://winmerge.org/) - μμ€ μ½λ λΉκ΅ ν΄
