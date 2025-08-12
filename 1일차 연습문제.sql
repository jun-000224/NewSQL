--EMP 테이블 참고 정보
-- EMPNO(사번), ENAME(직원이름), JOB(직급), MGR(팀장OR사수의 사번), 
-- HIREDATE(입사일), SAL(급여), COMM(커미션, 보너스), DEPTNO(부서번호)


--참고 예시
SELECT * FROM EMP;
SELECT * FROM SALGRADE;
SELECT * FROM DEPT;

SELECT * FROM EMP
WHERE HIREDATE > '81/01/01';
SELECT * FROM SALGRADE;
SELECT * FROM DEPT;



-- 1. ENAME 열에서 모든 이름을 소문자로 변경하여 출력해 보시오.
SELECT LOWER(ENAME) 
FROM EMP; 

--2. ENAME 열에서 'SMITH'를 찾고, 그 값을 'JOHN'으로 변경하여 출력해 보시오.
SELECT REPLACE(ENAME, 'SMITH', 'John') AS 이름
from EMP;

--3. JOB 열에서 'SALESMAN'만 추출하고, 해당 컬럼(SALESMAN)의 길이를 구해 보시오.
SELECT JOB, LENGTH(JOB)
ㄴ딛ㅊ
FROM EMP
WHERE JOB = 'SALESMAN';

--4. ENAME 열에서 이름의 첫 글자만 대문자로 변경하여 출력해 보시오.
SELECT INITCAP(ENAME)
FROM EMP;

--5. ENAME 열에서 이름의 마지막 3글자를 추출하여 출력해 보시오.
SELECT ENAME, SUBSTR(ENAME, -3)
FROM EMP;

--6. JOB 열의 값 중 'MANAGER'로 시작하는 직책을 가진 사람들의 수를 구해 보시오.
SELECT COUNT(JOB)
FROM EMP
WHERE JOB LIKE 'MANAGER&';

SELECT * FROM PROFESSSOR;

--7. ENAME과 JOB 열을 합쳐서 'ENAME(JOB)' 형태로 출력해 보시오.
SELECT JOB ||'' || ENAME AS 문자열합체
FROM EMP;

-- 8. ENAME 열에서 'A'가 포함된 모든 사람의 이름을 추출해 보시오.



--1. 모든 직원의 SAL 값에 10%를 추가한 값을 출력해 보시오.
SELECT ENAME, (SAL*1.1) AS 추가
FROM EMP;

--2. SAL 값이 1500 이상인 직원들의 평균 급여를 구해 보시오.
SELECT ROUND(AVG(SAL), 2) AS "1500원 이상의 평균급여"
FROM EMP
WHERE SAL >=1500;

--3. 각 부서(DEPTNO)별로 급여의 총합을 구해 보시오.
SELECT DEPTNO, ROUND(AVG(SAL), 2)AS 평균급여
FROM EMP
GROUP BY DEPTNO;

--4. SAL 값이 1300 이상이면서 부서번호가 20인 직원들의 평균 급여를 구해 보시오.
SELECT AVG(SAL) AS "1300 이상이면서 부서번호 20 직원들의 평균 급여"
FROM EMP
WHERE SAL>1300 AND DEPTNO=20;

--5. 각 부서별로 급여가 가장 높은 직원의 이름을 구해 보시오.
SELECT ENAME, MAX(SAL)
FROM EMP
GROUP BY DEPTNO;

--6. 직원들의 급여를 오름차순으로 정렬하시오.
SELECT ENAME, SAL
FROM EMP
ORDER BY SAL;







--1. HIREDATE에서 직원이 입사한 년도를 추출하여 출력해 보시오.
SELECT ENAME, HIREDATE
    SYSDATE,
    TO_CHAR(SYSDATE, 'YYYY-MM-DD HH:MI:SS')
FROM EMP;

--2. HIREDATE가 1981년 1월 1일 이후인 직원들의 이름을 출력해 보시오.
SELECT ENAME, HIREDATE, 
EXTRACT(YEAR FROM HIREDATE) AS 입사년도
FROM EMP;

--3. 입사일이 1981년 5월 1일 이전인 직원들의 이름과 입사일을 출력해 보시오.
SELECT ENAME
FROM EMP
WHERE HIREDATE > TO_DATE('1981-01-01', 'YYYY-MM-DD');


SELECT ENAME, HIREDATE
FROM EMP
WHERE HIREDATE < TO_DATE('1981-05-01', 'YYYY-MM-DD');







--1. 각 부서별 평균 급여를 출력.
SELECT DEPTNO, AVG(SAL)AS평균급여
FROM EMP
GROUP BY DEPTNO;

--2. 각 부서별 인원 출력.
SELECT DEPTNO, COUNT(*)AS "총 원"
FROM EMP
GROUP BY DEPTNO;

--3. 각 부서에서 급여가 1500이상인 사람의 부서별 사람 수 출력(부서명, 사람수 출력)
SELECT DEPTNO, COUNT(*)AS "총 원"
FROM EMP;
GROUP BY DEPTNO
HAVING SAL>=1500;
