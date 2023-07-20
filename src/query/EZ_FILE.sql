drop table ez_file;
DROP SEQUENCE EZ_FILE_NO_SEQ;
CREATE TABLE EZ_FILE (
        fileno NUMBER NOT NULL
        , no NUMBER NOT NULL
        , originalname VARCHAR2(255) NOT NULL
        , savename VARCHAR2(40) NOT NULL
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
commit;
    
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
       
COMMIT;
drop SEQUENCE EZ_FILE_NO_SEQ;

SELECT
							FILENO
							, NO
							, ORIGINALNAME
							, SAVENAME
							, FILESIZE
                            , REGDATE
                            , MODDATE
							--, TO_DATE(TO_CHAR(REGDATE,'yyyy-MM-DD HH24:MI:SS'), 'yyyy-MM-DD HH24:MI:SS') as REGDATE
							--, TO_DATE(TO_CHAR(MODDATE,'yyyy-MM-DD HH24:MI:SS'), 'yyyy-MM-DD HH24:MI:SS') as MODDATE
					  FROM
							EZ_FILE
					  WHERE
							NO = 40;
                
                
SELECT COUNT(NO) FROM EZ_FILE WHERE NO >0 AND FILENO > 0;
select * from ez_file;
SELECT COUNT(NO) FROM EZ_FILE WHERE NO = 40 AND FILENO > 0;
delete from ez_file where fileno > 0;
drop table ez_file;
commit;
       