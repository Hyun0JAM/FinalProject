<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
    
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String cxtPath = request.getContextPath();
%> 

<script type="text/javascript">
	
	$(document).ready(function(){
		
		goSearch("1");
		
		$("#searchWord").keydown(function(event){
			
			if(event.keyCode == 13) {	// 엔터를 했을 경우
				
				var addrSearch = $(this).val();
				goSearch("1");
				
				return false;
			}
			
		});

	});
	
	function goSearch(currentShowPageNo) {
		
		var searchWord = $("#searchWord").val().trim();
		var searchType = $("#searchType").val().trim();
		var data_form = {"searchWord":searchWord, "searchType" : searchType, "currentShowPageNo":currentShowPageNo};
		
		$.ajax({
			url:"<%=request.getContextPath()%>/adminMemberJSON.air",
			type:"GET",
			data:data_form,
			dataType:"JSON",
			success:function(json){ 
				var html = "";
				if(json.length > 0) {
					$.each(json, function(entryIndex, entry){
						var genderTD = "";
						var warnCnt = "";
						
						if(entry.WARNCOUNT == 2) {
							warnCnt = "<td style='color: orange;'>"+entry.USERID+"</td>";
						}
						else if (entry.WARNCOUNT >= 3){
							warnCnt = "<td style='color: red;'>"+entry.USERID+"</td>";
						}
						else {
							warnCnt = "<td>"+entry.USERID+"</td>";
						}
						
						if(entry.GENDER == "1"){
							genderTD = "<td>남자</td>";
						}else{
							genderTD = "<td>여자</td>";
						}
						 html += "<tr>"+
								   "<td><a href='memberDetail.air?userid="+entry.USERID+"'>"+entry.USERNAME+"</a></td>"+
								   warnCnt+
								   "<td>"+entry.BIRTHDAY+"</td>"+
								   genderTD+
								   "<td>"+entry.PHONE+"</td>"+
								   "<td>"+entry.ADDR+"&nbsp"+entry.DETAILADDR+"</td>"+
								   "<td><button type='button' class='btn btn-warning' onClick='addWarn(\""+entry.USERID+"\");'>경고</button></td>"+
								   "<td><button type='button' class='btn btn-danger' onClick='goDelete(\""+entry.USERID+"\");'>삭제</button></td>"+
								   "</tr>"; 
								   
						$("#result").html(html);
						
						makePageBar(currentShowPageNo);
						
					});
				}
				else {
					$("#result").html("<tr><td colspan='8' style='color:red;'>검색된 데이터가 없습니다.</td></tr>");
				} 
			},
			error: function(request, status, error){
				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			}
		});
	}	
	
	// ==== 댓글내용 페이지바 Ajax로 만들기
	function makePageBar(currentShowPageNo) {
		
		var searchWord = $("#searchWord").val().trim();
		var searchType = $("#searchType").val().trim();
		var data_form = {"searchWord":searchWord, "searchType" : searchType, "currentShowPageNo":currentShowPageNo};
		
		$.ajax({
			url:"<%=request.getContextPath()%>/getTotalPages.air",
			type:"GET",
			data:data_form,
			dataType:"JSON",
			success:function(json){
				
				var totalPage = json.totalPage;
				
				if(totalPage > 0) {
					// 댓글이 있는 경우
					
					var pageBarHTML = "";

					var blockSize = 10;
					// blockSize는 1개 블럭(토막)당 보여지는 페이지 번호의 갯수이다.
					
					var loop = 1;
					/*
						loop는 1부터 증가하여 1개 블럭을 이루는 페이지번호의 갯수이다.
						증가하는 용도이다
					*/
					
					var pageNo = Math.floor((currentShowPageNo - 1)/blockSize) * blockSize + 1;
					
					
					// **** [이전] 만들기 ***** //
					if( pageNo != 1 ) {
						
						pageBarHTML += "&nbsp;<a href='javascript:goSearch(\""+(pageNo-1)+"\");'>[이전]</a>&nbsp;";
						
					}
					
					//--------------------------------//
					while(! (loop > blockSize || pageNo > totalPage) ) {
						
						if(pageNo == currentShowPageNo) {
							// 현재 내가 보는 페이지와 똑같다면
							pageBarHTML += "&nbsp;<span style='color:red; font-weight: bold; text-decoration:underline;'>"+pageNo+"</span>&nbsp;";
						}
						else {
							pageBarHTML += "&nbsp;<a href='javascript:goSearch(\""+pageNo+"\");'>"+pageNo+"</a>&nbsp;";
						}
						
						loop++;
						pageNo++;
						
					}// end of while()----------------
					
					//--------------------------------//
					
					// **** [다음] 만들기 ***** //
					if( !(pageNo > totalPage) ) {
						
						pageBarHTML += "&nbsp;<a href='javascript:goSearch(\""+pageNo+"\");'>[다음]</a>&nbsp;";
						
					}
					
					//////////////////////////////
					$("#pageBar").empty().html(pageBarHTML);
					pageBarHTML = "";
				}
				else {
					// 댓글이 없는 경우(안해도 괜찮음)
					$("#pageBar").empty();
				}
			},
			error: function(request, status, error){
				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			}
			
		}); 
		
	} // end of makeCommentPageBar ---------------
	
	function addWarn(userid) {
		
		var delFrm = document.delFrm;
		delFrm.useridDel.value = userid;
		delFrm.method = "GET";
		delFrm.action = "<%=request.getContextPath()%>/adminMemberWarn.air";
		delFrm.submit();
		
	}

	function goDelete(userid) {

		var delFrm = document.delFrm;
		delFrm.useridDel.value = userid;
		delFrm.method = "GET";
		delFrm.action = "<%=request.getContextPath()%>/adminMemberDel.air";
		delFrm.submit();
		
	}
	
	function goView(gobackURL) {
		
		var frm = document.goViewFrm;
		frm.gobackURL.value = gobackURL;
		frm.method = "GET";
		frm.action = "memberDetail.air";
		frm.submit();
		
	}
	
