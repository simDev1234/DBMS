-- 고객 테이블에서 서울에 사는 사람만 조회 
SELECT * FROM gogek;
SELECT * FROM gogek WHERE goaddr LIKE '서울%';

-- 고객 테이블에서 서울만 떼오기
SELECT
  goname,
  SUBSTR(goaddr,1,2) AS "사는 도시"
  FROM gogek;

SELECT * FROM gogek
  WHERE SUBSTR(goaddr,1,2) = '서울';
  
-- 고객 테이블에서 여자 고객만 추출(함수식 이용)
-- 함수식을 여러개를 쓸 수록 성능이 저하된다. (속도 감소) / 가능한 적게 쓰는게 좋다.
SELECT * FROM gogek
  WHERE SUBSTR(gojumin,8,1) in ('0','2','4','6','8');
  
SELECT * FROM gogek
  WHERE TO_NUMBER(SUBSTR(gojumin,8,1)) in (0, 2, 4, 6, 8);
  
SELECT * FROM gogek
  WHERE MOD(TO_NUMBER(SUBSTR(gojumin,8,1)),2) = 0;