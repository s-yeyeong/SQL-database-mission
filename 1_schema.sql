-- 1. 고객 테이블 생성 (customer)
CREATE TABLE customer (
    id INTEGER PRIMARY KEY AUTOINCREMENT,   -- 고객 고유 번호 (자동 증가)
    name TEXT NOT NULL,                     -- 이름 (비어있으면 안 됨)
    phone TEXT UNIQUE NOT NULL              -- 전화번호 (중복 불가능, 비어있으면 안 됨)
);

-- 2. 메뉴 테이블 생성 (menu)
CREATE TABLE menu (
    id INTEGER PRIMARY KEY AUTOINCREMENT,   -- 메뉴 고유 번호
    name TEXT UNIQUE NOT NULL,              -- 메뉴 이름 (중복 불가능)
    price INTEGER NOT NULL                  -- 가격
);

-- 3. 주문 테이블 생성 (orders)
CREATE TABLE orders (
    id INTEGER PRIMARY KEY AUTOINCREMENT,   -- 주문 고유 번호
    customer_id INTEGER NOT NULL,           -- 어떤 고객이 주문했는지 (외래키)
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP, -- 주문 시간
    FOREIGN KEY (customer_id) REFERENCES customer(id) -- customer 테이블의 id와 연결
);

-- 4. 주문 상세 테이블 생성 (order_detail)
CREATE TABLE order_detail (
    id INTEGER PRIMARY KEY AUTOINCREMENT,   -- 상세 고유 번호
    order_id INTEGER NOT NULL,              -- 어떤 주문에 속해있는지 (외래키)
    menu_id INTEGER NOT NULL,               -- 어떤 메뉴를 시켰는지 (외래키)
    quantity INTEGER NOT NULL,              -- 수량
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (menu_id) REFERENCES menu(id)
);