CREATE TABLE feb1 (
    opratio      NUMBER(4,2),
    temp         NUMBER(3),   
    tr           NUMBER(6),
    fal          NUMBER(4),
    stock        NUMBER(6),
    costs        NUMBER(6),
    usingratio   NUMBER(4,2),
    hiredate     NUMBER(10)
);
commit;
drop table feb1;
select * from feb1;