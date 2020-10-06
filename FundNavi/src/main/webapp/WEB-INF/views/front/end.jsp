<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE html>
<html>
<head>
<title>終了したプロジェクト</title>
<!--/tags -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
<!--//tags -->
<link href="/resources/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link rel="stylesheet" type="text/css" href="/resources/css/jquery-ui.css">
<link href="/resources/css/style.css" rel="stylesheet" type="text/css" media="all" />
<link href="/resources/css/font-awesome.css" rel="stylesheet">
<!-- //for bootstrap working -->
<link href="//fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800" rel="stylesheet">
<link href='//fonts.googleapis.com/css?family=Lato:400,100,100italic,300,300italic,400italic,700,900,900italic,700italic' rel='stylesheet' type='text/css'>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
</head>
<body>
 <%@include file="header.jsp"%>
<!-- /banner_bottom_agile_info -->
<div class="page-head_agile_info_w3l">
		<div class="container">
			<h3><span>終了したプロジェクト</span></h3>
			<!--/w3_short-->
				 <div class="services-breadcrumb">
						<div class="agile_inner_breadcrumb">

						   <ul class="w3_short">
								<li><a href="../">メインページ</a><i>|</i></li>
								<li>終了したプロジェクト</li>
							</ul>
						 </div>
				</div>
	   <!--//w3_short-->
	</div>
</div>

<!-- /한눈에보기프로젝트-->
	 <c:forEach items="${list}" var="project">
	 <!-- 날짜 퍼센트 관련 처리부분 -->
				<jsp:useBean id="now" class="java.util.Date" />
				<fmt:formatDate value="${project.project_start}" pattern="yyyy-MM-dd" var="openDate"/>
				<fmt:formatDate value="${project.project_end}" pattern="yyyy-MM-dd" var="closeDate"/>
				<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="nowDate" />       

				<fmt:parseDate value="${openDate}" var="strPlanDate" pattern="yyyy-MM-dd"/>
				<fmt:parseNumber value="${strPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="strDate"></fmt:parseNumber>
				<fmt:parseDate value="${closeDate}" var="endPlanDate" pattern="yyyy-MM-dd"/>
				<fmt:parseNumber value="${endPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="endDate"></fmt:parseNumber>
										
				<fmt:parseDate value="${nowDate}" var="nowPlanDate" pattern="yyyy-MM-dd"/>
				<fmt:parseNumber value="${nowPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="nowDate"></fmt:parseNumber>
										<!-- 날짜 퍼센트 관련 처리부분 여기까지 -->
										
 	<div class="col-md-4 product-men" style="width:30%; margin: 30px 10px 10px 10px; cursor: pointer;" onclick="location.href='single_end?project_num=${project.project_num}'">
 							<div class="men-pro-item simpleCart_shelfItem">
 								
 									<c:if test="${not empty project.title_image}">
												<img src="/resources/upload/${project.title_image}">
											</c:if>
											<c:if test="${empty project.title_image}">
												<img class="card-img-top" src="http://placehold.it/700x560" alt="">
											</c:if>
 										<span class="product-new-top2">終了</span>

 								

 								<div class="item-info-product ">
 									<h4><a href="single_end?project_num=${project.project_num}"><c:out value="${project.simple_content}"></c:out></a></h4>
 									<div class="info-product-price">
											<p><c:out value="${project.category}"/></p>
											            <div class="progress" style="width:90%; height:7px; margin:0 auto;">
											              <div class="progress-bar progress-bar-success" style="width:${(project.current_invest / project.achive_invest) * 100}%"></div>
											              <!--모금현황-->
											            </div>
											           <div></div>
														<div style="float: left; width: 20%; ">
															<strong style="font-size: 15px; color: #00CCCC;"><fmt:formatNumber value="${(project.current_invest / project.achive_invest) * 100}" pattern="##.#" />%</strong>
														</div>
														<div style="float: left; width: 55%; ">
															<fmt:formatNumber value="${project.achive_invest}" pattern="#,###,###,###,###"/>円
														</div>
														<div style="float: right; width: 25%; ">
															<strong style="text-align: right">終了</strong>
														</div>
										</div>


 								</div>
 							</div>
 						</div>
	</c:forEach>

 			<div class="clearfix" style="margin: 0 0 0 50px;">
 			        <!-- 검색 영역 시작 -->
				<div class='row'>
					<div class="col-lg-12">
						<form id='searchForm' action="/front/open" method='get'>
							<select name='type'>
								<option value=""
									<c:out value="${pageMaker.cri.type == null?'selected':''}"/>>--</option>
								<option value="T"
									<c:out value="${pageMaker.cri.type eq 'T'?'selected':''}"/>>タイトル</option>
								<option value="C"
									<c:out value="${pageMaker.cri.type eq 'C'?'selected':''}"/>>カテゴリー</option>
								<option value="W"
									<c:out value="${pageMaker.cri.type eq 'W'?'selected':''}"/>>会員名</option>
							</select>
							<input type='text' name='keyword' value='<c:out value="${pageMaker.cri.keyword}"/>' />
							<input type='hidden' name='pageNum'	value='<c:out value="${pageMaker.cri.pageNum}"/>' />
							<input type='hidden' name='amount' value='<c:out value="${pageMaker.cri.amount}"/>' />
							<input type='hidden' name='p_type' value='<c:out value="${pageMaker.cri.p_type}"/>' />
							<button class='btn btn-default'>検索</button>
						</form>
					</div>
				</div>
			<div class='pull-right'>
               <ul class="pagination">

                  <c:if test="${pageMaker.prev}">
                     <li class="paginate_button previous"><a href="${pageMaker.startPage -1}">Previous</a></li>
                  </c:if>

                  <c:forEach var="num" begin="${pageMaker.startPage}"   end="${pageMaker.endPage}">
                     <li class="paginate_button  ${pageMaker.cri.pageNum == num ? "active":""} ">
                        <a href="${num}">${num}</a>
                     </li>
                  </c:forEach>

                  <c:if test="${pageMaker.next}">
                     <li class="paginate_button next"><a href="${pageMaker.endPage +1 }">Next</a></li>
                  </c:if> 

               </ul>
            </div>
            
 			</div>




