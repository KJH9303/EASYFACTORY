
-- 공정별 전체 합 --
CREATE VIEW FEB_DSUM AS
select hiredate, ROUND(AVG(OPRATIO),2) as avg_opratio, ROUND(AVG(TEMP),0) as avg_temp, sum(TR) as sum_tr, sum(FAL) as sum_fal, 
sum(STOCK) as sum_stock, sum(COSTS) as sum_costs, sum(USINGRATIO) as sum_usingratio
FROM (
    SELECT hiredate,  opratio,temp,tr,fal,stock, costs, usingratio FROM FEB1
    union
    SELECT hiredate,  opratio,temp,tr,fal,stock, costs, usingratio FROM FEB2
    union
    SELECT hiredate,  opratio,temp,tr,fal,stock, costs, usingratio FROM FEB3
    union
    SELECT hiredate,  opratio,temp,tr,fal,stock, costs, usingratio FROM FEB4
    union
    SELECT hiredate,  opratio,temp,tr,fal,stock, costs, usingratio FROM FEB5
    union
    SELECT hiredate,  opratio,temp,tr,fal,stock, costs, usingratio FROM FEB6
    union
    SELECT hiredate,  opratio,temp,tr,fal,stock, costs, usingratio FROM FEB7
    union
    SELECT hiredate,  opratio,temp,tr,fal,stock, costs, usingratio FROM FEB8
)
GROUP BY hiredate
ORDER BY hiredate;

DROP VIEW FEB_DSUM;

SELECT * FROM FEB_DSUM;

SELECT * FROM FEB_DSUM WHERE HIREDATE BETWEEN '2023-01-01' AND '2023-01-01';

-- 총 가동률(평균) 날짜지정 쿼리(OPRATIO)
SELECT ROUND(AVG(AVG_OPRATIO), 2) AS AVERAGE_OPRATIO FROM FEB_DSUM 
WHERE HIREDATE BETWEEN TO_DATE('2023-01-01', 'YYYY-MM-DD') AND TO_DATE('2023-01-10', 'YYYY-MM-DD');
                    
-- 총 온도(평균) 날짜지정 쿼리(TEMP)
SELECT ROUND(AVG(AVG_TEMP), 0) AS AVERAGE_TEMP FROM FEB_DSUM 
WHERE HIREDATE BETWEEN TO_DATE('2023-01-01', 'YYYY-MM-DD') AND TO_DATE('2023-01-10', 'YYYY-MM-DD');
                    
-- 총 정상품(총합) 날짜지정 쿼리(TR)
SELECT SUM(SUM_TR) AS SUM_TR FROM FEB_DSUM 
WHERE HIREDATE BETWEEN TO_DATE('2023-01-01', 'YYYY-MM-DD') AND TO_DATE('2023-01-10', 'YYYY-MM-DD');
                    
-- 총 불량품(총합) 날짜지정 쿼리(FAL)
SELECT SUM(SUM_FAL) AS SUM_FAL FROM FEB_DSUM 
WHERE HIREDATE BETWEEN TO_DATE('2023-01-01', 'YYYY-MM-DD') AND TO_DATE('2023-01-31', 'YYYY-MM-DD');
                    
-- 총 재고량(총합) 날짜지정 쿼리(STOCK)
SELECT SUM(SUM_STOCK) AS SUM_STOCK FROM FEB_DSUM 
WHERE HIREDATE BETWEEN TO_DATE('2023-01-01', 'YYYY-MM-DD') AND TO_DATE('2023-01-31', 'YYYY-MM-DD');
                    
-- 총 전기 사용비용(총합) 날짜지정 쿼리(costs)
SELECT SUM(SUM_COSTS) AS SUM_COSTS FROM FEB_DSUM 
WHERE HIREDATE BETWEEN TO_DATE('2023-01-01', 'YYYY-MM-DD') AND TO_DATE('2023-01-31', 'YYYY-MM-DD');
                    
