
CREATE TABLE FEB1 (
    opratio      NUMBER(4,2),
    temp         NUMBER(3),   
    tr           NUMBER(6),
    fal          NUMBER(4),
    stock        NUMBER(6),
    costs        NUMBER(7),
    usingratio   NUMBER(4,2),
    hiredate     DATE
);

CREATE TABLE FEB2 (
    opratio      NUMBER(4,2),
    temp         NUMBER(3),   
    tr           NUMBER(6),
    fal          NUMBER(4),
    stock        NUMBER(6),
    costs        NUMBER(7),
    usingratio   NUMBER(4,2),
    hiredate     DATE
);

CREATE TABLE FEB3 (
    opratio      NUMBER(4,2),
    temp         NUMBER(3),   
    tr           NUMBER(6),
    fal          NUMBER(4),
    stock        NUMBER(6),
    costs        NUMBER(7),
    usingratio   NUMBER(4,2),
    hiredate     DATE
);

CREATE TABLE FEB4 (
    opratio      NUMBER(4,2),
    temp         NUMBER(3),   
    tr           NUMBER(6),
    fal          NUMBER(4),
    stock        NUMBER(6),
    costs        NUMBER(7),
    usingratio   NUMBER(4,2),
    hiredate     DATE
);

CREATE TABLE FEB5 (
    opratio      NUMBER(4,2),
    temp         NUMBER(3),   
    tr           NUMBER(6),
    fal          NUMBER(4),
    stock        NUMBER(6),
    costs        NUMBER(7),
    usingratio   NUMBER(4,2),
    hiredate     DATE
);

CREATE TABLE FEB6 (
    opratio      NUMBER(4,2),
    temp         NUMBER(3),   
    tr           NUMBER(6),
    fal          NUMBER(4),
    stock        NUMBER(6),
    costs        NUMBER(7),
    usingratio   NUMBER(4,2),
    hiredate     DATE
);

CREATE TABLE FEB7 (
    opratio      NUMBER(4,2),
    temp         NUMBER(3),   
    tr           NUMBER(6),
    fal          NUMBER(4),
    stock        NUMBER(6),
    costs        NUMBER(7),
    usingratio   NUMBER(4,2),
    hiredate     DATE
);

CREATE TABLE FEB8 (
    opratio      NUMBER(4,2),
    temp         NUMBER(3),   
    tr           NUMBER(6),
    fal          NUMBER(4),
    stock        NUMBER(6),
    costs        NUMBER(7),
    usingratio   NUMBER(4,2),
    hiredate     DATE
);

SELECT EXTRACT(MONTH FROM HIREDATE) AS Month, COUNT(*) AS TotalOrders
FROM FEB1
GROUP BY EXTRACT(MONTH FROM HIREDATE)
ORDER BY EXTRACT(MONTH FROM HIREDATE);

------월별 가동률 평균값 구하기-------
SELECT TO_CHAR(hiredate, 'YYYY-MM') AS "월",
       AVG(opratio) AS "가동률 평균"
FROM feb1
GROUP BY EXTRACT(MONTH FROM HIREDATE)

------온도 평균값 구하기-------
SELECT TO_CHAR(hiredate, 'YYYY') AS "당해",
        AVG(TEMP) AS "온도 평균"
from feb1
GROUP BY TO_CHAR(hiredate, 'YYYY');


------월별 전기사용량 구하기-------
SELECT TO_CHAR(hiredate, 'YYYY-MM') AS "월",
       AVG(usingratio) AS "월별 전기사용량"
FROM feb1
GROUP BY TO_CHAR(hiredate, 'YYYY-MM');


------월별 비용 구하기-------
SELECT TO_CHAR(hiredate, 'YYYY-MM') AS "월",
        sum(costs) AS "월별 비용"
FROm feb1
GROUP BY TO_CHAR(hiredate, 'YYYY-MM');


SELECT stock FROM FEB8;

commit;
select * from feb2;


select * from member;

DROP TABLE FEB1;
DROP TABLE FEB2;
DROP TABLE FEB3;
DROP TABLE FEB4;
DROP TABLE FEB5;
DROP TABLE FEB6;
DROP TABLE FEB7;
DROP TABLE FEB8;


SELECT * FROM FEB1;
SELECT * FROM PROCESS;


COMMIT;

drop table member;