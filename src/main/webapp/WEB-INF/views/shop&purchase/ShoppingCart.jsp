<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
   href="${ pageContext.request.contextPath }/resources/css/shoppingCart.css">

<link rel="stylesheet"
   href="${ pageContext.request.contextPath }/resources/css/main.css">
<script src="http://code.jquery.com/jquery-1.6.4.min.js"></script>
<script type="text/javascript"
   src="${pageContext.request.contextPath}/resources/js/ShoppingCart.js"></script>

<script type="text/javascript"
   src="${pageContext.request.contextPath}/resources/js/httpRequest.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js"
   integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
   crossorigin="anonymous"></script>

<meta charset="UTF-8">
<title>Insert title here</title>
<script>
//적용되라..
/* stock가지고와서 해야함 */
   function cntup(upcnts,up,stock){
      var upcnt = document.getElementById(upcnts);
 
      var intstock = parseInt(stock);
 
      if(upcnt.value>intstock ){
 
          alert('재고가 없습니다.');
          return;
       }
       
      upcnt.value++;
 
    } 
 
    function cntdown(down){
       var cnt = document.getElementById(down);
       
       if(cnt.value<=1){
          alert('수량을 확인해주세요');
          return;
       }
       cnt.value--;
    }  
 

   //  /* 수량버튼 */
   // function cntup(){
   //    let quantity = $(this).parent("div").prev(input).find("input").val();
   //    $(this).parent("div").prev(input).find("input").val(++quantity);
   //    alert(quantity);

   // }

   // function cntdown(){
   // let quantity =  $(this).parent("div").prev(input).find("input").val();
   // if(quantity > 1){
   //    $(this).parent("div").prev(input).find("input").val(--quantity);      
   // }}
    
   

function changeCnt(cnt,num){
   var   bookCnt = document.getElementById(cnt).value;
   var url = "UpdateCnt.do";
   var param ="bookCnt="+bookCnt+"&shopnum="+num;


   sendRequest(url,param,changeResult,"POST");
}



function changeResult(){
      if(xhr.readyState ==4 && xhr.status ==200){
         var data = xhr.responseText;
         if(data ==1){
            alert('수량변경 성공');
         
         }else{
            alert('변경 실패, 관리자에게 문의하세요');
         }
         
         location.href='shoppingCart.do';
      }   
   }


   
   //체크한 장바구니 상품 비우기
       function checkdel(){

         var valueArr = new Array();
          var list =$('.individual_cart_checkbox');
         for (let i = 0; i < list.length; i++) {
            if(list[i].checked){
               valueArr.push(list[i].value);
            }
         } 
                     


         if(valueArr.length == 0){
            alert('선택된 상품이 없습니다.');
         }
         if(!confirm('삭제하겠습니까?')){
               return;
            }
         var url = "checkdel.do";

            $.ajax({
                url : url,                    // 전송 URL
                type : 'POST',                // GET or POST 방식
                traditional : true,
                data : {
                   valueArr : valueArr        // 보내고자 하는 data 변수 설정
                },
                   success: function(jdata){
                       if(jdata = 1) {
                           alert("삭제 성공");
                           location.replace("shoppingCart.do")
                       }
                       else{
                           alert("삭제 실패");
                       }
                   }
            });


         }

      
      //삭제하나
      function delone(num){
         alert(num);
         
         if(!confirm("삭제 하시겠습니까?")){
            return;
         }
            var url = "delone.do";
            var param ="shopnum="+num;
            sendRequest(url,param,delOneResult,"POST");
      }


      function delOneResult(){
         if(xhr.readyState ==4 && xhr.status ==200){
            var data = xhr.responseText;
            if(data ==1){
               alert('삭제 성공');
               
            }else{ 
               alert('삭제 실패, 관리자에게 문의하세요');
            }
            
            location.href="shoppingCart.do";
         }   
      }
    
      function payone(f){
         alert('${vo.shopnum}');
         alert('${vo.id}');
         

         f.action = "payone.do";
         f.submit();
      }

      

      function checkorder(){
         let form_contents ='';
         let orderNumber = 0;

         /* <input type="hidden" name="shopnum" value="${vo.shopnum}">
            <input type="hidden" name="id" value="${vo.id}">
             <input type="hidden" name="booknum" value="${vo.booknum}"> 
             <input type="hidden" name="bookCnt" value="${vo.bookCnt}">

      <input type="hidden" class="individual_shopnum_input" value="${vo.shopnum}">
      <input type="hidden" class="individual_id_input" value="${vo.id}">
      <input type="hidden"  class="individual_booknum_input" name="booknum" value="${vo.booknum}">
      <input type="hidden"  class="individual_bookCnt_input" value="${vo.bookCnt}">
      <input type="text" class="totalPrice_input" value="${vo.bookCnt * vo.price} ">

         /*  */

         
         $(".cart_info").each(function(index, element) {

            if($(element).find(".individual_cart_checkbox").is(":checked") === true){
               //price,subject
               let shopnum = $(element).find(".individual_shopnum_input").val();
               let id = $(element).find(".individual_id_input").val();
               let bookNum = $(element).find(".individual_booknum_input").val();
               
               let bookCnt = $(element).find(".individual_bookCnt_input").val();
               let price  = $(element).find(".bookprice_input").val();
               let  subject = $(element).find(".individual_subject").val();



               alert(shopnum , id);


               let id_input =    "<input name='orders[" + orderNumber + "].id' type='hidden' value='" + id + "'>";
               form_contents += id_input;

               let shopnum_input = "<input name='orders[" + orderNumber + "].shopnum' type='hidden' value='" + shopnum + "'>";
            
               form_contents += shopnum_input;

               let booknum_input = "<input name='orders[" + orderNumber + "].bookNum' type='hidden' value='" + bookNum + "'>";
               form_contents += booknum_input;

               let bookCnt_input = "<input name='orders[" + orderNumber + "].bookCnt' type='hidden' value='" + bookCnt + "'>";
               form_contents += bookCnt_input;

               let price_input = "<input name='orders[" + orderNumber + "].price' type='hidden' value='" + price + "'>";
               form_contents += price_input;

               let subject_input = "<input name='orders[" + orderNumber + "].subject' type='hidden' value='" + subject + "'>";
               form_contents += subject_input;

 
                orderNumber+=1; 
               
            

            }
         });

         
         $(".order_form").html(form_contents);
         $(".order_form").submit();

      }
   


