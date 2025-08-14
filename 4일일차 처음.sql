--  outer 조인
- left, right

select *
from student s
left join enrol e on s.
stu_no = e.stu_no;

-- 각 학생들의 시험을 본 개수 출력
-- 이름, 개수 출력, 단 시험을 하나도 보지 않았으면 개수는 0

SELECT * FROM EMP;

SELECT E.EMPNO, 
       E.EMPNO, 
       COUNT(M.EMPNO) AS 부하직원수
FROM EMP E
LEFT JOIN EMP M
       ON E.EMPNO = M.MGR
GROUP BY E.EMPNO, E.ENAME
ORDER BY E.EMPNO;



SELECT * FROM STUDENT;
SELECT * FROM ENROL;

SELECT s.stu_name,
       COUNT(e.enr_grade) AS 시험개수
FROM student s
LEFT JOIN enrol e
       ON s.stu_no = e.stu_no
GROUP BY s.stu_name
ORDER BY s.stu_name;

SELECT MGR, COUNT(*)
FROM EMP 
GROUP BY MGR;


-- 각 직원의 부자직원 수를 구하기, 단 없으면 0으로 출력 
-- 출력 컬럼 : 사번, 이름 , 부하직원 수

select * from emp;

SELECT E.EMPNO, E.ENAME, COUNT(E1.EMPNO) AS "부하직원 수"
FROM EMP E
LEFT JOIN EMP1 
    ON EMP1.MRG = EMP.EMPNO
GROUP BY E.EMPNO, E.ENMAE;












-- 각 직원의 부자직원 수를 구하기, 단 없으면 0으로 출력 
-- 출력 컬럼 : 사번, 이름 , 부하직원 수
SELECT E.EMPNO, E.ENAME, NVL(T.CNT, 0) AS CNT
FROM EMP E
LEFT JOIN (
    SELECT MGR, COUNT(*) AS CNT
    FROM EMP
    GROUP BY MGR
) T ON E.EMPNO = T.MGR
ORDER BY CNT DESC;


SELECT * FROM STU;
SELECT * FROM PROFESSOR;

--PROFNO(담당교수)는 PROFSSER와 연결됨.
--학번, 학생이름, 담당교수 이름 출력
--단, 담당교수가 없으면 담당교수 이름을 '담당교수 없음'으로 출력

SELECT STUNO, S.NAME, NVL(P.NAME, '담당교수 없음')as 담당교수
FROM STU S
LEFT JOIN PROFESSOR P
    ON P.PROFNO = S.PROFNO;


-- NVL의 특징
-- 1. 학생들의 시험 평균 점수를 출력
-- 단, 시험을 보지 않은 학생은 '성적 없음' 출력

SELECT * FROM STUDENT;
SELECT * FROM ENROL;

SELECT S.STU_NAME, NVL(TO_CHAR(AVG(E.ENR_GRADE)), '성적없음')
FROM STUDENT S
LEFT JOIN ENROL E
    ON S.STU_NO = E.STU_NO
GROUP BY S.STU_NO, S.STU_NAME;
