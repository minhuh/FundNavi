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
<title>個人情報設定</title>
<!--/tags -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="" />
<script type="application/x-javascript">
    addEventListener("load", function() {
      setTimeout(hideURLbar, 0);
    }, false);

    function hideURLbar() {
      window.scrollTo(0, 1);
    }
  </script>
<!--//tags -->
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
	<!-- /banner_bottom_agile_info -->
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
				<form action="/profileEdit" method="post"
					enctype="multipart/form-data">
					<input type="hidden" name="uploadFile" value="" /> <input
						type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					<div class="col-md-7 ab_pic_w3ls">
						<h1 class="aboutLabel">個人情報設定</h1>

						<h3>イメージ</h3>
						<img src="resources/images/myImage.jpg" style="width: 30%">

						<input type="file" class="form-control-file border"
							id="fileUpload" name="uploadFile">

						<div class="div_InterestCategory">
							<h3 style="margin-bottom: 4%;">関心があるカテゴリー</h3>
							<div class="col-md-6 ab_pic_w3ls">
								<select name="interesting_category" class="custom-select"
									autofocus="autofocus">
									<option selected>カテゴリー</option>
									<option value="家電">家電</option>
									<option value="ファッション">ファッション</option>
									<option value="ビューティー">ビューティー</option>
									<option value="フード">フード</option>
									<option value="ホームリビング">ホームリビング</option>
									<option value="デザイン">デザイン</option>
									<option value="旅行">旅行</option>
									<option value="スポーツ">スポーツ</option>
									<option value="教育">教育</option>
									<option value="ペット">ペット</option>
									<option value="ドネーション">ドネーション</option>
									<option value="集まり">集まり</option>
									<option value="共演">共演</option>
									<option value="ホビー">ホビー</option>
									<option value="ソーシャル">ソーシャル</option>
									<option value="本">本</option>
								</select>
							</div>
						</div>
					</div>
					<div class="col-md-5 ab_pic_w3ls_text_info">
						<h3 class="simpleIntroLabel">簡単に自己紹介をお願いします。</h3>
						<br />
						<textarea name="self_introduce" class="form-control" rows="20"
							cols="70%" maxlength="100"></textarea>
						<div class="myPageEditBtnClass">
							<a href="#" class="cButton">戻る</a> 
							<input type="submit"
								class="nButton" name="submit" value="完了">
						</div>

					</div>
				</form>



				<div class="clearfix"></div>
			</div>
			<!-- 진행 중, 종료 네비게이션 바  -->
		</div>
	</div>
	<!-- //we-offer -->
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
      action: '#'
    });

    if (~window.location.search.indexOf('reset=true')) {
      paypal.minicart.reset();
    }
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
          scrollTop: $(this.hash).offset().top
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
        easingType: 'easeOutQuart'
      });

    });
  </script>
	<!-- //here ends scrolling icon -->

	<!-- for bootstrap working -->
	<script type="text/javascript" src="resources/js/bootstrap.js"></script>
	<script type="text/javascript" src="resources/js/bootstrap2.js"></script>
</body>

</html>
