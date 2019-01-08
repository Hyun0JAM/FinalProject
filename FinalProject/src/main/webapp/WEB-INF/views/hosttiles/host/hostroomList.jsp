<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>

<style type="text/css">
 .border {
    border: 1px solid gray;
 }

</style>

</head>
<body>

   <div class="container">
       <div class="panel panel-default">
          <div class="col-md-1"><img alt="" src="<%=request.getContextPath()%>/resources/images/home.png"></div>
            <div class="panel-body">게스트가 예약을 취소할 경우에도 수입을 올리세요 환불 불가 조건으로 10% 할인된 요금에 예약할 수 있는 옵션을 제공해보세요. 숙소의 경쟁력을 한층 높일 수 있으며 예약이 취소되어도 수입이 보장됩니다.
               <a>자세히 알아보기.</a></div>
       </div>
   </div>
   <div class="row">
      <div class="col-md-1" style="margin-left: 20%;">
         <div>숙소 목록</div>
         <div>예약 필수조건</div>
         <div>숙소 페이지</div>
      </div>
      
      <div class="col-md-6 container" style="padding-left: 10%;">
          <div class="panel panel-default">
             <div class="col-md-1"><img alt="" src="<%=request.getContextPath()%>/resources/images/ligth.png"></div>
               <div class="panel-body">원하시는 대금 수령 방법을 알려주세요. <a>대금 수령 방법을 설정하세요.</a></div>
          </div>
          
          <div class="col-md-12">
         <h2>운영 중</h2>
            <div class="panel panel-default">
                <div class="panel-body">                   
                   <div class="row">
                      <div class="col-md-4">
                         <span style="font-size: 15pt;">숙소이름</span>
                         <br/><br/><br/><br/>
                         <span style="font-size: 9pt;">최종업데이트 날짜:</span>
                      </div>
                      
                      <div class="col-md-8">
                         <img alt="" src="<%=request.getContextPath()%>/resources/images/숙소1.png" style="padding-left: 60%;"/>
                      </div>
                      
                   </div>
                </div>
                <div class="panel-body">
                   <a>수정하기</a>
                   <a>미리보기</a>
                   <a>달력</a>
                </div>
            </div>
         </div>
         
         <div class="col-md-12 border">
         <h2>운영 중지</h2>
            <div class="panel panel-default border">
                <div class="panel-heading">                   
                   <div class="row border">
                      <div class="col-md-4">
                         <span class="border" style="font-size: 15pt;">숙소이름</span>
                         <br/><br/><br/><br/>
                         <span class="border" style="font-size: 9pt;">최종업데이트 날짜:</span>
                      </div>
                      
                      <div class="col-md-8">
                         <img class="border" alt="" src="<%=request.getContextPath()%>/resources/images/숙소1.png" style="padding-left: 60%;"/>
                      </div>
                   </div>
                </div>
                <div class="panel-body border">
                   <img alt="" src="<%=request.getContextPath()%>/resources/images/time_icon-icons.com_65742.png">
                   <span><span style="font-weight: bold;">숙소 재설정</span><br/>
                   현재 휴식모드 입니다. 숙소를 '운영 재개'로 설정하시면 검색 결과에 다시 표시됩니다.</span>
                </div>
                <div class="panel-footer">
                   <a>수정하기</a>
                   <a>미리보기</a>
                   <a>달력</a>
                </div>
            </div>
         </div>
         
      </div>
   </div>
   

</body>
</html>