-- 총 전기 사용량(총합) 날짜지정 쿼리(USINGRATIO)
SELECT ROUND(SUM(SUM_USINGRATIO),2) AS SUM_USINGRATIO FROM FEB_DSUM 
WHERE HIREDATE BETWEEN TO_DATE('2023-01-01', 'YYYY-MM-DD') AND TO_DATE('2023-01-31', 'YYYY-MM-DD');
                    
commit;







-- 공정별 가동률 --
CREATE VIEW FEB_OPRATIO AS
SELECT
  t1.HIREDATE,
  t1.OPRATIO as "FEB1",
  t2.OPRATIO as "FEB2",
  t3.OPRATIO as "FEB3",
  t4.OPRATIO as "FEB4",
  t5.OPRATIO as "FEB5",
  t6.OPRATIO as "FEB6",
  t7.OPRATIO as "FEB7",
  t8.OPRATIO as "FEB8"
FROM FEB1 t1
JOIN FEB2 t2 ON t1.HIREDATE = t2.HIREDATE
JOIN FEB3 t3 ON t1.HIREDATE = t3.HIREDATE
JOIN FEB4 t4 ON t1.HIREDATE = t4.HIREDATE
JOIN FEB5 t5 ON t1.HIREDATE = t5.HIREDATE
JOIN FEB6 t6 ON t1.HIREDATE = t6.HIREDATE
JOIN FEB7 t7 ON t1.HIREDATE = t7.HIREDATE
JOIN FEB8 t8 ON t1.HIREDATE = t8.HIREDATE

ORDER BY HIREDATE;

drop view FEB_OPRATIO;

select * from FEB_OPRATIO;

-- 날짜별 쿼리 날짜별로 행수 추가 열값은 8개로 고정--
SELECT feb1,feb2,feb3,feb4,feb5,feb6,feb7,feb8 
FROM FEB_OPRATIO 
WHERE hiredate BETWEEN TO_DATE('2023-01-01', 'YYYY-MM-DD') AND TO_DATE('2023-01-07', 'YYYY-MM-DD');


-- 날짜별 합 쿼리 --
-- 1행 8열로--
SELECT  ROUND(AVG(feb1), 2) AS feb1,
        ROUND(AVG(feb2), 2) AS feb2,
        ROUND(AVG(feb3), 2) AS feb3,
        ROUND(AVG(feb4), 2) AS feb4,
        ROUND(AVG(feb5), 2) AS feb5,
        ROUND(AVG(feb6), 2) AS feb6,
        ROUND(AVG(feb7), 2) AS feb7,
        ROUND(AVG(feb8), 2) AS feb8 
FROM FEB_OPRATIO 
WHERE hiredate BETWEEN TO_DATE('2023-01-01', 'YYYY-MM-DD') AND TO_DATE('2023-01-07', 'YYYY-MM-DD');


-- 공정별 총생산 --
CREATE VIEW FEB_TR AS
SELECT
  t1.HIREDATE,
  t1.TR as "FEB1",
  t2.TR as "FEB2",
  t3.TR as "FEB3",
  t4.TR as "FEB4",
  t5.TR as "FEB5",
  t6.TR as "FEB6",
  t7.TR as "FEB7",
  t8.TR as "FEB8"
FROM FEB1 t1
JOIN FEB2 t2 ON t1.HIREDATE = t2.HIREDATE
JOIN FEB3 t3 ON t1.HIREDATE = t3.HIREDATE
JOIN FEB4 t4 ON t1.HIREDATE = t4.HIREDATE
JOIN FEB5 t5 ON t1.HIREDATE = t5.HIREDATE
JOIN FEB6 t6 ON t1.HIREDATE = t6.HIREDATE
JOIN FEB7 t7 ON t1.HIREDATE = t7.HIREDATE
JOIN FEB8 t8 ON t1.HIREDATE = t8.HIREDATE

ORDER BY HIREDATE;
drop view FEB_TR;
select * from FEB_TR;

