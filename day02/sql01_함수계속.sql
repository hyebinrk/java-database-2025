/* 단일행함수 */
--
SELECT concat('hello', 'oracle') -- 한 행에 한 열만 출력되는 값 = 스칼라(Scalar)값
 FROM dual;

-- 인덱스가 1부터, 일반프로그래밍언어의 배열이 0부터 시작하는 것과의 차이
-- SUBSTR(변환할값, 인덱스, 길이) - 파이썬 substring() 함수와 동일
-- -인덱스 - 뒤에서부터 위치(파이썬과 동일)
SELECT SUBSTR(EMAIL, 1, 2)
	, substr(email, -2, 2)
	, email
 FROM employees;

-- 전화번호 자를때, 주민번호 자를 때 SUBSTR()활용

-- INSTR(체크할문자열, 찾는글자, 시작위치, 몇번째인지)
SELECT '010-9999-8888' 
	, instr('010-9999-8888', '-', 1, 1)
AS FROM dual;

-- LPAD(문자열, 자리수, 채울문자)
-- 2025-11-23
-- 2025-3-12 -> 2025-03-12
-- 0000100 규칙인데
-- 101 -> 0000101
SELECT LPAD('100', 7, '0') -- 진짜 많이 씀
	  , RPAD('ABC', 7, '-') -- 잘 안 씀
	FROM dual;

-- TRIM()함수 트리플. == 파이썬 strip() 함수와 동일
-- LTRIM(), RTRIM(), TRIM()
SELECT '<<<' || '     Hello Oracle      ' || '>>>'
	  , '<<<' || ltrim('     Hello Oracle     ') || '>>>'
	  , '<<<' || rtrim('     Hello Oracle     ') || '>>>'
	  , '<<<' || trim('     Hello Oracle     ') || '>>>' -- 많이 씀
	FROM dual;

-- REPLACE(), 파이썬에도 동일하게 존재
SELECT phone_number
	, REPLACE(phone_number, '123', '786') -- 많이 씀
	FROM employees;

/*
 * 숫자함수, 집계함수와 같이 사용이 많이 됨.
 * */
-- ROUND() 반올림 함수 - 파이썬 존재
-- CEIL() 올림함수, FLOOR() 내림함수, TRUNC() 내림함수 소수점
-- MOD() 나누기 나머지 값 - 파이썬 mode(), % 연산과 동일
-- POWER() 파이썬 math.pow(), power(), 2^10 승수계산 동일
SELECT 786.5427
	, round(786.5427) AS round0 -- 소수점 없이
	, round(786.5427, 1) AS round1 -- 소수점 1
	, round(786.5427, 3) AS round2 -- 소수점 셋째자리
	, ceil(786.5427) AS ceilRes
	, floor(786.5427) AS floorRes
	, trunc(786.5427,2) AS truncRes
	, mod(10,4) AS "나머지"
	, power(2,10) AS "2의 10승"
	FROM dual;

/*
 * 날짜함수, 나라마다 표현방식 다름
 * 2025-03-12 아시아...
 * March/12/2025 미국, 캐나다...
 * 12/March/2025 유럽,인도,베트남...
 * */

-- 오늘날짜
SELECT sysdate AS 오늘날짜 -- GMT기준, +09필요
	-- 날짜 포캣팅 사용되는 YY, YYYY, MM, DD, DAY 년월일
	-- AM/PM, HH24, MI, SS, W, Q(분기)
	,TO_CHAR(sysdate, 'YYYY-MM-DD') AS 한국식
	,TO_CHAR(sysdate, 'AM HH24-MI-SS') AS 시간
	,TO_CHAR(sysdate, 'MON/DD/YYYY') AS 미국식
	,TO_CHAR(sysdate, 'DD/MM/YYYY') AS 영국식
	FROM dual;

