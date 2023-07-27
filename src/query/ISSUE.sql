DROP TABLE ISSUE;
DROP SEQUENCE ISSUE_SEQ;
----------------------------------------
---- 이슈 게시판 테이블 ----------------
----------------------------------------
CREATE TABLE ISSUE (
      NO NUMBER NOT NULL
      , PROCESS VARCHAR2(20) NOT NULL
      , NOTICEYN VARCHAR2(2) NOT NULL
      , TITLE VARCHAR2(50) NOT NULL
      , CONTENT VARCHAR2(2000) NOT NULL
      , AUTHOR VARCHAR2(50) NOT NULL
      , REGDATE DATE DEFAULT SYSDATE NOT NULL
      , MODDATE DATE DEFAULT NULL
      , VIEWCNT NUMBER DEFAULT 0
      , PRIMARY KEY(NO)
);

select * from issue;
select * from ez_file;


----------------------------------------
---- 이슈 게시글 번호 SEQUENCE ---------
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
    , PROCESS
    , NOTICEYN
    , TITLE
    , CONTENT
    , AUTHOR
    , REGDATE
)
VALUES (
    ISSUE_SEQ.NEXTVAL
    , 'Fabrication'
    , 'N'
    ,'테스트 제목입니다.'
    ,'테스트 내용'
    , (SELECT ID FROM MEMBER WHERE UPPER(ID) = UPPER('TEST') AND PW = 'test')
    , to_char(sysdate,'yyyy-mm-dd')
);

----------------------------------------
---- 이슈 게시판 글 보기(페이징) -------
----------------------------------------
"SELECT "
				+ "			ROWNUM"
				+ "			, a.*"
				+ "		FROM ("
				+ "			SELECT"
				+ "			ROWNUM rnum"
				+ "			, b.*"
				+ "		FROM ("
				+ "				SELECT"
				+ "					NO"
				+ "					, PROCESS"
				+ "					, NOTICEYN"
				+ "					, TITLE"
				+ "					, CONTENT"
				+ "					, AUTHOR"
				+ "					, TO_CHAR(REGDATE,'yyyy-MM-DD HH24:MI:SS') as regDate"
				+ "					, TO_CHAR(MODDATE,'yyyy-MM-DD HH24:MI:SS') as modDate"
				+ "					, VIEWCNT"
				+ "				FROM ISSUE"
				+ "		ORDER BY NOTICEYN DESC, NO DESC) b) a"
				+ "		WHERE"
				+ "			rnum BETWEEN ? AND ?";
    
----------------------------------------
---- 작성일 범위로 게시물 COUNT --------
----------------------------------------
SELECT 
    COUNT(*)
FROM ISSUE
WHERE
    NO > 0
and regDate BETWEEN TO_DATE('2023-07-10 00:00:00','YYYY-MM-DD HH24:MI:SS') AND TO_DATE('2023-07-11 23:59:59', 'YYYY-MM-DD HH24:MI:SS');


------------------------------------------------------------------


SELECT
    a.fileno,
    a.no,
    a.originalname,
    a.savename,
    a.filesize,
    b.TITLE,
    b.CONTENT,
    b.AUTHOR,
    b.REGDATE
FROM
    ez_file a
INNER JOIN
    issue b ON a.no = b.no
ORDER BY
    b.no DESC;

delete from issue where no > 19;
commit;