</script>
<script>
   $(document).ready(function() {
      setTotalInfo();
      /* 체크여부에따른 종합 정보 변화 */

   });


   function checkone(){

      /* 체크여부에따른 종합 정보 변화 */
      /* $(".individual_cart_checkbox").on("change", function() {
       */   /* 총 주문 정보 세팅(배송비, 총 가격, 마일리지, 물품 수, 종류) */
         setTotalInfo($(".cart_info"));
      
   }

 /* 체크박스 체크/해제 */
function selectAll()  {
   /* 체크박스 체크/해제 */
   if($(".all_check_input").prop("checked")){
      $(".individual_cart_checkbox").attr("checked", true);
   } else{
      $(".individual_cart_checkbox").attr("checked", false);
   }

   setTotalInfo($(".cart_info_td"));   
}

   


   /* 종합 정보 섹션 정보 삽입 */
   function setTotalInfo() {
      let totalPrice = 0; // 총 가격
      let totalCount = 0; // 총 갯수
      let totalKind = 0; // 총 종류
      let totalPoint = 0; // 총 마일리지
      let deliveryPrice = 0; // 배송비
      let finalTotalPrice = 0; //최종가격
      let addpoint = 0;
      let point = 0;
      let finalpoint = 0; //최종 포인트( 기본적립 + 추가적립)

      $(".cart_info").each(
            function(index, element) {

               /* 총가격 */
               if ($(element).find(".individual_cart_checkbox").is(
                     ":checked") === true) { //체크여부

                  totalPrice += parseInt($(element).find(".totalPrice_input").val());

                  console.log(totalPrice);

                  /* 총 갯수 */
                  totalCount += parseInt($(element).find(".bookCount_input").val());

                  /* 총 종류 */
                  totalKind += 1;

                  /* 총 포인트 */

               }
            });

      /* 배송비 결정  : 30000원 이상일 시 무료*/
      /* if (totalPrice >= 30000) {
         deliveryPrice = 0;
      } else if (totalPoint == 0) {
         deliveryPrice = 0;
      } else {
         deliveryPrice = 3000;
      } */
 

      point = totalPrice * 0.1;
      point = Math.floor(point);
      $(".point_span").text(point);

      
      //addpoint = Math.floor(addpoint);
      //$(".addpoint_span").text(addpoint);


      finalpoint = addpoint+point;
      $(".finalpoint_span").text(finalpoint);


      var today = new Date();
      var release_date = new Date(today.setDate(today.getDate()+2));
      

      console.log(release_date);

      finalTotalPrice = totalPrice ;

      /* 값 삽입 */
      //총 가격
      // 총 가격
      $(".totalPrice_span").text(totalPrice.toLocaleString());

      // 총 갯수
      $(".totalCount_span").text(totalCount);
      // 총 종류
      $(".totalKind_span").text(totalKind);
      // 총 마일리지
      $(".totalPoint_span").text(totalPoint.toLocaleString());

      // 최종 가격(총 가격 + 배송비)
      $(".finalTotalPrice_span").text(finalTotalPrice.toLocaleString());
      $(".releasedDate_span").text(release_date.toLocaleString());

   }
