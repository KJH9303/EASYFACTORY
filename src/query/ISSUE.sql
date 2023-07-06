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

----------------------------------------
------ 이슈 게시글 번호 SEQUENCE -------
----------------------------------------
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
----- 이슈 게시판 테스트 (페이징) ------
----------------------------------------
SELECT 
    rownum
    , a.*
FROM (
    SELECT
        rownum rnum
        , b.*
    FROM (
        SELECT
            *
        FROM issue
    ORDER BY no desc) b) a
WHERE
    rnum BETWEEN 1 AND 10;









SELECT * FROM ISSUE;
COMMIT;