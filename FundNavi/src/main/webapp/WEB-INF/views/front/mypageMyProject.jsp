<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<title>私のプロジェクト</title>
<!--/tags -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<script type="application/x-javascript">
	
	
		addEventListener("load", function() {
			setTimeout(hideURLbar, 0);
		}, false);

		function hideURLbar() {
			window.scrollTo(0, 1);
		}
	

</script>
<link rel="stylesheet" type="text/css" media="all"
	href="resources/css/cstyle.css">
<link href="resources/css/bootstrap.css" rel="stylesheet"
	type="text/css" media="all" />
<link href="resources/css/team.css" rel="stylesheet" type="text/css"
	media="all" />
<link href="resources/css/style.css" rel="stylesheet" type="text/css"
	media="all" />
<link href="resources/css/font-awesome.css" rel="stylesheet">
<!-- //for bootstrap working -->
<link
	href="//fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800"
	rel="stylesheet">
<link
	href='//fonts.googleapis.com/css?family=Lato:400,100,100italic,300,300italic,400italic,700,900,900italic,700italic'
	rel='stylesheet' type='text/css'>
</head>

<body>
	<%@include file="header.jsp"%>
	<div class="page-head_agile_info_w3l">
		<div class="container">
			<a href="myPage">
				<h3>
					My <span>Page </span>
				</h3>
			</a>
			<!--/w3_short-->
			<div class="services-breadcrumb">
				<div class="agile_inner_breadcrumb">

					<ul class="w3_short">
						<li><a href="../">メインページ</a><i>|</i></li>
						<li>マイページ</li>
					</ul>
				</div>
			</div>
			<!--//w3_short-->
		</div>
	</div>
	<!-- /banner_bottom_agile_info -->
	<div class="banner_bottom_agile_info">
		<div class="container">
			<div class="agile_ab_w3ls_info">
				<div class="col-md-6 ab_pic_w3ls">
					<h1 class="aboutLabel">私のプロジェクト</h1>
					<p>私のプロジェクトの情報が確認できます。</p>
				</div>
				<div class="col-md-6 ab_pic_w3ls_text_info"></div>
				<div class="clearfix"></div>
			</div>
			<div class="hiddenMsg">
				<div id="hiddenM"></div>
			</div>

			<!-- 진행 중, 종료 네비게이션 바  -->
			<div class="col-md-2">
				<ul class="nav nav-pills">
					<li class="nav-item"><a class="nav-link active" id="ingBtn"
						href="#">進行中</a></li>
					<li class="nav-item"><a class="nav-link" id="endBtn" href="#">終了</a>
					</li>
				</ul>
			</div>
			<div class="col-md-9 "></div>
			<div class="myProjectING" id="INGTable">
				<table class="table table-striped">
					<thead>
						<tr>
							<th>プロジェクト名</th>
							<th>プロジェクトの期間</th>
							<th>検討の有り無し</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${project}" var="ing">

							<fmt:formatDate var="ingSrtDate" value="${ing.project_start}"
								pattern="MM-dd" />
							<fmt:formatDate var="ingEndDate" value="${ing.project_end}"
								pattern="MM-dd" />
							<tr>
								<td>${ing.simple_content}</td>
								<td>기간 : <c:out value="${ingSrtDate}" />~<c:out
										value="${ingEndDate}" /></td>
								<td><c:if test="${ing.project_distinct == 'ongoing'}">
										<p class="gumtoING">完了</p>
									</c:if> <c:if test="${ing.project_distinct == 'standBy'}">
										<p class="gumtoING">検討中</p>
									</c:if> <c:if test="${ing.project_distinct == 'refuse'}">
										<a class="gumtoRefuse" href="#">X</a>
									</c:if>
									<p class="gumtoING">検討中</p></td>
							</tr>
						</c:forEach>
						<!-- ...테이블 추가하려면 <tr> 추가 -->
					</tbody>
				</table>
				<!-- 종료 테이블 -->
			</div>
			<div class="myProjectEND">
				<table class="table table-striped" id="ENDTable">
					<thead>
						<tr>
							<th>プロジェクト名</th>
							<th>プロジェクトの期間</th>
							<th>検討の有り無し</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${projectEnd}" var="end">
							<fmt:formatDate var="endingDate" value="${end.project_start}"
								pattern="MM-dd" />
							<fmt:formatDate var="endEndDate" value="${end.project_end}"
								pattern="MM-dd" />
							<tr>
								<td>${ing.simple_content}</td>
								<td>기간 : <c:out value="${endingDate}" />~<c:out
										value="${endEndDate}" /></td>
								<td><c:if test="${end.project_distinct == 'ongoing'}">
										<p class="gumtoING">完了</p>
									</c:if> <c:if test="${end.project_distinct == 'standBy'}">
										<p class="gumtoING">検討中</p>
									</c:if> <c:if test="${end.project_distinct == 'refuse'}">
										<a class="gumtoRefuse" href="#">X</a>
									</c:if>
									<p class="gumtoING">検討中</p></td>
							</tr>
						</c:forEach>
					</tbody>

				</table>
			</div>

		</div>
	</div>
	<!-- //schedule-bottom -->
	<!-- banner-bootom-w3-agileits -->

	<!--/grids-->

	<!-- login -->
	<div class="modal fade" id="myModal4" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content modal-info">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body modal-spa">
					<div class="login-grids">
						<div class="login">
							<div class="login-bottom">
								<h3>Sign up for free</h3>
								<form>
									<div class="sign-up">
										<h4>Email :</h4>
										<input type="text" value="Type here"
											onfocus="this.value = '';"
											onblur="if (this.value == '') {this.value = 'Type here';}"
											required="">
									</div>
									<div class="sign-up">
										<h4>Password :</h4>
										<input type="password" value="Password"
											onfocus="this.value = '';"
											onblur="if (this.value == '') {this.value = 'Password';}"
											required="">

									</div>
									<div class="sign-up">
										<h4>Re-type Password :</h4>
										<input type="password" value="Password"
											onfocus="this.value = '';"
											onblur="if (this.value == '') {this.value = 'Password';}"
											required="">

									</div>
									<div class="sign-up">
										<input type="submit" value="REGISTER NOW">
									</div>

								</form>
							</div>
							<div class="login-right">
								<h3>Sign in with your account</h3>
								<form>
									<div class="sign-in">
										<h4>Email :</h4>
										<input type="text" value="Type here"
											onfocus="this.value = '';"
											onblur="if (this.value == '') {this.value = 'Type here';}"
											required="">
									</div>
									<div class="sign-in">
										<h4>Password :</h4>
										<input type="password" value="Password"
											onfocus="this.value = '';"
											onblur="if (this.value == '') {this.value = 'Password';}"
											required=""> <a href="#">Forgot password?</a>
									</div>
									<div class="single-bottom">
										<input type="checkbox" id="brand" value=""> <label
											for="brand"><span></span>Remember Me.</label>
									</div>
									<div class="sign-in">
										<input type="submit" value="SIGNIN">
									</div>
								</form>
							</div>
							<div class="clearfix"></div>
						</div>
						<p>
							By logging in you agree to our <a href="#">Terms and
								Conditions</a> and <a href="#">Privacy Policy</a>
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- //login -->
	<a href="#home" class="scroll" id="toTop" style="display: block;">
		<span id="toTopHover" style="opacity: 1;"> </span>
	</a>
	<!-- js -->
	<script type="text/javascript" src="resources/js/jquery-2.1.4.min.js"></script>
	<!-- //js -->
	<!-- cart-js -->
	<script src="resources/js/minicart.min.js"></script>
	<script src="resources/js/chul.js"></script>
	<script>
		// Mini Cart
		paypal.minicart.render({
			action : '#'
		});

		if (~window.location.search.indexOf('reset=true')) {
			paypal.minicart.reset();
		}
	</script>


	<script>
		// 거절메세지 표시 스크립트
		function refuseMsg() {
			document.getElementById("hiddenM").innerHTML = '<div class="alert alert-danger"><button type="button" class="close" data-dismiss="alert">&times;</button><strong>すみません。</strong><p>次のプロジェクトはまたよろしくお願いいたします。</p></div>'
		}
		// 진행 중, 종료 프로젝트 표시 코드
		$(document).ready(function() {
			// 마이페이지 접근 시 종료 프로젝트 숨김
			$("#ENDTable").hide();

			// 진행 중 프로젝트 표시
			$("#ingBtn").click(function() {
				$("#ENDTable").hide();
				$("#INGTable").show();
			});

			// 종료 프로젝트 표시
			$("#endBtn").click(function() {
				$("#INGTable").hide();
				$("#ENDTable").show();
			});
		});
		// 진행 중 프로젝트 표시
		// function mypageMyprojectING(){}

		// 종료 프로젝트 표시
		// function mypageMyprojectEND(){}
	</script>
	<!-- //cart-js -->

	<!-- stats -->
	<script src="resources/js/jquery.waypoints.min.js"></script>
	<script src="resources/js/jquery.countup.js"></script>
	<script>
		$('.counter').countUp();
	</script>
	<!-- //stats -->
	<!-- start-smoth-scrolling -->
	<script type="text/javascript" src="resources/js/move-top.js"></script>
	<script type="text/javascript" src="resources/js/jquery.easing.min.js"></script>
	<script type="text/javascript">
		jQuery(document).ready(function($) {
			$(".scroll").click(function(event) {
				event.preventDefault();
				$('html,body').animate({
					scrollTop : $(this.hash).offset().top
				}, 1000);
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

			$().UItoTop({
				easingType : 'easeOutQuart'
			});

		});
	</script>
	<!-- //here ends scrolling icon -->

	<!-- for bootstrap working -->
	<script type="text/javascript" src="resources/js/bootstrap.js"></script>
	<script type="text/javascript" src="resources/js/bootstrap2.js"></script>
</body>

</html>
