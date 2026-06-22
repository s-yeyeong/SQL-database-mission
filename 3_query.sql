-- [기본 조회]
-- 1. 모든 고객 정보 조회
SELECT * FROM customer;

-- 2. 가격이 5,500원 이상인 고급 메뉴 검색 (내림차순)
SELECT * FROM menu WHERE price >= 5500 ORDER BY price DESC;

-- 3. 전화번호가 '1111'로 끝나는 고객 찾기
SELECT * FROM customer WHERE phone LIKE '%1111';

-- 4. 가장 비싼 메뉴 TOP 3 추출
SELECT * FROM menu ORDER BY price DESC LIMIT 3;

-- [조인 (JOIN)]
-- 5. 모든 주문 내역과 주문한 고객 이름 확인
SELECT o.id AS 주문번호, c.name AS 고객명, o.order_date AS 주문시간 
FROM orders o
INNER JOIN customer c ON o.customer_id = c.id;

-- 6. 영수증 상세 내역 뽑기 (메뉴명, 수량, 단가)
SELECT od.order_id AS 주문번호, m.name AS 메뉴명, od.quantity AS 수량, m.price AS 단가
FROM order_detail od
INNER JOIN menu m ON od.menu_id = m.id;

-- 7. 전체 메뉴의 주문 횟수 확인 (주문 안 된 메뉴도 포함)
SELECT m.name AS 메뉴명, od.quantity AS 판매수량
FROM menu m
LEFT JOIN order_detail od ON m.id = od.menu_id;

-- 8. 고객별 총 주문 횟수 확인
SELECT c.name AS 고객명, COUNT(o.id) AS 주문횟수
FROM customer c
LEFT JOIN orders o ON c.id = o.customer_id
GROUP BY c.name;

-- [집계 및 그룹화]
-- 9. 카페 총 메뉴 개수와 평균 메뉴 가격
SELECT COUNT(*) AS 총메뉴수, AVG(price) AS 평균가격 FROM menu;

-- 10. 메뉴별 총 판매 수량 집계 (인기 메뉴 순)
SELECT m.name AS 메뉴명, SUM(od.quantity) AS 총판매수량
FROM order_detail od
INNER JOIN menu m ON od.menu_id = m.id
GROUP BY m.name
ORDER BY 총판매수량 DESC;

-- 11. 한 번에 2잔 이상 시킨 주문 내역 필터링
SELECT order_id AS 주문번호, SUM(quantity) AS 총수량
FROM order_detail
GROUP BY order_id
HAVING 총수량 >= 2;

-- [서브쿼리]
-- 12. 우리 카페에서 가장 비싼 메뉴를 주문한 상세 기록 찾기
SELECT * FROM order_detail 
WHERE menu_id = (SELECT id FROM menu ORDER BY price DESC LIMIT 1);

-- [데이터 수정 및 삭제]
-- 13. 아메리카노 가격 인상 (4500 -> 4800)
UPDATE menu SET price = 4800 WHERE name = '아메리카노';

-- 14. 아직 주문 기록이 없는 유령 회원 삭제
DELETE FROM customer 
WHERE id NOT IN (SELECT DISTINCT customer_id FROM orders);

-- [성능 최적화]
-- 15. 고객 전화번호 검색 속도를 높이기 위한 인덱스 추가
CREATE INDEX idx_customer_phone ON customer(phone);