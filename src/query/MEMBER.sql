----------------------------------------
---- 회원 테이블 -----------------------
----------------------------------------
CREATE TABLE MEMBER (
      CODE VARCHAR2(8) NOT NULL
      , DEPARTMENT VARCHAR2(50) NOT NULL
      , ID VARCHAR(50) NOT NULL
      , NAME VARCHAR2(50) NOT NULL
      , PHONE VARCHAR2(13) NOT NULL
      , EMAIL VARCHAR2(50)
      , PW VARCHAR2(50) NOT NULL
      , REPW VARCHAR2(50) NOT NULL
      , PRIMARY KEY(ID)
);

----------------------------------------
---- 내부인 테스트 회원 데이터 삽입 ----
----------------------------------------
INSERT INTO MEMBER (
    CODE
    , DEPARTMENT
    , ID
    , NAME
    , PHONE
    , EMAIL
    , PW
    , REPW 
)
VALUES (
    'INTERNAL'
    ,'이젠아카데미'
    ,'internalTest'
    ,'내부인테스트회원1'
    ,'01030299233'
    ,'internaltest1@naver.com'
    ,'testpw1'
    ,'testpw1'
);

----------------------------------------
---- 외부인 테스트 회원 데이터 삽입 ----
----------------------------------------

INSERT INTO MEMBER (
    CODE
    , DEPARTMENT
    , ID
    , NAME
    , PHONE
    , EMAIL
    , PW
    , REPW 
)
VALUES (
    'EXTERNAL'
    ,'위즈코어'
    ,'externalTest'
    ,'외부인테스트회원1'
    ,'01022224444'
    ,'externaltest1@naver.com'
    ,'testpw2'
    ,'testpw2'
);


SELECT
	CODE
	, DEPARTMENT
	, ID
	, NAME
    , REGEXP_REPLACE(PHONE, '(02|.{3})(.+)(.{4})', '\1-\2-\3')
	, EMAIL
	, PW
	, REPW
FROM MEMBER;

commit;