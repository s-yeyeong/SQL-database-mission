# ☕ 카페 주문 관리 시스템 (SQL 데이터베이스 모델링 실습)

## 📌 프로젝트 소개
이 프로젝트는 백엔드 프레임워크(ORM) 없이 순수 SQL만을 사용하여 데이터베이스를 설계하고, 데이터를 조작하는 과정을 실습한 결과물입니다. 
관계형 데이터베이스의 핵심인 **테이블 간의 관계(1:N)**를 이해하고, 실무에서 자주 사용되는 SQL 쿼리(JOIN, GROUP BY, 서브쿼리 등)를 작성하여 요구사항을 해결하는 것을 목표로 했습니다.

## 🛠️ 사용 기술 및 환경
* **Database:** SQLite
* **Tool:** SQLite Online (Web IDE)
* **Language:** SQL

## 🗂️ 데이터베이스 설계 (Schema)
총 4개의 테이블을 설계하였으며, 제약조건(PK, FK, NOT NULL, UNIQUE)을 적용하여 데이터의 무결성을 보장했습니다.

1. **`customer` (고객):** 카페 회원 정보 관리 (1)
2. **`orders` (주문):** 고객의 전체 주문 내역 관리 (N)
3. **`menu` (메뉴):** 카페 판매 음료 정보 관리 (1)
4. **`order_detail` (주문 상세):** 각 주문에 포함된 상세 메뉴와 수량 관리 (N)

> **관계 (1:N)**
> * 한 명의 고객(`customer`)은 여러 번의 주문(`orders`)을 할 수 있습니다.
> * 한 번의 주문(`orders`)은 여러 개의 메뉴(`order_detail`)를 포함할 수 있습니다.

---

## 🚀 쿼리 실행 결과 (15 Core Queries)

### A. 기본 조회
**1. 모든 고객 정보 조회**
*설명: 등록된 모든 고객의 이름과 전화번호를 확인합니다.*
<img width="672" height="719" alt="image" src="https://github.com/user-attachments/assets/cbc6c7d7-dc43-4643-b0be-17e7b27524f4" />

**2. 가격이 5,500원 이상인 고급 메뉴 검색**
*설명: 5,500원 이상인 메뉴를 가격이 비싼 순서대로 정렬하여 출력합니다.*
<img width="665" height="620" alt="image" src="https://github.com/user-attachments/assets/337a03e9-a02d-460a-a0e4-63a3bf4adf13" />

**3. 전화번호가 '1111'로 끝나는 고객 찾기**
*설명: 특정 전화번호 뒷자리를 가진 고객을 검색합니다.*
<img width="655" height="437" alt="image" src="https://github.com/user-attachments/assets/e401abc9-2552-4920-8001-c462ed83c4a4" />


**4. 가장 비싼 메뉴 TOP 3 추출**
*설명: 메뉴 중 가격이 가장 높은 상위 3개 메뉴만 뽑아냅니다.*
<img width="669" height="518" alt="image" src="https://github.com/user-attachments/assets/3ee1acde-99ba-4026-8ce0-040c2405292a" />


### B. 조인 (JOIN)
**5. 모든 주문 내역과 주문한 고객 이름 확인**
*설명: 어떤 주문을 어떤 고객이 했는지 연결해서 보여줍니다.*
<img width="682" height="734" alt="image" src="https://github.com/user-attachments/assets/c1b5c93e-b9b0-420c-8989-1dd84ae40e80" />


**6. 영수증 상세 내역 뽑기**
*설명: 주문번호별로 어떤 메뉴를 몇 개 시켰는지 메뉴 이름까지 합쳐서 보여줍니다.*
<img width="685" height="869" alt="image" src="https://github.com/user-attachments/assets/2fd24e4b-860a-4b88-8261-ad9c2a3474cd" />


**7. 전체 메뉴의 주문 횟수 확인 (주문 안 된 메뉴 포함)**
*설명: 인기 메뉴와 함께, 아직 한 번도 팔리지 않은 메뉴까지 모두 확인합니다.*

<img width="677" height="861" alt="image" src="https://github.com/user-attachments/assets/063668cc-6db3-45ed-a19f-3ded94772790" />


**8. 고객별 총 주문 횟수 확인**
*설명: 회원별로 우리 카페를 몇 번 방문(주문)했는지 집계합니다.*
<img width="669" height="751" alt="image" src="https://github.com/user-attachments/assets/301664b0-555c-405d-b960-59884d89f929" />


### C. 집계 및 그룹화
**9. 카페 총 메뉴 개수와 평균 메뉴 가격**
*설명: 메뉴판에 등록된 전체 메뉴 개수와 평균 가격을 구합니다.*
<img width="666" height="513" alt="image" src="https://github.com/user-attachments/assets/8592c9af-58e4-484d-bb4d-2b74edf3b794" />


**10. 메뉴별 총 판매 수량 집계 (인기 메뉴 순)**
*설명: 어떤 음료가 가장 많이 팔렸는지 수량 기준으로 정렬합니다.*
<img width="675" height="773" alt="image" src="https://github.com/user-attachments/assets/899ac40f-c733-48be-909d-ccdafeb3e257" />


**11. 한 번에 2잔 이상 시킨 주문 내역 필터링**
*설명: 주문 상세 내역 중 수량이 2잔 이상인 행들만 그룹화하여 봅니다.*
<img width="674" height="698" alt="image" src="https://github.com/user-attachments/assets/8453acaa-33c9-45a9-9bc4-c022901e591f" />


### D. 서브쿼리
**12. 우리 카페에서 가장 비싼 메뉴를 주문한 상세 기록 찾기**
*설명: 서브쿼리로 가장 높은가격을 찾고, 그 가격에 해당하는 메뉴의 주문상세를 뽑습니다.*
<img width="670" height="462" alt="image" src="https://github.com/user-attachments/assets/546f1e84-5afe-4dd1-8dc0-e25e8e69540e" />


### E. 데이터 수정 및 삭제
**13. 아메리카노 가격 인상 (4500 -> 4800)**
*설명: 물가 상승으로 인해 아메리카노의 가격을 수정합니다.*
<img width="662" height="430" alt="image" src="https://github.com/user-attachments/assets/5573684f-e2c7-452b-9ab7-ea17555a1565" />


**14. 아직 주문 기록이 없는 유령 회원 삭제**
*설명: 가입만 하고 주문을 한 번도 안 한 고객을 데이터베이스에서 지웁니다.*
<img width="671" height="668" alt="image" src="https://github.com/user-attachments/assets/c0310a87-bcb2-4031-ac33-18a2ced33fa9" />


### F. 성능 최적화
**15. 고객 전화번호 검색 속도를 높이기 위한 인덱스 추가**
*설명: 회원 조회 시 가장 자주 쓰이는 phone 컬럼에 인덱스를 부여하여 검색 속도를 성능을 향상시킵니다.*
<img width="925" height="697" alt="image" src="https://github.com/user-attachments/assets/cd857976-a5af-4364-a8c5-d01c16cc69c5" />

