--http://www.gurubee.net/lecture/1024

select * from sawon
  where to_number(to_char(sahire,'MM')) / 3 = 1  <<-- 소수점. 자동버림. 3월만

select * from sawon
  where floor(to_number(to_char(sahire,'MM'))) / 3 = 1  <<--버림