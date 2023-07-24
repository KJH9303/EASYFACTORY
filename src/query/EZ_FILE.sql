DROP table ez_file;
DROP SEQUENCE EZ_FILE_NO_SEQ;
CREATE TABLE EZ_FILE (
        fileno NUMBER NOT NULL
        , no NUMBER NOT NULL
        , originalname VARCHAR2(255) NOT NULL
        , savename VARCHAR2(255) NOT NULL
        , filesize number NOT NULL
        , PRIMARY KEY(fileno)
);

----------------------------------------
---- FOREIGN KEY 연결 ------------------
----------------------------------------
ALTER TABLE EZ_FILE
    ADD CONSTRAINT EZ_FILE_NO foreign key(NO)
    REFERENCES ISSUE(NO);
    
----------------------------------------
---- FOREIGN KEY 연결 해제--------------
----------------------------------------
ALTER TABLE EZ_FILE
DROP CONSTRAINT EZ_FILE_NO;
    
----------------------------------------
---- 파일 번호 SEQUENCE ----------------
----------------------------------------
DROP SEQUENCE EZ_FILE_NO_SEQ;
CREATE SEQUENCE EZ_FILE_NO_SEQ
       INCREMENT BY 1
       START WITH 1
       MINVALUE 1
       MAXVALUE 999999
       NOCYCLE
       NOCACHE
       NOORDER;
       
COMMIT;

----------------------------------------
---- 게시물 번호에 해당하는 파일 목록 --
----------------------------------------
SELECT
	FILENO
	, NO
	, ORIGINALNAME
	, SAVENAME
	, FILESIZE
FROM
	EZ_FILE
WHERE
	NO = 40;
       