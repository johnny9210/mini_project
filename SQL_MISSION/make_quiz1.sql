<html>
<header>
<title>초보자도 할 수 있는 SQL</title>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
<style>
      body {font-family: 'Nanum Gothic', sans-serif;}
      h1 {margin : 1rem;}
      details {padding : 1rem; white-space: pre-wrap;}
      .question {margin : 2rem; padding : 2rem; border: 1px solid gray;}
</style>
</header>

<body>



<h1>[초보자도 할 수 있는 SQL - 장동기]</h1>


<div class='question' id='Q1'>

      <h4>1. 부서번호가 80이고 월급을 반올림했을 때 100000가 넘는 사람들의 employee_id, job_id, salary를 출력하시오</h4>
      
      <details>
            <summary>모범 답안</summary>
            <strong>select</strong> employee_id, job_id, salary
            <strong>from</strong> employees
            <strong>where</strong> department_id = '80' <strong>and</strong> round(salary)>10000;



            EMPLOYEE_ID JOB_ID	   SALARY DEPARTMENT_ID
            ----------- ---------- ---------- -------------
                  145   SA_MAN	    14000	         80
                  146   SA_MAN	    13500	         80
                  147   SA_MAN	    12000	         80
                  148   SA_MAN	    11000	         80
                  149   SA_MAN	    10500	         80
                  162   SA_REP	    10500	         80
                  168   SA_REP	    11500	         80
                  174   SA_REP	    11000	         80
      </details>

</div>



<div class=question id=Q2>
      <h4>2. job_id의 4번째부터 7글자가 'ACCOUNT'(대문자 처리)인 사람들의 first_name과 salary를 출력하고 salary를 기준으로 내림차순으로 정렬하시오</h4>
      <details>
            <summary>모범 답안</summary>
            <strong>select</strong> first_name, job_id, salary
            <strong>from</strong> employees
            <strong>where</strong> substr(job_id, 4, 7) = upper('account')
            <strong>order by</strong> salary desc;



            FIRST_NAME	     JOB_ID	    SALARY
            -------------------- ---------- ----------
            Daniel		      FI_ACCOUNT       9000
            William 	             AC_ACCOUNT       8300
            John		      FI_ACCOUNT       8200
            Jose Manuel	      FI_ACCOUNT       7800
            Ismael		      FI_ACCOUNT       7700
            Luis		              FI_ACCOUNT       6900


      </details>
</div>

<div class='question' id='Q3'>

      <h4>3. 이름 두번째 철자가 l로 시작하는 사원들의 핸드폰 번호와 고용일을 출력하시오</h4>
      
      <details>
            <summary>모범 답안</summary>
            <strong>select</strong> phone_number, hire_date
            <strong>from</strong> employees
            <strong>where</strong> first_name like '_l%';

            PHONE_NUMBER                             HIRE_DAT
            ---------------------------------------- --------
            590.423.4567                             06/01/03
            515.127.4562                             03/05/18
            011.44.1344.429278                       05/03/10
            011.44.1344.429018                       08/01/29
            011.44.1344.486508                       07/11/23
            011.44.1345.829268                       04/08/01
            011.44.1346.129268                       05/11/11
            011.44.1343.529268                       07/03/24
            011.44.1644.429267                       04/05/11
            011.44.1644.429266                       05/03/19
            650.509.2876                             05/02/20
            650.507.9811                             06/04/24
            
      </details>

</div>


