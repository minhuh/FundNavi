<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<title>プロジェクト作成</title>
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
	<!--//tags -->
	<link rel="stylesheet" type="text/css" media="all" href="/resources/css/cstyle.css">
	<link href="/resources/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
	<link rel="stylesheet" type="text/css" href="/resources/css/jquery-ui.css">
	<link href="/resources/css/style.css" rel="stylesheet" type="text/css" media="all" />
	<link href="/resources/css/font-awesome.css" rel="stylesheet">
	<!-- //for bootstrap working -->
	<link href="//fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800" rel="stylesheet">
	<link href='//fonts.googleapis.com/css?family=Lato:400,100,100italic,300,300italic,400italic,700,900,900italic,700italic' rel='stylesheet' type='text/css'>
	<style type="text/css">
		}
	</style>
	
	<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
</head>

<body>
	 <%@include file="header.jsp"%>
	<!-- /banner_bottom_agile_info -->
	<div class="page-head_agile_info_w3l">
		<div class="container">
			<h3>プロジェクト <span>作成 </span></h3>
			<!--/w3_short-->
			<div class="services-breadcrumb">
				<div class="agile_inner_breadcrumb">

					<ul class="w3_short">
						<li><a href="../">メインページ</a><i>|</i></li>
						<li>プロジェクト作成</li>
					</ul>
				</div>
			</div>
			<!--//w3_short-->
		</div>
	</div>

	<!-- header-bot (로고 있는 부분) -->

	<!-- //header-bot -->
	
	<div class="row">
    <!-- 분야 설정 분야 -->
    <div class="col-sm-2"><br></div>
    <div class="col-sm-8">
      <br><br>
      <h1>カテゴリー設定</h1>
      <br><br><br>
      <h3>どんな種類のプロジェクトをする予定ですか？</h3><br>
      <p>始めるプロジェクトと一番関係があるカテゴリーを選択してください。</p>
      <form role="form" class="submitProject" id="writeForm" action="/front/project_write1" method="post" enctype="multipart/form-data">
      		<input type="hidden" name = "title_image" value="">
            <input type="hidden" name = "attach_1" value="">
            <input type="hidden" name = "contents_image1" value="">
            <input type="hidden" name = "contents_image2" value="">
        	<input type="hidden" name = "attach_2" value="">
        	<input type="hidden" name = "attach_3" value="">
     		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
     		<input type="hidden" name="userid" value="<sec:authentication property="principal.username"/>">
        <select name="category" id="category_id" class="custom-select" autofocus="autofocus">
          <option value="カテゴリー" selected>カテゴリー</option>
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
        <br><br>
        <br><br><br>
        <div class="sort-grid"></div>
        <h1 class="sectionLabel">簡略に紹介</h1>
        <br><br><br><br>
        <h3>プロジェクトを簡略に紹介してください。</h3><br>
        <textarea name="simple_content" id="simple_content" class="form-control" rows="8" cols="70%" maxlength="100" placeholder="例）英語、これさえあれば！"></textarea>
        <br><br><br>
        <div class="sort-grid"></div>
        <h1>プロジェクトの内容</h1>
        <br><br><br><br>
        <div class="col-sm-5">
          <h3>連絡先</h3>
        </div>
        <div class="col-sm-6">
          <p>
          	<sec:authentication property="principal.username"/>	
          </p><br>
          <input type="text" class="form-control" name="phone" id="phone" placeholder="電話番号（－なしに）" size="30%">
          <br><br><br>
        </div>
        <div class="col-sm-5">
          <h3>会員名</h3>
        </div>
        <div class="col-sm-6">
          <input type="text" class="form-control" name="company" id="company" placeholder="会員名" size="30%">
          <br><br><br>
        </div>
        <div class="row">
          <div class="col-sm-5">
            <h3>目標金額</h3>
          </div>
          <div class="col-sm-6">
            <input type="number" class="form-control" min="0" name="achive_invest" id="achive_invest" step="10000" placeholder="(円)">
            <br><br>
          </div>
        </div><br>
        <div class="row">
          <div class="col-sm-5">
            <h3>代表イメージ</h3>
          </div>
          <div class="col-sm-6">
            <p>- イメージのサイズは300x400以上でお願いします。</p>
          </div>
        </div><br>
        <div class="row">
          <div class="col-sm-5">
            <img src="/resources/images/uploadPicture.png" style="width:65%">
  
          </div>
          <div class="col-sm-6">
            <p>- イメージの大きさ : 3MB 未満</p>
            <br>
            <input type="file" class="form-control-file border"  id="imageUpload" name="uploadFile">
            <br><br>
          </div>
        </div><br>
        <div class="row">
          <div class="col-sm-5">
            <h3>ファイル</h3>
          </div>
          <div class="col-sm-6">
            <input type="file" class="form-control-file border" name="uploadFile">
            <br><br>
          </div>
        </div><br>
        <div class="row">
          <div class="col-sm-5">
            <h3>プロジェクトの期間</h3>
          </div>
          <div class="col-sm-6">
            <input type="date" id="project_start" name="project_start"/>~
            <input type="date" id="project_end" name="project_end"/>
            <br><br>
          </div>
        </div><br>
        
        <br><br><br>
        <div class="sort-grid"></div>
        <h1>詳しい説明</h1><br><br>
        <div class="row">
          <div class="col-sm-6">
            <div class="jumbotron">
              <img src="/resources/images/uploadPicture.png" class="setSize60"><br><br><br>
              <%-- <input type="file" class="setSize60" name="contents_image1"><br> --%>
              <input type="file" class="form-control-file border"  name="uploadFile" style="margin-left:100px;">
            </div>
          </div>
          <div class="col-sm-6">
            <div class="jumbotron">
              <img src="/resources/images/uploadPicture.png" class="setSize60"><br><br><br>
              <%--<input type="file" class="setSize60" name="contents_image2">--%> 
           	  <input type="file" class="form-control-file border"  name="uploadFile" style="margin-left:100px;">
            </div>
          </div>
          <div class="row">
            <div class="col-sm-6">
              <div style="margin-top:5%;margin-left:5%;">
                <h3>ファイル</h3>
              </div>
            </div>
            <div class="col-sm-6">
              <div style="margin-top:5%;margin-left:5%;">
                <input type="file" class="form-control-file border"  name="uploadFile">
                <br><br>
                <input type="file" class="form-control-file border"  name="uploadFile">
              </div>
            </div>
          </div>
          <div style="margin-top:5%;margin-left:5%;">
            <h3>プロジェクトの詳しい内容</h3><br>
            <textarea name="detail_content" id="detail_content" rows="12" cols="90"></textarea>
          </div>
        </div>
        <div style="margin-top:5%;margin-left:5%;">
          <input type="button" class="nButton" id="submit_btn" name="submit_btn" value="検討申し込み">
        </div><br><br>
      </form>
    </div>
    <div class="col-sm-2"><br></div>
  </div>



	<!-- //mens -->