</script>
<style type="text/css">
	table.memberList thead tr th,
	table.memberList tbody tr td{
		vertical-align: middle;
	}
</style> 

	<div class="col-md-10">
		<div  class="" style="text-align: center; margin: 2%; padding: 1%;">
			<div class="">
				<h1 class="home_title">회원관리</h1>	
			</div>
		</div>
	</div>
	
	<div class="container">	
		<div class="row">
			<div class="col-md-12" style="border: 0px solid gray;">
				<form name="delFrm">
				
					<table class="memberList table table-hover">
							<col width="10%;"/>
							<col width="10%;"/>
							<col width="10%;"/> 
							<col width="7%"/>
							<col width="10%"/>
							<col width="25%"/>
							<col width="5%"/>
							<col width="5%"/>
						  <thead>
						    <tr>
						      <th>이름</th>
						      <th>아이디</th>
						      <th>생년월일</th>
						      <th>성별</th>
						      <th>전화</th>
						      <th>주소</th>
						      <th></th>
						      <th></th>
						    </tr>
						  </thead>
						  <tbody id="result">
						  	
						  </tbody>
					</table>
					<input type="hidden" name="useridDel" value=""/>
				</form>
			</div>
		</div>
	</div>
	
	<div class="pageBar" id="pageBar"style="text-align: center; margin: 2%;">
		
	</div>
	
	<form name="memberFrm">
		<input type="hidden" id="useriddel" name="useriddel"/>
		<div id="searchbar" style="text-align: center;">
			<select id="searchType" name="searchType">
				<option value="username">이름</option>
				<option value="userid">아이디</option>
				<option value="addr">주소</option>
			</select>
	        <input type="text" id="searchWord" name="searchWord" placeholder="검색" style="" />
	        
	        <span id="logoDiv"><img src="<%=request.getContextPath() %>/resources/images/musica-searcher.png" style="width:20px; height:20px; cursor: pointer;" onClick="goSearch('1');"/></span>
	    	<div style="visibility:hidden;">
	    		<input type="text" />
	    	</div>
	    </div>
	</form>
	


