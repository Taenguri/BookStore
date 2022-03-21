# BookStore <br>
### 온라인 서점 프로젝트<hr>
### 기획의도
포트폴리오의 주제는 “ 책 쇼핑몰 “ 이고,<br>
교보문고, 알라딘 사이트를 롤모델로 만들었습니다.<br>
팀원들과 프로젝트 주제에 대하여 대화를 나눈 결과<br>
학원에서 자바 웹 개발자 과정을 통해 배운 내용을 토대로<br>
배웠던 모든 내용을 사용해 볼 수 있는 소재라 생각했습니다.<hr>



### 개요
프로젝트 이름 : BookStore<br>
개발 인원 :  4명<br>
개발 기간 :  2022.01.20 ~ 2022.02.10<br>
주요 기능  
  -  회원가입 및 로그인<br>
  -  카테고리별 책 분류		<br>
  -  책 상세보기 및 리뷰작성<br>
  -  장바구니 및 구매<br>
  -  중고장터<br>


개발 환경  :  Spring Legacy, Java 1.8, HTML5,CSS3, Jquery, oracle, Maven, bootstrap, Jsp, Mybatis<br>
<br>
간단 소개  :  포트폴리오에는 제가 ***직접 구현***한 부분을 기재하였습니다.<br>
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
        4. 작성자 본인만 삭제가
  
  
 <hr>
 
 
### UI설계