<div class=question id=Q4>
      <h4>4. 핸드폰번호가 011로 시작하는 사원들의 급여와 job_id를 출력하시오.</h4>
      <details>
            <summary>모범 답안</summary>
            <strong>select</strong> salary, job_id
            <strong>from</strong> employees
            <strong>where</strong> substr(phone_number,1,3) = '011';


            SALARY JOB_ID
            ---------- --------------------
            14000 SA_MAN
            13500 SA_MAN
            12000 SA_MAN
            11000 SA_MAN
            10500 SA_MAN
            10000 SA_REP
                  9500 SA_REP
                  9000 SA_REP
                  8000 SA_REP
                  7500 SA_REP
                  7000 SA_REP
            10000 SA_REP
                  9500 SA_REP
                  9000 SA_REP
                  8000 SA_REP
                  7500 SA_REP
                  7000 SA_REP
            10500 SA_REP
                  9500 SA_REP
                  7200 SA_REP
                  6800 SA_REP
                  6400 SA_REP
                  6200 SA_REP
            11500 SA_REP
            10000 SA_REP
                  9600 SA_REP
                  7400 SA_REP
                  7300 SA_REP
                  6100 SA_REP
            11000 SA_REP
                  8800 SA_REP
                  8600 SA_REP
                  8400 SA_REP
                  7000 SA_REP
                  6200 SA_REP

                  
      </details>
</div>

<div class='question' id='Q5'>

      <h4>5. 근로자ID가 200이하이고 이름의 길이가 4이상인 근로자ID와 근로자의 이름과 근로자의 입사일을 근로자 id를 오름차순을 기준으로 출력하시오.</h4>
      

      <details>
            <summary>모범 답안</summary>
            <strong>select</strong> employees.employee_id, employees.first_name, job_history.start_date 
            <strong>from</strong> employees, job_history 
            <strong>where</strong> employees.employee_id=job_history.employee_id and employees.employee_id<200 and length(employees.first_name) >4 order by employees.employee_id asc;

                  EMPLOYEE_ID FIRST_NAME                               START_DA
                  ----------- ---------------------------------------- --------
                          101 Neena                                    97/09/21
                          101 Neena                                    01/10/28
                          122 Payam                                    07/01/01
                          176 Jonathon                                 06/03/24
                          176 Jonathon                                 07/01/01
      </details>

</div>


<div class=question id=Q6>
<h4>6. 근속 년수가 4년 이상인 근로자의 이름, 입사일, 퇴사일을 출력하시오.(입사일 기준 오름차순)</h4>
      <details>
            <summary>모범 답안</summary>
            <strong>select</strong> employees.first_name, job_history.start_date, job_history.end_date 
            <strong>from</strong> employees, job_history 
            <strong>where</strong> (substr(job_history.end_date,1,2)-substr(job_history.start_date,1,2))>=4 order by job_history.start_date asc;


            FIRST_NAME                               START_DA END_DATE
            ---------------------------------------- -------- --------
            Kevin                                    02/07/01 06/12/31
            Jean                                     02/07/01 06/12/31
            Tayler                                   02/07/01 06/12/31
            Adam                                     02/07/01 06/12/31
            Timothy                                  02/07/01 06/12/31
            Ki                                       02/07/01 06/12/31
            Girard                                   02/07/01 06/12/31
            William                                  02/07/01 06/12/31
            Douglas                                  02/07/01 06/12/31
            Kimberely                                02/07/01 06/12/31
            Nancy                                    02/07/01 06/12/31

            FIRST_NAME                               START_DA END_DATE
            ---------------------------------------- -------- --------
            Danielle                                 02/07/01 06/12/31
            Peter                                    02/07/01 06/12/31
            Michael                                  02/07/01 06/12/31
            Shelley                                  02/07/01 06/12/31
            Guy                                      02/07/01 06/12/31
            Alexander                                02/07/01 06/12/31
            Alyssa                                   02/07/01 06/12/31
            Charles                                  02/07/01 06/12/31
            Vance                                    02/07/01 06/12/31
            Payam                                    02/07/01 06/12/31
            Alexander                                02/07/01 06/12/31

            FIRST_NAME                               START_DA END_DATE
            ---------------------------------------- -------- --------
            Janette                                  02/07/01 06/12/31
            Steven                                   02/07/01 06/12/31
            Neena                                    02/07/01 06/12/31
            Sundita                                  02/07/01 06/12/31
            Renske                                   02/07/01 06/12/31
            James                                    02/07/01 06/12/31
            David                                    02/07/01 06/12/31
            Jack                                     02/07/01 06/12/31
            Diana                                    02/07/01 06/12/31
            Jason                                    02/07/01 06/12/31
            Steven                                   02/07/01 06/12/31
      </details>
</div>


</body>
</html>
