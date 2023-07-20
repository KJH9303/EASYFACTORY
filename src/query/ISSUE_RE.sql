DROP TABLE ISSUE_RE;
DROP SEQUENCE ISSUE_RE_SEQ;
----------------------------------------
---- 이슈 게시판 테이블 ----------------
----------------------------------------
CREATE TABLE ISSUE_RE (
        NO NUMBER NOT NULL
        , ReNO NUMBER NOT NULL
        , CONTENT VARCHAR2(2000) NOT NULL
        , AUTHOR VARCHAR2(50) NOT NULL
        , REGDATE DATE DEFAULT SYSDATE NOT NULL
        , MODDATE DATE DEFAULT NULL
        , PRIMARY KEY(NO, ReNO)
);

----------------------------------------
---- FOREIGN KEY 연결 ------------------
----------------------------------------
ALTER TABLE ISSUE_RE
    ADD CONSTRAINT ISSUE_RE_NO foreign key(NO)
    REFERENCES ISSUE(NO);

----------------------------------------
---- FOREIGN KEY 연결 해제--------------
----------------------------------------
ALTER TABLE ISSUE_RE
DROP CONSTRAINT ISSUE_RE_NO;

----------------------------------------
---- 이슈 게시글 댓글 번호 SEQUENCE ----
----------------------------------------
CREATE SEQUENCE ISSUE_RE_SEQ
       INCREMENT BY 1
       START WITH 1
       MINVALUE 1
       MAXVALUE 999999
       NOCYCLE
       NOCACHE
       NOORDER;
       
----------------------------------------
---- 이슈 게시판 댓글 작성 테스트 ------
----------------------------------------
INSERT INTO ISSUE_RE (
    NO
    , RENO
    , CONTENT
    , AUTHOR
    , REGDATE
)
VALUES (
    1
    , ISSUE_RE_SEQ.NEXTVAL
    , '테스트 댓글입니다.'
    , 'test'
    , sysdate
);


-------------------------------------------------------
drop table issue_re;
drop sequence ISSUE_RE_SEQ;

select * from issue_re order by reno desc;

delete from issue_re where reno < 8;
       
commit;      
       
       
       
       