![image](https://user-images.githubusercontent.com/100080583/156969202-2e854da6-18c8-4193-be0d-76dde33078ff.png)<hr>

### DB설계

![image](https://user-images.githubusercontent.com/100080583/156285164-ba0479f7-2e7b-4004-afcd-a35510bf56d7.png)<hr>

### Book 테이블 (책)
![image](https://user-images.githubusercontent.com/100080583/156969237-94dc33bd-2e8e-40ef-86ce-116a391a5505.png)<hr>

### Book_Purchase 테이블(구매내역)
![image](https://user-images.githubusercontent.com/100080583/156969247-9612a025-807f-448e-916f-d7e1a6e96a6a.png)<hr>

### Book_USER 테이블(사용자)
![image](https://user-images.githubusercontent.com/100080583/156969259-d9dfab02-cb21-4c12-a757-c73fdc20e92b.png)<hr>

### Category 테이블(카테고리)
![image](https://user-images.githubusercontent.com/100080583/156969274-cba68b37-25cc-47d3-bafa-0924b6ddcc6e.png)<hr>

### Delivery 테이블(배송)
![image](https://user-images.githubusercontent.com/100080583/156969287-336afcda-b078-4428-923d-b4f498d408e1.png)<hr>

### JungoBook 테이블(중고책)
![image](https://user-images.githubusercontent.com/100080583/156969311-9cf110c6-a8f8-4d30-aedc-4d5c7be30829.png)<hr>

### JungoReply 테이블(중고책 댓글)
![image](https://user-images.githubusercontent.com/100080583/156969329-365203ac-217b-4da7-baf1-64f246b0ba82.png)<hr>

### Review 테이블(책 리뷰)
![image](https://user-images.githubusercontent.com/100080583/156969343-288e62ac-1658-4b7a-a981-1e19c9c8ca15.png)<hr>

### Shopping_Cart 테이블(장바구니)
![image](https://user-images.githubusercontent.com/100080583/156969353-76ab0171-9040-45a0-b05e-3af6b72d1303.png)<hr>










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

![image](https://user-images.githubusercontent.com/100080583/156970956-d25268fa-0afb-403c-bec3-45306758c07d.png)<br>
listMapper 에서
카테고리번호에 따라서
분류한뒤, DB에 전송합니다.<hr>

### 국내도서

![image](https://user-images.githubusercontent.com/100080583/156285504-0f849904-7d20-4729-91f3-dca826d64f53.png)<br>
![image](https://user-images.githubusercontent.com/100080583/156971022-58d6b4b9-4ce7-4e5d-9bec-dfeacc3ce918.png)<br>
카테고리번호가
10000 이상 20000 이하는 국내도서로 분류합니다<hr>

### 외국도서

![image](https://user-images.githubusercontent.com/100080583/156285529-7e6bf218-6ed9-4dff-9b57-373716ac8e4e.png)<br>
![image](https://user-images.githubusercontent.com/100080583/156971111-e56f3266-6316-48d4-81aa-808cf356511a.png)<br>
카테고리번호가
20000 이상 30000 이하면 외국도서로 분류합니다.<hr>



### 신간도서
![image](https://user-images.githubusercontent.com/100080583/156285665-d1e30071-1e6a-47b6-98c8-679587e74fc0.png)<br>
![image](https://user-images.githubusercontent.com/100080583/156285679-645d156a-e339-4087-b3cc-1f98f62950dd.png)<br>
신간도서는
Service에서 모든 책 리스트들을 불러와
해당 책의 출판일자와 현재시간을 밀리초로 바꾸어서 계산함으로써
출판한지 2주이내의 책과 출판예정인 책들에게는
NewMark 라는 뱃지를 부여하는 형식으로 구현했습니다.<hr>

### 베스트셀러

![image](https://user-images.githubusercontent.com/100080583/156285707-7e68a4a0-3f40-45b2-bb6b-85ec2ffa7ba1.png)<br>
![image](https://user-images.githubusercontent.com/100080583/156971225-49ad9823-53ac-4564-83b7-d8ab7b612703.png)<br>
베스트셀러는 가장 많이 팔린 책들을
의미하므로, 임의로 bestCk 라는 컬럼을 만들어 관리자가 가장 잘 팔린 책들을 선별해서 bestCk = 1 로 체크해주는 방식으로 구현했습니다.
기본값 : bestCk = 0;<hr>

### 중고 장터
![image](https://user-images.githubusercontent.com/100080583/156285767-ef99fba7-b3bd-4220-8558-ae948dad469d.png)<br>
중고장터 메인 화면입니다.
중고장터에서도 사용자가 올린 중고책을 기준으로
카테고리별 책 분류를 했습니다.<hr>


### 중고장터 인터셉터

![image](https://user-images.githubusercontent.com/100080583/156285803-2d63cf21-d52b-482d-a545-a64685ac8202.png)<br>
![image](https://user-images.githubusercontent.com/100080583/156285816-b3057f15-89d1-45bb-a775-1ce88b572caf.png)<br>
인터셉터를 활용하여 로그인을 하지않은 사용자는 메인화면으로 돌아가게 했습니다.<hr>

### 판매자 페이지

![image](https://user-images.githubusercontent.com/100080583/156285850-00ca0f66-3d71-40c9-bacf-469180d28b43.png)<br>

중고장터 판매자 페이지입니다.
로그인한 사용자만 접속가능하며,
중고상품을 등록할수있고, 사용자가 몇개의 상품을 등록했는지 확인가능합니다.<hr>

### 책등록

![image](https://user-images.githubusercontent.com/100080583/156285875-c147388f-0a6a-43b6-81cd-6c21dd3dc244.png)<br>
![image](https://user-images.githubusercontent.com/100080583/156285884-957e9344-9eed-42c3-8509-ca7e81ea40be.png)<br>
중고책 등록페이지에서는
각 항목들을 입력받고
유효성 체크를 함으로써,
Null 값이 안들어가도록 구현했습니다.<hr>


### 책 상세보기

![image](https://user-images.githubusercontent.com/100080583/156285904-38d3e02c-80f0-4346-b518-14d5b201f54b.png)<br>
중고책 상세보기 페이지입니다.
중고책 수정,삭제 기능과
댓글 작성,수정,삭제 기능이 있습니다.<hr>



### 책 수정

![image](https://user-images.githubusercontent.com/100080583/156285948-de473bb7-174f-4b2c-bb28-85844737b7b9.png) <br>
작성자 본인만 수정 할 수 있고,
수정을 완료하면 카테고리번호, tier, 페이지번호, 책번호 등등을 가지고 
책 상세정보 페이지로 돌아옵니다.<hr>

![image](https://user-images.githubusercontent.com/100080583/156285976-e4860774-9e79-476d-84e1-0a73e07bde92.png)<br>
작성자 본인만 수정 할 수 있습니다.<hr>


### 책 삭제

![image](https://user-images.githubusercontent.com/100080583/156286010-2dc0f976-6aae-45bc-af82-bad32c31b9d7.png)<br>
작성자 본인만 삭제 할 수 있고,
수정을 완료하면 카테고리번호, tier, 페이지번호, 
책번호 등등을 가지고 
책 상세정보 페이지로 돌아옵니다.<hr>


![image](https://user-images.githubusercontent.com/100080583/156286034-928738a4-1442-4999-825f-471f8b048d2d.png)<br>
작성자 본인만 삭제 할 수 있습니다.<hr>


### 댓글 작성

![image](https://user-images.githubusercontent.com/100080583/156286067-2b7f24f8-f67f-4ef5-8cdd-949d044a064d.png)<br>
![image](https://user-images.githubusercontent.com/100080583/156286075-fff52f94-9245-48ae-8f39-6c21f179a9d5.png)<br>
![image](https://user-images.githubusercontent.com/100080583/156286088-013219e5-4992-46aa-a52b-342792448ca6.png)<br>
Ajax 를 이용해서 댓글 작성을 구현했습니다.<hr>


### 댓글 수정

![image](https://user-images.githubusercontent.com/100080583/156286117-7c501c9c-3caf-444b-9b68-d0d53514355c.png)<br>
세션을 이용하여
작성자인지 확인합니다.<hr>

![image](https://user-images.githubusercontent.com/100080583/156971335-50128363-c8ea-43c6-b1bf-1171a7c4c460.png)<br>
작성자 본인만 수정 할 수 있습니다.<hr>


### 댓글 삭제

![image](https://user-images.githubusercontent.com/100080583/156286164-392e5b33-4229-4396-8ce5-352fec396083.png)<br>
세션을 이용하여
작성자인지 확인합니다.<hr>

![image](https://user-images.githubusercontent.com/100080583/156971383-dd0da349-98d6-4527-8733-e853171ced0e.png)<br>
작성자 본인만 삭제 할 수 있습니다.<hr>


### 검색 기능

![image](https://user-images.githubusercontent.com/100080583/156286221-71fc9db7-03b0-44cf-b22f-7ac3e55f8ab7.png)<br>
![image](https://user-images.githubusercontent.com/100080583/156286230-2b61f065-f18d-41e7-88e3-8cd0fe432b4f.png)<br>
동적 sql 문을 활용하여
책제목, 출판사, 지은이로 검색할수있게
구현했습니다.
또한 중고장터에서의 검색기능이랑
일반 책들의 검색기능이랑은 따로따로 분류했습니다.<hr>

### 페이징 기능

![image](https://user-images.githubusercontent.com/100080583/156286294-5391b27b-c1a2-41b9-a2de-769c468b5942.png)<br>
![image](https://user-images.githubusercontent.com/100080583/156286254-a8b0ad12-fdc6-4555-a09b-1c6181770211.png)<br>
PageVO 와 PageCreaterVO를 만든후 페이징 알고리즘을 적용시켰습니다.<hr>




### 느낀점


사설학원에서 자바로 시작해서 프로젝트를 마무리하기까지<br>
너무나 배운 게 많았던 시간이었고<br>
3주가 조금 넘는 시간 동안 같이 프로젝트를 진행해준 조원들에게 매우 고마웠습니다.<br>
쇼핑몰이란 방대한 범위의 프로젝트를 진행하려면 엄청나게 많은 부분을 구현해야 하지만<br>
팀 프로젝트를 함으로써 전체 할당량을 여러 분야로 나누어서 계획을 세우고 각자의 목표량을 <br>
세워서 작업을 하다 보니 아무래도 부담이 덜 되고 마음의 여유가 생겼던 것 같습니다.<br>
또한 제가 완성을 못 하면 조원들에게 민폐를 끼치는 것이니깐 책임감을 가지고 열심히<br>
일에 집중할 수 있었습니다.<br>
프로젝트를 진행하면서 재밌었던 부분은 학원에서 알려주진 않았지만, 조원들의 의견으로<br>
알라딘 API를 이용하는 부분이었는데,<br>
많이 어려웠지만 결국 해결함으로써 실력이 조금 는 것 같아 재밌었던 것 같습니다. <br>
아쉬운 점은 저희가 git 사용에 익숙하지 않은 조원들이 있어서<br>
git을 통해 형상관리와 버전 관리를 못한 점이었습니다.<br>
장바구니 파트를 맡은 조원분이 오류를 찾지 못해서<br>
프로젝트 마지막 주까지 힘들어했는데 조원들이 다 같이 도와줌으로써 해결은 했지만<br>
이 일을 토대로 다른 사람의 코드를 보면서 이해하는 것이 어렵단 걸 느꼈고,<br>
다른 사람의 코드를 보고 배우면서 흥미를 느끼는 제 모습을 보며 한층 더 개발자의 길로<br>
다가선 것 같습니다.<br>

 
































































