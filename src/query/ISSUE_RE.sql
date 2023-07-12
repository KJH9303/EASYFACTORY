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
       
commit;
       
       
       
       
       
       