-- 날짜별 합 쿼리 --
-- 1행 8열로--
SELECT  ROUND(AVG(feb1), 2) AS feb1,
        ROUND(AVG(feb2), 2) AS feb2,
        ROUND(AVG(feb3), 2) AS feb3,
        ROUND(AVG(feb4), 2) AS feb4,
        ROUND(AVG(feb5), 2) AS feb5,
        ROUND(AVG(feb6), 2) AS feb6,
        ROUND(AVG(feb7), 2) AS feb7,
        ROUND(AVG(feb8), 2) AS feb8 
FROM FEB_TR 
WHERE hiredate BETWEEN TO_DATE('2023-01-01', 'YYYY-MM-DD') AND TO_DATE('2023-01-07', 'YYYY-MM-DD');


-- 공정별 전기비용 --
CREATE VIEW FEB_COSTS AS
SELECT
  t1.HIREDATE,
  t1.COSTS as "FEB1",
  t2.COSTS as "FEB2",
  t3.COSTS as "FEB3",
  t4.COSTS as "FEB4",
  t5.COSTS as "FEB5",
  t6.COSTS as "FEB6",
  t7.COSTS as "FEB7",
  t8.COSTS as "FEB8"
FROM FEB1 t1
JOIN FEB2 t2 ON t1.HIREDATE = t2.HIREDATE
JOIN FEB3 t3 ON t1.HIREDATE = t3.HIREDATE
JOIN FEB4 t4 ON t1.HIREDATE = t4.HIREDATE
JOIN FEB5 t5 ON t1.HIREDATE = t5.HIREDATE
JOIN FEB6 t6 ON t1.HIREDATE = t6.HIREDATE
JOIN FEB7 t7 ON t1.HIREDATE = t7.HIREDATE
JOIN FEB8 t8 ON t1.HIREDATE = t8.HIREDATE

ORDER BY HIREDATE;

drop view FEB_COSTS;

select * from FEB_COSTS;

-- 날짜별 쿼리 날짜별로 행수 추가 열값은 8개로 고정--
SELECT feb1,feb2,feb3,feb4,feb5,feb6,feb7,feb8 
FROM FEB_COSTS 
WHERE hiredate BETWEEN TO_DATE('2023-01-01', 'YYYY-MM-DD') AND TO_DATE('2023-01-07', 'YYYY-MM-DD');


-- 공정별 전기사용량 --
CREATE VIEW FEB_USINGRATIO AS
SELECT
  t1.HIREDATE,
  t1.USINGRATIO as "FEB1",
  t2.USINGRATIO as "FEB2",
  t3.USINGRATIO as "FEB3",
  t4.USINGRATIO as "FEB4",
  t5.USINGRATIO as "FEB5",
  t6.USINGRATIO as "FEB6",
  t7.USINGRATIO as "FEB7",
  t8.USINGRATIO as "FEB8"
FROM FEB1 t1
JOIN FEB2 t2 ON t1.HIREDATE = t2.HIREDATE
JOIN FEB3 t3 ON t1.HIREDATE = t3.HIREDATE
JOIN FEB4 t4 ON t1.HIREDATE = t4.HIREDATE
JOIN FEB5 t5 ON t1.HIREDATE = t5.HIREDATE
JOIN FEB6 t6 ON t1.HIREDATE = t6.HIREDATE
JOIN FEB7 t7 ON t1.HIREDATE = t7.HIREDATE
JOIN FEB8 t8 ON t1.HIREDATE = t8.HIREDATE

ORDER BY HIREDATE;

drop view FEB_USINGRATIO;

select * from FEB_USINGRATIO;

-- 날짜별 쿼리 날짜별로 행수 추가 열값은 8개로 고정--
SELECT feb1,feb2,feb3,feb4,feb5,feb6,feb7,feb8 
FROM FEB_USINGRATIO 
WHERE hiredate BETWEEN TO_DATE('2023-01-01', 'YYYY-MM-DD') AND TO_DATE('2023-01-07', 'YYYY-MM-DD');