<!-- //team -->

	<!-- schedule-bottom -->

<!-- //schedule-bottom -->

  <!-- banner-bootom-w3-agileits -->


<!--/grids-->

<!--/grids-->
	<!-- /we-offer -->
	
	<!-- //we-offer -->
<!--/grids-->

<!--grids-->
	<!-- footer -->
	<div class="footer">
		<div class="footer_agile_inner_info_w3l">
			<div class="col-md-3 footer-left">
				<h2>
					<a href="../"><span>F</span>undNavi</a>
				</h2>
				
				
			</div>
			<div class="col-md-9 footer-right">
				<div class="sign-grds">
					<div class="col-md-4 sign-gd">
						<h4>
							M<span>enu</span>
						</h4>
						<ul>
							<li><a href="../">メインページ</a></li>
							<li><a href="project">進行中のプロジェクト</a></li>
							<li><a href="open">スタート予定</a></li>
							<li><a href="culture">文化コンテンツ</a></li>
							<li><a href="end">終了したプロジェクト</a></li>
						</ul>
					</div>

					<div class="col-md-5 sign-gd-two">
						<h4>
							FundNavi <span>Information</span>
						</h4>
						<div class="w3-address">
							<div class="w3-address-grid">
								<div class="w3-address-left">
									<i class="fa fa-phone" aria-hidden="true"></i>
								</div>
								<div class="w3-address-right">
									<h6>Phone Number</h6>
									<p>+82) 10-9060-9279</p>
								</div>
								<div class="clearfix"></div>
							</div>
							<div class="w3-address-grid">
								<div class="w3-address-left">
									<i class="fa fa-envelope" aria-hidden="true"></i>
								</div>
								<div class="w3-address-right">
									<h6>Email Address</h6>
									<p>
										Email :<a href="mailto:huhmin96@gmail.com"> huhmin96@gmail.com</a>
									</p>
								</div>
								<div class="clearfix"></div>
							</div>
							<div class="w3-address-grid">
								<div class="w3-address-left">
									<i class="fa fa-map-marker" aria-hidden="true"></i>
								</div>
								<div class="w3-address-right">
									<h6>Location</h6>
									<p>South of Korea</p>
								</div>
								<div class="clearfix"></div>
							</div>
						</div>
					</div>
					
					<div class="clearfix"></div>
				</div>
			</div>
			<div class="clearfix"></div>

			
		</div>
	</div>
	<!-- //footer -->