<!--/grids-->

	<!-- login -->
	<div class="modal fade" id="myModal4" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
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
										<input type="submit" value="REGISTER NOW">
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
										<input type="checkbox" id="brand" value="">
										<label for="brand"><span></span>Remember Me.</label>
									</div>
									<div class="sign-in">
										<input type="submit" value="SIGNIN">
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
	<script src="/resources/js/responsiveslides.min.js"></script>
	<script>
		// You can also use "$(window).load(function() {"
		$(function() {
			// Slideshow 4
			$("#slider3").responsiveSlides({
				auto: true,
				pager: true,
				nav: false,
				speed: 500,
				namespace: "callbacks",
				before: function() {
					$('.events').append("<li>before event fired.</li>");
				},
				after: function() {
					$('.events').append("<li>after event fired.</li>");
				}
			});
		});
	</script>
	<script src="/resources/js/modernizr.custom.js"></script>
	<!-- Custom-JavaScript-File-Links -->
	<!-- cart-js -->
	<script src="/resources/js/minicart.min.js"></script>
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
	<!---->
	<script type='text/javascript'>
		//<![CDATA[
		$(window).load(function() {
			$("#slider-range").slider({
				range: true,
				min: 0,
				max: 9000,
				values: [1000, 7000],
				slide: function(event, ui) {
					$("#amount").val("$" + ui.values[0] + " - $" + ui.values[1]);
				}
			});
			$("#amount").val("$" + $("#slider-range").slider("values", 0) + " - $" + $("#slider-range").slider("values", 1));

		}); //]]>
	</script>
	<script type="text/javascript" src="/resources/js/jquery-ui.js"></script>
	<!---->
	<!-- start-smoth-scrolling -->
	<script type="text/javascript" src="/resources/js/move-top.js"></script>
	<script type="text/javascript" src="/resources/js/jquery.easing.min.js"></script>
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
	
	<script type="text/javascript">
		// 검색 버튼 클릭 이벤트 작업포인트
	var writeForm = $("#writeForm");
	$("#submit_btn").on("click",	function(e) {
		var target = document.getElementById("category_id");
		
   		if (target.options[target.selectedIndex].text == 'カテゴリー') {
			alert("カテゴリーを選択してください。");
			document.getElementById('category_id').focus();
			return false;
		} 
   		else if (!writeForm.find("textarea[name='simple_content']").val()) {
			alert("タイトルを入力してください。");
			document.getElementById('simple_content').focus();
			return false;
		}
   		else if (!writeForm.find("input[name='phone']").val()) {
			alert("電話番号を入力してください。");
			document.getElementById('phone').focus();
			return false;
		}
   		else if (!writeForm.find("input[name='company']").val()) {
			alert("会員名を入力してください。");
			document.getElementById('company').focus();
			return false;
		}
   		else if (!writeForm.find("input[name='achive_invest']").val()) {
			alert("目標金額を入力してください。");
			document.getElementById('achive_invest').focus();
			return false;
		}
   		else if (!writeForm.find("input[id='imageUpload']").val()) {
			alert("代表イメージをアップロードしてください。");
			document.getElementById('imageUpload').focus();
			return false;
		}
   		else if (!writeForm.find("input[name='project_start']").val()) {
			alert("開始日を入力してください。");
			document.getElementById('project_start').focus();
			return false;
		}
   		else if (!writeForm.find("input[name='project_end']").val()) {
			alert("終了日を入力してください。");
			document.getElementById('project_end').focus();
			return false;
		}
   		else if (!writeForm.find("textarea[name='detail_content']").val()) {
			alert("詳しい内容を入力してください。");
			document.getElementById('detail_content').focus();
			return false;
		}
   		else
			writeForm.submit();
	});
	</script>
	
	<!-- for bootstrap working -->
	<script type="text/javascript" src="/resources/js/bootstrap.js"></script>
	<script type="text/javascript" src="/resources/js/bootstrap2.js"></script>
</body>

</html>

