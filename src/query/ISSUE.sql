DROP TABLE ISSUE;
DROP SEQUENCE ISSUE_SEQ;
----------------------------------------
---- 이슈 게시판 테이블 ----------------
----------------------------------------
CREATE TABLE ISSUE (
      NO NUMBER NOT NULL
      , TITLE VARCHAR2(50) NOT NULL
      , CONTENT VARCHAR2(2000) NOT NULL
      , AUTHOR VARCHAR2(50) NOT NULL
      , REGDATE DATE DEFAULT SYSDATE NOT NULL
      , MODDATE DATE DEFAULT NULL
      , PRIMARY KEY(NO)
);
drop table issue;
----------------------------------------
---- 이슈 게시글 번호 SEQUENCE ---------
----------------------------------------
DROP SEQUENCE ISSUE_SEQ;
CREATE SEQUENCE ISSUE_SEQ
       INCREMENT BY 1
       START WITH 1
       MINVALUE 1
       MAXVALUE 999999
       NOCYCLE
       NOCACHE
       NOORDER;

----------------------------------------
---- 이슈 게시판 테스트 데이터 삽입 ----
----------------------------------------
INSERT INTO ISSUE (
    NO
    , TITLE
    , CONTENT
    , AUTHOR
    , REGDATE
)
VALUES (
    ISSUE_SEQ.NEXTVAL
    ,'테스트 제목입니다.'
    ,'테스트 내용'
    , (SELECT ID FROM MEMBER WHERE UPPER(ID) = UPPER('internalTest') AND PW = 'testpw1')
    , to_char(sysdate,'yyyy-mm-dd')
);

----------------------------------------
---- 이슈 게시판 글 보기(페이징) -------
----------------------------------------
SELECT
    ROWNUM as rnum
    , b.*
FROM (
        SELECT
            NO
            , TITLE
            , CONTENT
            , AUTHOR
            , TO_DATE(TO_CHAR(REGDATE,'yyyy-MM-DD HH24:MI:SS'), 'yyyy-MM-DD HH24:MI:SS') as REGDATE
            , TO_DATE(TO_CHAR(MODDATE,'yyyy-MM-DD HH24:MI:SS'), 'yyyy-MM-DD HH24:MI:SS') as MODDATE
        FROM ISSUE
        ORDER BY NO DESC) b
WHERE
    ROWNUM BETWEEN 1 AND 10;
    
----------------------------------------
---- 날짜 포멧 변경 --------------------
----------------------------------------
SELECT * 

FROM NLS_SESSION_PARAMETERS

WHERE PARAMETER IN ('NLS_LANGUAGE', 'NLS_DATE_FORMAT', 'NLS_DATE_LANGUAGE' ,'NLS_TIME_FORMAT', 'NLS_TIMESTAMP_FORMAT');

ALTER SESSION SET NLS_DATE_FORMAT='YYYY/MM/DD HH24:MI:SS';
ALTER SESSION SET NLS_TIME_FORMAT='HH24:MI:SSXFF';
ALTER SESSION SET NLS_TIMESTAMP_FORMAT='YYYY/MM/DD HH24:MI:SSXFF';

ALTER SESSION SET NLS_DATE_FORMAT='RR/MM/DD';
ALTER SESSION SET NLS_TIME_FORMAT='HH24:MI:SSXFF';
ALTER SESSION SET NLS_TIMESTAMP_FORMAT='RR/MM/DD HH24:MI:SSXFF';


SELECT
    count(*)
    --, NO
	--, TITLE
	--, CONTENT
	--, AUTHOR
	--, TO_CHAR(REGDATE,'yyyy-MM-DD HH24:MI:SS') as REGDATE
	--, TO_CHAR(MODDATE,'yyyy-MM-DD HH24:MI:SS') as MODDATE
FROM ISSUE
WHERE
    --REGDATE BETWEEN '2023-07-11' || ' 00:00:00' AND '2023-07-11' || ' 23:59:59'
    REGDATE BETWEEN '2023-07-11' AND '2023-07-11'
ORDER BY NO DESC;
COMMIT;

------------------------------------------------------------------
SELECT ISSUE_SEQ.NEXTVAL-1 FROM dual;
SELECT ISSUE_SEQ.CURRVAL-1 FROM dual;


SELECT * FROM nls_session_parameters WHERE PARAMETER LIKE '%DATE%' OR PARAMETER LIKE '%LANG%'; 


SELECT 
    COUNT(*)
FROM ISSUE
WHERE
    NO > 0
and regDate BETWEEN '2023-07-10' || '00:00:00' AND '2023-07-11' || '23:59:59';
--and regDate BETWEEN '2023-07-11 00:00:00' AND '2023-07-11 23:59:59' ;

SELECT 
    COUNT(*)
FROM ISSUE
WHERE
    NO > 0
and regDate BETWEEN TO_DATE('2023-07-10 00:00:00','YYYY-MM-DD HH24:MI:SS') AND TO_DATE('2023-07-11 23:59:59', 'YYYY-MM-DD HH24:MI:SS');

SELECT 
    COUNT(*)
FROM ISSUE
WHERE
    NO > 0
and regDate BETWEEN TO_DATE('2023-07-10 00:00:00','YYYY-MM-DD HH24:MI:SS') AND TO_DATE('2023-07-11 23:59:59', 'YYYY-MM-DD HH24:MI:SS');


SELECT COUNT(NO) FROM ISSUE WHERE
    NO > 0 and regDate between TO_CHAR(regDate,'2023-07-11 HH24:MI:SS') and TO_CHAR(regDate,'2023-07-11 HH24:MI:SS');
------------------------------------------------------------------


SELECT ROWNUM , a.* FROM ( SELECT ROWNUM rnum , b.* FROM ( SELECT * FROM ISSUE ORDER BY NO DESC) b) a WHERE rnum BETWEEN 1 AND 10 AND UPPER(title) LIKE UPPER('%tt%');

SELECT COUNT(NO) FROM ISSUE WHERE NO > 0 AND REGDATE BETWEEN TO_DATE('2023-07-10', 'YYYY/MM/DD') AND TO_DATE('2023-07-10', 'YYYY/MM/DD');

SELECT * FROM ISSUE WHERE NO > 0 AND REGDATE BETWEEN TO_DATE('2023-07-06', 'YYYY/MM/DD') AND TO_DATE('2023-07-06', 'YYYY/MM/DD');


SELECT * FROM ISSUE order by no desc;
COMMIT;

