
CREATE TABLE EZ_FILE (
        fileno NUMBER NOT NULL
        , no NUMBER NOT NULL
        , originalname VARCHAR2(255) NOT NULL
        , savename VARCHAR2(40) NOT NULL
        , filesize number NOT NULL
        , REGDATE DATE DEFAULT SYSDATE NOT NULL
        , MODDATE DATE DEFAULT NULL
        , PRIMARY KEY(fileno)
);

----------------------------------------
---- FOREIGN KEY 연결 ------------------
----------------------------------------
ALTER TABLE EZ_FILE
    ADD CONSTRAINT EZ_FILE_NO foreign key(NO)
    REFERENCES ISSUE(NO);
    
----------------------------------------
---- 파일 번호 SEQUENCE ----------------
----------------------------------------
CREATE SEQUENCE EZ_FILE_NO_SEQ
       INCREMENT BY 1
       START WITH 1
       MINVALUE 1
       MAXVALUE 999999
       NOCYCLE
       NOCACHE
       NOORDER;
       