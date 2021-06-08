-- 1. job을 입력받아 해당 job의 평균 급여를 구해주는 함수를 만드세요.(함수명: avg_sal_job)

-- 모범 답안
create or replace function avg_sal_job(v_job emp.job%type)
return emp.sal%type 
is 
    v_sal emp.sal%type;
begin 
    select avg(sal) 
         into v_sal 
    from emp 
    where v_job=job;
    return v_sal;
end;
/

-- test 코드
select avg_sal_job('CLERK') from dual;



-- 2. 부서번호를 입력하면 해당 부서에서 근무하는 사원 수를 반환하는 함수를 작성하세요.(함수명: get_emp_count)

-- 모범 답안
create or replace function get_emp_count(deptno_ emp.deptno%type)
return number
is
    emp_count number;
begin
    select count(*) into emp_count
    from emp
    where deptno = deptno_;
    return emp_count;
end;
/

-- test 코드
select get_emp_count(10) from dual;



-- 3. 월급여가 1000 달러 이상인 사원만을 대상으로, 1000달러 당 별표시(*) 한 개가 출력되도록 하세요.

/*입출력 예시
입력값(empno): 7369
출력값: 적용 대상이 아닙니다.
입력값(empno): 7698
출력값: **
입력값(empno): 7839
출력값: *****
*/

-- 모범 답안
declare
    v_empno emp.empno%type := &eno;
    v_sal emp.sal%type;
    v_star_num number;
    v_star varchar2(9);
begin
    select sal
        into v_sal
    from emp
    where empno = v_empno;

    if v_sal >= 1000 then
       v_star_num := trunc(v_sal/1000);
       for i in 1..v_star_num loop
           v_star := v_star||'*';
       end loop;
       dbms_output.put_line(v_star);
    else
       dbms_output.put_line('적용 대상이 아닙니다.');
    end if;
end;
/



-- 4. 연봉(sal*12 + comm)이 높은 상위 3명의 사원번호, 이름, 부서이름, 연봉을 조회하세요.

/* 출력 예시
     EMPNO ENAME                DNAME                              연봉
---------- -------------------- ---------------------------- ----------
      7839 KING                 ACCOUNTING                        60000
      7902 FORD                 RESEARCH                          36000
      7566 JONES                RESEARCH                          35700
*/

-- 모범 답안
select *
from(
	select empno, ename, dname, (sal*12 + nvl(comm,0)) as 연봉
	from emp e, dept d
	where e.deptno = d.deptno
	order by (sal*12 + nvl(comm,0)) desc
)
where rownum <= 3;



-- 5. 아래 제시된 테이블을 이용하여 warehouse 테이블을 기준으로 sold 테이블 제품들의 재고(amount) 수량을 빼고
--input 테이블 제품들의 경우 수량을 더하여(warehouse에 없는 제품이 있다면 추가한다.) merge를 통해 warehouse 테이블의
--최종 재고 결과를 출력하세요.

/* 제시된 TABLE
create table sold(
	product_no varchar2(5), 
	amount number(2)
);
create table input(
	product_no varchar2(5), 
	amount number(2)
);
create table warehouse(
	product_no varchar2(5), 
	amount number(2)
);
insert all
	into warehouse values('1001', 12)
	into warehouse values('1002', 3)
	into warehouse values('1003', 6)
	into warehouse values('1004', 7)
	into warehouse values('1005', 15)
	into warehouse values('1006', 4)
	into warehouse values('1007', 11)
	into warehouse values('1008', 3)
	into warehouse values('1009', 17)
	into input values('1001',3)
	into input values('1002',6)
	into input values('1003',2)
	into input values('1008',10)
	into input values('1010',2)
	into sold values('1003',5)
	into sold values('1007',4)
	into sold values('1009',11)
select * from dual;
commit;
*/

-- 모범 답안
merge into warehouse w 
using sold s
on (w.product_no = s.product_no)
when matched then 
	update set w.amount = w.amount-s.amount;

merge into warehouse w 
using input i
on (w.product_no = i.product_no)
when matched then 
	update set w.amount = w.amount+i.amount
when not matched then 
	insert values (i.product_no, i.amount);