-- ADD_MONTHS() 월을 추가함수
SELECT hire_date
	, to_char(hire_date, 'yyyy-mm-dd') AS 입사일자
	, add_months(hire_date, 3) AS 정규직일자
	, next_day(hire_date, '월') AS 돌아오는월요일 -- 'MON' == '월'
	, last_day('2025-02-01') AS 달마지막날
	FROM employees;

-- GMT + 9HOUR
-- 인터벌 숫자 뒤 HOUR, DAY, MONTH, YEAR
SELECT to_char(sysdate + INTERVAL '9' HOUR, 'YYYY-MM-DD HH24:MI:SS') AS seoul_time
	FROM dual;

/*
 * 형 변환 함수
 * */
-- TO_CHAR()
-- 숫자형을 문자형으로 변경
-- 
SELECT 12345 AS 원본
	, TO_CHAR(12345, '9999999') AS "원본+두자리"
	, TO_CHAR(12345, '0999999') AS "원본+두자리0"
	, TO_CHAR(12345, '$99999') AS "통화단위+원본"
	, TO_CHAR(12345, '99999.99') AS "소수점"
	, TO_CHAR(12345, '99,999') AS "천단위쉼표" -- 진짜 많이 씀
	FROM dual;

-- TO_NUMBER() 문자형된 데이터를 숫자로
SELECT '5.0' * 5
	, to_number('5.0') AS 숫자형변환
--	, to_number('Hello') -- 숫자로 변경할 수 없는 형태
	FROM dual;

-- TO_DATE() 날짜형태를 문자형으로
SELECT '2025-03-12'
	,to_date('2025-03-12') +10 -- 날짜형으로 바꾸면 연산 가능!
	FROM dual;

/*
 * 일반함수
 * */
-- NVL(컬럼|데이터, 바꿀값) 널값을 다른값으로 치환
SELECT commission_pct
	, nvl(commission_pct, '0.0')
	FROM employees;

SELECT nvl(hire_date, sysdate) -- 입사일자가 비어있으면 오늘 날짜로 대체
	FROM employees;

-- NVL2(컴럼|데이터, 널이 아닐 때 처리, 널일 때 처리할 부분)
SELECT commission_pct
	, salary
	, nvl2(commission_pct, salary + (salary * commission_pct),salary) AS 커미션급여
	FROM employees;

-- DECODE(A, B, '1','2') A가 B일 경우 1아니면 2
-- 오라클만 있는 함수
SELECT email, phone_number, job_id
	, DECODE(job_id , 'IT_PROG', '개발자만세!!', '나머지 다 죽어') AS 캐치프레이즈
	FROM employees;
--	WHERE job_id = 'IT_PROG'

/*
 * CASE 구문, 정말 중요!!
 * IF, ELIF의 중복된 구문과 유사 - 적절하게 사용중
 * */
SELECT CASE job_id WHEN 'AD_PRES' THEN '사장'
				   WHEN 'AD_VP' THEN '부사장'
				   WHEN 'IT_PROG' THEN '프로그래머'
				   WHEN 'SA_MAN' THEN '영업사원'
				   ELSE '미분류'
	END AS 직급
	, employee_id
	, job_id
FROM EMPLOYEES;

/*
 * 정규식(Regula Expression) - 문자열 패턴을 가지고, 동일한 패턴 데이터 추출 사용
 * ^, $, ., *, [], [^] 패턴인식할 때 필요한 키워드.
  * */
SELECT *
	FROM employees
WHERE phone_number LIKE '%.%.%'; -- 세자리 전화, 네자리 전화번호가 구분 안 됨

-- 전화번호가 .로 구분되는 세자리 전화번호만 필터링
-- '[0-9]{6}-[0-9]{7}' 주민번호 정규식 패턴
SELECT *
	FROM employees
	WHERE regexp_like(phone_number, '[0-9]{3}.[0-9]{3}.[0-9]{4}');

-- first_name이 J로 시작하고, 두번째 글자가 a나 o인 사람을 출력하시오.
SELECT *
	FROM employees
	WHERE regexp_like(first_name, '^J(a|o)');