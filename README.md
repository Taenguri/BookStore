# BookStore
온라인 서점 프로젝트<br>
프로젝트 이름 : BookStore<br>
개발 인원 :  4명<br>
개발 기간 :  2022.01.20 ~ 20.02.10<br>
주요 기능  
  -  회원가입 및 로그인<br>
  -  카테고리별 책 분류		<br>
  -  책 상세보기 및 리뷰작성<br>
  -  장바구니 및 구매<br>
  -  중고장터<br>
개발 환경  :  Spring framework, Java,, HTML5,CSS3, Jquery, oracle, Maven tool, bootstrap<br>
<br>
간단 소개  :  포트폴리오에는 제가 직접 구현한 부분을 기재하였습니다.<br>
	제가 직접 구현한 부분 입니다.<br>
	              - 메인페이지 디자인<br>
  - 카테고리별 책분류<br>
  - 알라딘 API활용하여 책정보 가져오기<br>
  - 중고장터(CRUD)<br>
  - 페이징 및 검색기능<hr>

### 요구사항 분석

- 카테고리 분류 및 리스트
   
   - 비회원 이용가능
   - 카테고리 번호가 10000이상 20000이하이면 국내도서
   - 카테고리 번호가 20000이상 30000이하이면 외국도서
   - 신규도서는 전체 책리스트를 가져와 2주이내 혹은 출판예정인 책들로 구현
   - 베스트셀러는 잘 팔린 책들을 구분하기위해 임의의 일반 책들과 구분

- 검색기능
   -  비회원은 중고책 검색기능 이용 불가능
   -  검색기능은 일반책들검색과 중고책검색으로 구분지음
   -  출판사, 책제목, 지은이로 검색가능
   -  상세 페이지 이동시 검색기록 유지

- 페이징기능

   -  상세 페이지 이동시 페이징기록 유지
   -  한 페이지당 보여줄 책 개수는 10개
   -  한 페이지당 보여줄 페이징 넘버는 10개 ex( 이전 1 2 3 ..... 10 다음 )


- 중고장터
   -  중고장터의 모든 기능은 로그인한 사용자만 이용할 수 있음

   -  중고책 등록
        1. Null 값이 들어가지않게 유효성 체크 
        2. 상품 재고, 상품 가격란에는 숫자만 입력가능
        3. 상품등록시 해당 사용자 이름으로 상품 등록됨

   -  중고책 수정
        1. 수정은 책을 등록한 본인만 가능
        2. Null 값이 들어가지않게 유효성 체크 
        3. 상품 재고, 상품 가격란에는 숫자만 입력가능

   -  중고책 삭제
        1.  삭제는 책을 등록한 본인만 가능

   -  중고책 댓글
        1. 댓글 작성시 공백
        2. 작성자 본인만 수정가능
        3. 댓글 작성 및 수정시 공백이 있으면 안됨
        4. 작성자 본인만 삭제가능<hr>

### DB설계

![image](https://user-images.githubusercontent.com/100080583/156285164-ba0479f7-2e7b-4004-afcd-a35510bf56d7.png)<hr>

### 기술상세

### 알라딘 OPEN API 이용
![image](https://user-images.githubusercontent.com/100080583/156285230-30e6c050-d8e7-4a95-83d8-35c93769515f.png)<br>
알라딘 카테고리 엑셀파일에서 필요한 카테고리번호를 조사합니다.<hr>

![image](https://user-images.githubusercontent.com/100080583/156285288-d6af8a63-0d90-49d0-950e-11dafebe4b1b.png)<br>
알라딘 Open API를 사용하기 위해 TTB Key 를 발급받은후
Json 으로 이루어진 책 관련 정보를 가져온뒤, DB에 데이터 삽입을 했습니다.<hr>

### 카테고리별 책분류
![image](https://user-images.githubusercontent.com/100080583/156285323-6308beea-a9c4-43eb-8f52-b06749db6a94.png)<br>
Tier 1 = 1차분류
Tier 2 = 2차분류
Tier 3 = 3차분류<br>

![image](https://user-images.githubusercontent.com/100080583/156285343-56a67d9b-8bee-4bc6-9c87-e7ddde969756.png)<br>
외래키를 통한 카테고리 번호 참조<hr>


![image](https://user-images.githubusercontent.com/100080583/156285410-4fff6521-e072-4620-aebd-c4dbc41d3963.png)<br>
카테고리를 누르면 (ex : 국내도서,경영일반, ....)
파라미터로 Tier ( t ) 와 카테고리번호 ( c ) 를 읽어옵니다.<hr>
   
![image](https://user-images.githubusercontent.com/100080583/156285452-d49ca40e-9a83-47fd-a747-50f4d68e0a67.png)<br>
BookService에서
읽어온 카테고리 번호를 토대로
책 분류를 합니다.<hr>

![image](https://user-images.githubusercontent.com/100080583/156285474-cbb0ade2-96f5-4aac-9af2-3b727d9c0d79.png)<br>
listMapper 에서
카테고리번호에 따라서
분류한뒤, DB에 전송합니다.<hr>

### 국내도서

![image](https://user-images.githubusercontent.com/100080583/156285504-0f849904-7d20-4729-91f3-dca826d64f53.png)<br>
![image](https://user-images.githubusercontent.com/100080583/156285513-69d4de63-9ae0-4cdc-af2c-d5efc971cf5c.png)<br>
카테고리번호가
10000 이상 20000 이하는 국내도서로 분류합니다<hr>

### 외국도서

![image](https://user-images.githubusercontent.com/100080583/156285529-7e6bf218-6ed9-4dff-9b57-373716ac8e4e.png)<br>
![image](https://user-images.githubusercontent.com/100080583/156285537-e328357a-be79-4bb2-9e84-2c50df16dc07.png)<br>
카테고리번호가
20000 이상 30000 이하면 외국도서로 분류합니다.<hr>



















