<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>お知らせ管理</title>

  <!-- Bootstrap Core CSS -->
  <link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- MetisMenu CSS -->
  <link href="/resources/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

  <!-- Custom CSS -->
  <link href="/resources/dist/css/sb-admin-2.css" rel="stylesheet">

  <!-- Morris Charts CSS -->
  <link href="/resources/vendor/morrisjs/morris.css" rel="stylesheet">

  <!-- Custom Fonts -->
  <link href="/resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

  

    <!-- Navigation -->
    <%@include file="header.jsp"%>
	<div id="wrapper">
    <div id="page-wrapper">
      <div class="row">
        <div class="col-lg-12">
          <h1 class="page-header">お知らせ</h1>
        </div>
        <div style="text-align: right">
        <h4><a href='admin_inquryWrite' class='mypageLinkEditBtn'>作成する</a></h4><br>
        </div>
        <table class="table table-hover" id="myTable">
          <thead>
            <!-- 태그 누르면 정렬됨 -->
            <tr class="item">
              <th onclick="w3.sortHTML('#myTable', '.itemss', 'td:nth-child(1)')" style="cursor:pointer">No</th>
              <th onclick="w3.sortHTML('#myTable', '.itemss', 'td:nth-child(2)')" style="cursor:pointer">タイトル</th>
              <th onclick="w3.sortHTML('#myTable', '.itemss', 'td:nth-child(3)')" style="cursor:pointer">登録日付</th>
            </tr>				
          </thead>         
          <tbody>
          <c:forEach items="${list}" var="notice">
			<tr>
				<td><c:out value="${notice.notice_num}" /></td>
	
				<td><a href="/admin/admin_inquryView?notice_num=${notice.notice_num}">
									   <c:out value="${notice.title}" /></a></td>
								
				<td><fmt:formatDate pattern="yyyy-MM-dd"
						value="${notice.reg_date}" /></td>
			</tr>
		</c:forEach>         
          </tbody>
        </table>
        		<div class='pull-right'>
					<ul class="pagination">
						<c:if test="${pageMaker.prev}">
							<li class="paginate_button previous"><a
								href="${pageMaker.startPage -1}">Previous</a></li>
						</c:if>

						<c:forEach var="num" begin="${pageMaker.startPage}"
							end="${pageMaker.endPage}">
							<li class="paginate_button  ${pageMaker.cri.pageNum == num ? "active":""} ">
								<a href="${num}">${num}</a>
							</li>
						</c:forEach>

						<c:if test="${pageMaker.next}">
							<li class="paginate_button next"><a
								href="${pageMaker.endPage +1 }">Next</a></li>
						</c:if>
					</ul>
				</div>
				<form id='actionForm' action="/admin/admin_inqury" method='get'>
					<input type='hidden' name='pageNum'
						   value='${pageMaker.cri.pageNum}'>
					<input type='hidden' name='amount' 
					       value='${pageMaker.cri.amount}'>
				</form>
				</div>
				<div class="clearfix"> </div>
			</div>
       </div>
 <!--//contact-->
 <!--/grids-->
  
  <!-- jQuery -->
  <script src="/resources/vendor/jquery/jquery.min.js"></script>

  <!-- Bootstrap Core JavaScript -->
  <script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>

  <!-- Metis Menu Plugin JavaScript -->
  <script src="/resources/vendor/metisMenu/metisMenu.min.js"></script>

  <!-- Morris Charts JavaScript -->
  <script src="/resources/vendor/raphael/raphael.min.js"></script>
  <script src="/resources/vendor/morrisjs/morris.min.js"></script>
  <script src="/resources/data/morris-data.js"></script>

  <!-- Custom Theme JavaScript -->
  <script src="/resources/dist/js/sb-admin-2.js"></script>
  <script src="/resources/js/w3.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			/*
				var defaults = {
				containerID: 'toTop', // fading element id
				containerHoverID: 'toTopHover', // fading element hover id
				scrollSpeed: 1200,
				easingType: 'linear'
				};
			 */

			$().UItoTop({
				easingType : 'easeOutQuart'
			});

		});
		
		    var actionForm = $("#actionForm");

            $(".paginate_button a").on("click", function(e) {
			e.preventDefault();
			console.log('click');
			actionForm.find("input[name='pageNum']").val($(this).attr("href")); //a태그를 의미함 = 페이지 번호"#num"
			actionForm.submit();
		});
	</script>
	<!--$(".move").on("click", function(e){
		
		e.preventDefault();
		actionForm.append("<input type='hidden' name='notice_num' value='"+
				$(this).attr("href")+"'>");
		actionForm.attr("action", "/admin/admin_inqury");
		actionForm.submit();
	});-->


</body>

</html>
