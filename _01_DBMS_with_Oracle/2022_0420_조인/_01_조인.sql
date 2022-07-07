create table sawon
(
   sabun number(3),
   saname varchar2(30),
   sasex  varchar2(10),
   deptno  number(3),     -- 부서번호
   sajob   varchar2(10),  -- 직급
   sahire  date,
   samgr  number(3),  -- 사수매니저 번호
   sapay   number(8), -- 연봉
   
   constraint pk_sawon_sabun primary key(sabun)
)
/

-- 외래 키 설정
ALTER TALBE sawon
  ADD CONSTRAINT fk_sawon_deptno FOREIGN KEY(deptno)
                                 REFERENCES dept(deptno);
                                 
                                 -- on delete cascade(cascade : 종속/ 부모키가 삭제되면 참조하는 FK 소유하는 레코드도 삭제해라.)
                                 
SELECT TABLE sawon
  ADD CONSTRAINT fk_sawon_samgr FOREIGN KEY(samgr)
                                REFERENCES sawon(sabun);
                                

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

ALTER TABLE gogek 
  ADD CONSTRAINT fk_gogek_godam FOREIGN KEY(godam) 
                                REFERENCES sawon(sabun);
                                
                                
                                