</script>
</head>
<body>
   <%@include file="../include/header.jsp"%>
   <div class="mainbox">
      <header>
         <img
            src="${ pageContext.request.contextPath }/resources/img/shoppingCart.PNG"
            alt="">
         <div class="head">
            <ul class="heand_ul">
               <!-- 이름추가 -->
               <li>${user.id}님의통장현황</li>
               <li>캐시 : ${user.money }</li>
               <!-- 포인트 추가 -->
               <li>통합포인트 :${user.shopPoint } P</li>
            </ul>
         </div>
      </header>

      <main>
         <ul class="normalpayfrmae">
            <li><input class="normalpay" type="button" value="구매">
            </li>
         </ul>
         <!--총 cart에 몇개 있는지  -->
         <h2 style="margin: 13px;">
            <input type="checkbox" checked="checked" class="all_check_input"
               onclick="selectAll()"> <span> 전체 </span>
               <span class="totalKind_span">???</span>종 <span
               class="totalCount_span">??</span>개
         </h2>
         <table style="width: 100%;">
            <tr class="table_head" style="text-align: center;">
               <td class="table_header_td">상품정보</td>
               <td>판매가</td>
               <td>수량</td>
               <td>합계</td>
               <td>배송일정</td>
               <td>선택</td>
            </tr>

            
               <c:forEach var="vo" items="${list2 }" varStatus="cnt">
                  <tr class="table_body" style="text-align: center;">
                     <td
                        style="margin-left: 13px; margin-top: 13px; margin-bottom: 42px;">
                        <div class="div_flex">
                           <!-- 여기가 checked되어야함 -->

                           <div class="cart_info"  >
                              <input type="checkbox" checked="checked" value="${vo.shopnum}"
                                 class="individual_cart_checkbox"
                                 style="width: 50px; height: 23px;" onclick="checkone();">

                              <!-- <input type="checkbox" class="individual_cart_checkbox" checked="checked" style="width: 50px; height: 23px;">-->
                              <!-- 책 가격 -->
                              <input type="hidden" class="bookprice_input" value="${vo.price}">
                              <!-- 책 수량 -->
                              <input type="hidden"   class="bookCount_input"value="${vo.bookCnt}"> 
                              <input type="hidden" class="totalPrice_input" value="${vo.bookCnt * vo.price} ">
                              <!-- 포인트는 전체에서 10%적립예정 -->

                              <input type="hidden" class="individual_shopnum_input" value="${vo.shopnum}">
                              <input type="hidden" class="individual_id_input" value="${vo.id}">
                              <input type="hidden"  name ="bookNum" class="individual_booknum_input" value="${vo.bookNum}">
                              <input type="hidden"  name="bookCnt" class="individual_bookCnt_input" value="${vo.bookCnt}">
                              <input type="hidden"  class="individual_subject" value="${vo.subject}">
                           </div>

                           <!-- img삽입 -->
                           <div class="table_felx1">
                              <!-- <div style="margin-right: 23px;">${vo.img }</div> -->
                              <div class="table_felx2">
                                 <div style="text-align: initial;">
                                    <span class="Income">소득공제</span> <span class="free">무료배송</span>
                                 </div>
                                 <div style="margin-top: 12px;">
                                    <!-- 국내도서인지 외국도서인지 카테고리에서 구분 -->
                                    <span> <a class="book_name" style="color: black;"
                                       href="">[??도서]${vo.subject}</a>
                                    </span>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </td>
                     <td>
                        <!-- 가격 -->
                        <div class="table_price">
                           <span style="margin-bottom: 8px;">${vo.price} 원</span>
                        </div>
                     </td>
                     <!-- 3 -->
                     <td>
                        <div>
                           <div
                           style="display: flex; justify-content: center; margin-bottom: 10px;">
                           <input type="text" class="table_cnt" value="${vo.bookCnt}"
                              id="count${cnt.index}">
                           <div style="display: flex; flex-direction: column;">
                              <!-- stock보다 클경우 alert 뜨기 -->
                              <img style="border: 1px solid grey;"
                                 src="http://image.kyobobook.co.kr/ink/images/common/icon_quantity_up.gif"
                                 alt="" id="up${cnt.index}"
                                 onclick="cntup('count${cnt.index}','up${cnt.index}','${vo.stock}');">
                              <img style="border: 1px solid grey;"
                                 src="http://image.kyobobook.co.kr/ink/images/common/icon_quantity_down.gif"
                                 alt="" id="down${cnt.index}"
                                 onclick="cntdown('count${cnt.index}');">
                           </div>
                        </div>
                           <div>

                              <input type="submit" value="변경"
                                 onclick="changeCnt('count${cnt.index}','${vo.shopnum}');">
                           </div>
                        </div>
                     </td>
                     <!-- 합계가격 -->
                     <td id="price${cnt.index}" value="${vo.bookCnt * vo.price}">${vo.bookCnt * vo.price}</td>
                     <!-- 출고예정 작성 ${releasedDate[cnt.index]}출고 예정-->
                     <td><span class="releasedDate_span">

                     </span></td>
                     <!-- 3pre -->
                     <td class="btn_two">
                        <div style="width: 50%;">

                           <div
                              style="display: flex; flex-direction: column; position: relative; left: 50%;">

                              <!-- 여기 -->
                              <input class="two_btn" type="button" id="" value="삭제"
                                 onclick="delone(${vo.shopnum});">
                           </div>
                        </div>
                     </td>
                  </tr>

               </c:forEach>
         </table>

         <div class="frame_del_check">
            <!-- <input type="checkbox" checked="checked" class="all_check_input" onclick="selectAll()"> -->
            <input class="delbtn" type="button" value="삭제" onclick="checkdel();">
         </div>
         <table style="width: 100%; text-align: center;">
            <tr class="finalprice">
               <th rowspan="2"></th>
               <th>상품금액 / <span class="totalKind_span">???</span>종 <span
                  class="totalCount_span">??</span>개
               </th>
               <th>배송비</th>
               <th>결제 예정금액</th>
               <th>적립예정 <span class="finalpoint_span"></span> 원P
               </th>
            </tr>
            <tr class="finalprice2">
               <td style="padding: 33px;"><span class="totalPrice_span"></span>원
               </td>
               <td><span class="delivery_price"></span>0원</td>
               <td><span class="finalTotalPrice_span"> </span>원</td>
               <td>
                  <div style="display: flex; justify-content: space-around;">

                     <div style="display: flex; flex-direction: column;">
                        <span>기본적립</span> 
                     </div>
                     <div style="display: flex; flex-direction: column;">
                        <span style="display: contents;" class="point_span"></span>원P <span><span
                           class="addpoint_span"></span>
                     </div>
                  </div>
               </td>
            </tr>
         </table>
         <div style="background-color: antiquewhite;">
            <!-- 기존 배송지 작성 -->
            <span style="margin-left: 24px;">배송일정 : (${user.postcode })
               ${user.address1} ${user.address2}</span>
            <span  class="releasedDate_span" style="margin-left: 24px;"></span>
         </div>
      
         <div style="display: flex; justify-content: space-around;">

            <input class="orderbtn" type="button" value="주문하기" onclick="checkorder();">


         </div>
      </main>
   </form>      
   <!-- 주문 form -->
   <form action="checkorder.do" method="get" class="order_form">

   </form>            
            
   </div>
   <%@include file="../include/footer.jsp"%>
</body>
</html>