<!-- login -->
			<div class="modal fade" id="myModal4" tabhome="-1" role="dialog" aria-labelledby="myModalLabel">
				<div class="modal-dialog" role="document">
					<div class="modal-content modal-info">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						</div>
						<div class="modal-body modal-spa">
							<div class="login-grids">
								<div class="login">
									<div class="login-bottom">
										<h3>Sign up for free</h3>
										<form>
											<div class="sign-up">
												<h4>Email :</h4>
												<input type="text" value="Type here" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Type here';}" required="">
											</div>
											<div class="sign-up">
												<h4>Password :</h4>
												<input type="password" value="Password" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Password';}" required="">

											</div>
											<div class="sign-up">
												<h4>Re-type Password :</h4>
												<input type="password" value="Password" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Password';}" required="">

											</div>
											<div class="sign-up">
												<input type="submit" value="REGISTER NOW" >
											</div>

										</form>
									</div>
									<div class="login-right">
										<h3>Sign in with your account</h3>
										<form>
											<div class="sign-in">
												<h4>Email :</h4>
												<input type="text" value="Type here" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Type here';}" required="">
											</div>
											<div class="sign-in">
												<h4>Password :</h4>
												<input type="password" value="Password" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Password';}" required="">
												<a href="#">Forgot password?</a>
											</div>
											<div class="single-bottom">
												<input type="checkbox"  id="brand" value="">
												<label for="brand"><span></span>Remember Me.</label>
											</div>
											<div class="sign-in">
												<input type="submit" value="SIGNIN" >
											</div>
										</form>
									</div>
									<div class="clearfix"></div>
								</div>
								<p>By logging in you agree to our <a href="#">Terms and Conditions</a> and <a href="#">Privacy Policy</a></p>
							</div>
						</div>
					</div>
				</div>
			</div>
<!-- //login -->
<a href="#home" class="scroll" id="toTop" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>
<!-- js -->
<script type="text/javascript" src="/resources/js/jquery-2.1.4.min.js"></script>
<!-- //js -->
	<!-- cart-js -->
	<script src="/resources/js/minicart.min.js"></script>
<script>
	// Mini Cart
	paypal.minicart.render({
		action: '#'
	});

	if (~window.location.search.homeOf('reset=true')) {
		paypal.minicart.reset();
	}
</script>

	<!-- //cart-js -->

<!-- stats -->
	<script src="/resources/js/jquery.waypoints.min.js"></script>
	<script src="/resources/js/jquery.countup.js"></script>
	<script>
		$('.counter').countUp();
	</script>
<!-- //stats -->
<!-- start-smoth-scrolling -->
<script type="text/javascript" src="/resources/js/move-top.js"></script>
<script type="text/javascript" src="/resources/js/jquery.easing.min.js"></script>
<script type="text/javascript">
	jQuery(document).ready(function($) {
		$(".scroll").click(function(event){
			event.preventDefault();
			$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
		});
	});
</script>
<!-- here stars scrolling icon -->
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

			$().UItoTop({ easingType: 'easeOutQuart' });

			});
	</script>
<!-- //here ends scrolling icon -->

	<!-- 페이징이나 여러 기능과 관련된 스크립트 -->
<script type="text/javascript">   
   var actionForm = $("#actionForm");

    // 페이지 번호 클릭 이벤트
    $(".paginate_button a").on("click", function(e) {
       e.preventDefault();
       // console.log('click');
       actionForm.find("input[name='pageNum']").val($(this).attr("href"));
       actionForm.submit();
    });
    
 	// 검색 버튼 클릭 이벤트 작업포인트
	var searchForm = $("#searchForm");
	$("#searchForm button").on("click",	function(e) {
		if (!searchForm.find("option:selected").val()) {
			alert("選択してください。");
			return false;
		}

		if (!searchForm.find("input[name='keyword']").val()) {
			alert("入力してください。");
			return false;
		}
		
		searchForm.find("input[name='pageNum']").val("1");
		e.preventDefault();
		searchForm.submit();
	});




    
</script>
<!-- 페이징이나 여러 기능과 관련된 스크립트 여기까지 -->

<!-- for bootstrap working -->
<script type="text/javascript" src="/resources/js/bootstrap.js"></script>
<script type="text/javascript" src="/resources/js/bootstrap2.js"></script>
</body>
</html>