-- 공정별 재고량 --
CREATE VIEW FEB_STOCK AS
SELECT
  t1.HIREDATE,
  t1.STOCK as "FEB1",
  t2.STOCK as "FEB2",
  t3.STOCK as "FEB3",
  t4.STOCK as "FEB4",
  t5.STOCK as "FEB5",
  t6.STOCK as "FEB6",
  t7.STOCK as "FEB7",
  t8.STOCK as "FEB8"
FROM FEB1 t1
JOIN FEB2 t2 ON t1.HIREDATE = t2.HIREDATE
JOIN FEB3 t3 ON t1.HIREDATE = t3.HIREDATE
JOIN FEB4 t4 ON t1.HIREDATE = t4.HIREDATE
JOIN FEB5 t5 ON t1.HIREDATE = t5.HIREDATE
JOIN FEB6 t6 ON t1.HIREDATE = t6.HIREDATE
JOIN FEB7 t7 ON t1.HIREDATE = t7.HIREDATE
JOIN FEB8 t8 ON t1.HIREDATE = t8.HIREDATE

ORDER BY HIREDATE;

drop view FEB_STOCK;

select * from FEB_STOCK;

-- 날짜별 쿼리 날짜별로 행수 추가 열값은 8개로 고정--
SELECT feb1,feb2,feb3,feb4,feb5,feb6,feb7,feb8 
FROM FEB_STOCK 
WHERE hiredate BETWEEN TO_DATE('2023-01-01', 'YYYY-MM-DD') AND TO_DATE('2023-01-07', 'YYYY-MM-DD');

-- 공정별 불량 --
CREATE VIEW FEB_FAL AS
SELECT
  t1.HIREDATE,
  t1.FAL as "FEB1",
  t2.FAL as "FEB2",
  t3.FAL as "FEB3",
  t4.FAL as "FEB4",
  t5.FAL as "FEB5",
  t6.FAL as "FEB6",
  t7.FAL as "FEB7",
  t8.FAL as "FEB8"
FROM FEB1 t1
JOIN FEB2 t2 ON t1.HIREDATE = t2.HIREDATE
JOIN FEB3 t3 ON t1.HIREDATE = t3.HIREDATE
JOIN FEB4 t4 ON t1.HIREDATE = t4.HIREDATE
JOIN FEB5 t5 ON t1.HIREDATE = t5.HIREDATE
JOIN FEB6 t6 ON t1.HIREDATE = t6.HIREDATE
JOIN FEB7 t7 ON t1.HIREDATE = t7.HIREDATE
JOIN FEB8 t8 ON t1.HIREDATE = t8.HIREDATE

ORDER BY HIREDATE;

drop view FEB_FAL;

select * from FEB_FAL;

-- 날짜별 쿼리 날짜별로 행수 추가 열값은 8개로 고정--
SELECT feb1,feb2,feb3,feb4,feb5,feb6,feb7,feb8 
FROM FEB_FAL 
WHERE hiredate BETWEEN TO_DATE('2023-01-01', 'YYYY-MM-DD') AND TO_DATE('2023-01-07', 'YYYY-MM-DD');


-- 기간별 각 공정별 가동률 평균 값 --
SELECT  ROUND(AVG(feb1), 2) AS feb1,
        ROUND(AVG(feb2), 2) AS feb2,
        ROUND(AVG(feb3), 2) AS feb3,
        ROUND(AVG(feb4), 2) AS feb4,
        ROUND(AVG(feb5), 2) AS feb5,
        ROUND(AVG(feb6), 2) AS feb6,
        ROUND(AVG(feb7), 2) AS feb7,
        ROUND(AVG(feb8), 2) AS feb8 
        FROM FEB_OPRATIO 
        WHERE hiredate BETWEEN TO_DATE('2023-01-01', 'YYYY-MM-DD') AND TO_DATE('2023-01-01', 'YYYY-MM-DD');
        
