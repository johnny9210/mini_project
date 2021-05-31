--0528 SQL review
--sql
CREATE TABLE mountains (
  name TEXT,
  height_meters INTEGER,
  first_ascent DATE
);

INSERT INTO mountains VALUES
  ('Mount Everest', 8848, '1953-05-29'),
  ('Kilimanjaro', 5895, '1889-10-06'),
  ('Denali', 6190, '1913-06-07'),
  ('Chimborazo', 6263, '1880-01-04'),
  ('K2', 8611, '1954-07-31'),
  ('Piz Palü', 3900, '1835-08-12'),
  ('Cho Oyu', 8188, '1954-10-19');


-- 문제
--문제1) 등산일자와 산 이름을 조회하되, 등산한 일자가 오래된 순으로 조회하시오.
--문제2) 산 이름에 i가 포함된 산들만 추출하시오.
--문제3) 이름에 C가 들어가거나 fisrt_ascent가 50년대인 산들을 출력하시오.
--문제4) height_meter 8000이상 first_ascent가 1900-1999사이인 산들을 출력하시오.
--문제5) first_ascent가 10월에 해당하는 산이름을 출력하시오. 

----------------------------------------------------------------
-- 답안
--문제1) 등산일자와 산 이름을 조회하되, 등산한 일자가 오래된 순으로 조회하시오.
select first_ascent, name from mountains order by first_ascent asc;


--문제2) 산 이름에 i가 포함된 산들만 추출하시오.
select name from mountains
where name like '%i%';


--문제3) 이름에 C가 들어가거나 fisrt_ascent가 50년대인 산들을 출력하시오.
select name, first_ascent
from mountains
where name like'%C%' or first_ascent between '1950-01-01' and '1959-12-31';


--문제4) height_meter 8000이상 first_ascent가 1900-1999사이인 산들을 출력하시오.
SELECT name, height_meters FROM mountains WHERE height_meters>=8000 and first_ascent between '1900-00-00' and '1999-12-31';


--문제5) first_ascent가 10월에 해당하는 산이름을 출력하시오. 
select name from mountains where first_ascent like '%-10-%';
