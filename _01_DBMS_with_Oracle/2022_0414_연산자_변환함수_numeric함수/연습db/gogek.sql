-- gobun : 고객 담당 사원 번호
create table gogek
(
    gobun number(3),             
    goname varchar2(30),
    goaddr varchar2(30),
    gojumin  varchar2(14),
    godam  number(3),
    
    constraint pk_gogek_gobun primary key(gobun)
)
/