-- 기간별 각 공정별 총 생산량 --
SELECT  ROUND(SUM(feb1), 2) AS feb1,
        ROUND(SUM(feb2), 2) AS feb2,
        ROUND(SUM(feb3), 2) AS feb3,
        ROUND(SUM(feb4), 2) AS feb4,
        ROUND(SUM(feb5), 2) AS feb5,
        ROUND(SUM(feb6), 2) AS feb6,
        ROUND(SUM(feb7), 2) AS feb7,
        ROUND(SUM(feb8), 2) AS feb8 
        FROM FEB_TR 
        WHERE hiredate BETWEEN TO_DATE('2023-01-01', 'YYYY-MM-DD') AND TO_DATE('2023-01-10', 'YYYY-MM-DD');
        
-- 기간별 각 공정별 총 비용 --
SELECT  ROUND(SUM(feb1), 2) AS feb1,
        ROUND(SUM(feb2), 2) AS feb2,
        ROUND(SUM(feb3), 2) AS feb3,
        ROUND(SUM(feb4), 2) AS feb4,
        ROUND(SUM(feb5), 2) AS feb5,
        ROUND(SUM(feb6), 2) AS feb6,
        ROUND(SUM(feb7), 2) AS feb7,
        ROUND(SUM(feb8), 2) AS feb8 
        FROM FEB_COSTS 
        WHERE hiredate BETWEEN TO_DATE('2023-01-01', 'YYYY-MM-DD') AND TO_DATE('2023-01-10', 'YYYY-MM-DD');
        
-- 기간별 각 공정별 총 에너지 사용량 --
SELECT  ROUND(SUM(feb1), 2) AS feb1,
        ROUND(SUM(feb2), 2) AS feb2,
        ROUND(SUM(feb3), 2) AS feb3,
        ROUND(SUM(feb4), 2) AS feb4,
        ROUND(SUM(feb5), 2) AS feb5,
        ROUND(SUM(feb6), 2) AS feb6,
        ROUND(SUM(feb7), 2) AS feb7,
        ROUND(SUM(feb8), 2) AS feb8 
        FROM FEB_USINGRATIO
        WHERE hiredate BETWEEN TO_DATE('2023-01-01', 'YYYY-MM-DD') AND TO_DATE('2023-01-10', 'YYYY-MM-DD');
        
    
-- 기간별 각 공정별 총 재고량 --
SELECT  ROUND(SUM(feb1), 2) AS feb1,
        ROUND(SUM(feb2), 2) AS feb2,
        ROUND(SUM(feb3), 2) AS feb3,
        ROUND(SUM(feb4), 2) AS feb4,
        ROUND(SUM(feb5), 2) AS feb5,
        ROUND(SUM(feb6), 2) AS feb6,
        ROUND(SUM(feb7), 2) AS feb7,
        ROUND(SUM(feb8), 2) AS feb8 
        FROM FEB_STOCK
        WHERE hiredate BETWEEN TO_DATE('2023-01-01', 'YYYY-MM-DD') AND TO_DATE('2023-01-10', 'YYYY-MM-DD');


-- 기간별 각 공정별 총 불량 --
SELECT  ROUND(SUM(feb1), 2) AS feb1,
        		        ROUND(SUM(feb2), 2) AS feb2,
        		        ROUND(SUM(feb3), 2) AS feb3,
        		        ROUND(SUM(feb4), 2) AS feb4,
        		        ROUND(SUM(feb5), 2) AS feb5,
        		        ROUND(SUM(feb6), 2) AS feb6,
        		        ROUND(SUM(feb7), 2) AS feb7,
        		        ROUND(SUM(feb8), 2) AS feb8 
        		 FROM FEB_FAL 
        		 WHERE hiredate BETWEEN TO_DATE('2023-01-01', 'YYYY-MM-DD') AND TO_DATE('2023-01-01', 'YYYY-MM-DD');










drop table feb1;
drop table feb2;
drop table feb3;
drop table feb4;
drop table feb5;
drop table feb6;
drop table feb7;
drop table feb8;
