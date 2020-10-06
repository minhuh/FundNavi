<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>

<head>
  <title>ありがとうございます！</title>
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

    $(document).ready(function() {
      $(".menu>a").click(function() {
        var submenu = $(this).next("ul");

        // submenu 가 화면상에 보일때는 위로 보드랍게 접고 아니면 아래로 보드랍게 펼치기
        if (submenu.is(":visible")) {
          submenu.slideUp();
        } else {
          submenu.slideDown();
        }
      }).mouseover(function() {
        $(this).next("ul").slideDown();
      });

    });
  </script>

  <script>
    function checkid() {
      var userid = document.getElementById("uid").value;
      if (userid) {
        url = "check.php?userid=" + userid;
        window.open(url, "chkid", "width=300,height=100");
      } else {
        alert("IDを入力してください。");
      }
    }
  </script>

  <style>
    .menu a {
      cursor: pointer;
    }

    .menu .hide {
      display: none;
    }
  </style>

  <!--//tags -->
  <link href="resources/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
  <link href="resources/css/style.css" rel="stylesheet" type="text/css" media="all" />
  <link href="resources/css/mstyle.css" rel="stylesheet" type="text/css" media="all" />
  <link href="resources/css/font-awesome.css" rel="stylesheet">
  <!-- //for bootstrap working -->
  <link href="//fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800" rel="stylesheet">

  <link href='//fonts.googleapis.com/css?family=Lato:400,100,100italic,300,300italic,400italic,700,900,900italic,700italic' rel='stylesheet' type='text/css'>
</head>

<body>
  <!-- header -->
   <%@include file="header.jsp"%>
  <!-- /banner_bottom_agile_info -->
  <div class="page-head_agile_info_w3l">
    <div class="container">
      <h3>J<span>oin Us </span></h3>
      <!--/w3_short-->
      <div class="services-breadcrumb">
        <div class="agile_inner_breadcrumb">

          <ul class="w3_short">
            <li><a href="../">メインページ</a><i>|</i></li>
            <li>会員登録</li>
          </ul>
        </div>
      </div>
      <!--//w3_short-->
    </div>
  </div>
  <!--/contact-->
  <div class="banner_bottom_agile_info">
    <div class="container">
      <div class="contact-grid-agile-w3s">
        <div class="col-md-4 contact-grid-agile-w3">
          <div class="contact-grid-agile-w31">
            <i class="fa fa-ban" aria-hidden="true"></i>
            <h4>非会員</h4>
            <p>見ること以外はできません。 <span>会員登録をしてサービスを利用してみましょう！</span></p>
          </div>
        </div>
        <div class="col-md-4 contact-grid-agile-w3">
          <div class="contact-grid-agile-w32">
            <i class="fa fa-user" aria-hidden="true"></i>
            <h4>一般会員</h4>
            <p>会員サービスの利用ができます。 <span>会員様のプロジェクトを教えてください！</span></p>
          </div>
        </div>
        <div class="col-md-4 contact-grid-agile-w3">
          <div class="contact-grid-agile-w33">
            <i class="fa fa-credit-card" aria-hidden="true"></i>
            <h4>投資家会員</h4>
            <p>登録サービスも利用できます。 <span>ファンディングサービスも楽しんでください！</span></p>
          </div>
        </div>
        <div class="clearfix"> </div>
      </div>
    </div>
  </div>
  <div class="banner_bottom_agile_info">
    <div class="container">
      <div class="agile-contact-grids">
        <div class="agile-contact-left">
          <div class="col-md-6 contact-form">
            <h2 class="white-w3ls">会員 <span>登録完了</span></h2>
            <form action="home" method="post">
              <div class="styled-input">
                <font size="3em" color="white">
                  <br><br>
                  情報登録<br>
                  誠にありがとうございます。<br>
                  アイデアとファンディン。FundNavi。
                </font>
                <a href="../">
            <input type="button" id="bnt" value="戻る">
          </a>
              </div>
            </form>
            <div class="styled-input">
              <p>
              </p>
            </div>
          </div>
          <div class="clearfix"> </div>
        </div>
      </div>
    </div>
    </div>
    <!--//contact-->
    <!--/grids-->
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <!--grids-->
    <!-- footer -->
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
    <script type="text/javascript" src="resources/js/jquery-2.1.4.min.js"></script>
    <!-- //js -->
    <script src="resources/js/modernizr.custom.js"></script>
    <!-- Custom-JavaScript-File-Links -->
    <!-- cart-js -->
    <script src="resources/js/minicart.min.js"></script>
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
    <!-- script for responsive tabs -->
    <script src="resources/js/easy-responsive-tabs.js"></script>
    <script>
      $(document).ready(function() {
        $('#horizontalTab').easyResponsiveTabs({
          type: 'default', //Types: default, vertical, accordion
          width: 'auto', //auto or any width like 600px
          fit: true, // 100% fit in a container
          closed: 'accordion', // Start closed if in accordion view
          activate: function(event) { // Callback function if tab is switched
            var $tab = $(this);
            var $info = $('#tabInfo');
            var $name = $('span', $info);
            $name.text($tab.text());
            $info.show();
          }
        });
        $('#verticalTab').easyResponsiveTabs({
          type: 'vertical',
          width: 'auto',
          fit: true
        });
      });
    </script>
    <!-- //script for responsive tabs -->
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
