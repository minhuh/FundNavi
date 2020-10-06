<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function myPageLogin(){
		alert("ログインしてください。");
	}
	
	function log(){
		logoutForm.submit();
	}
</script>
</head>
<body>
<!-- header -->
  <div class="header" id="home">
		<div class="container">
			<ul>
				<li>
				<!-- 비 로그인 상태 -->
				<sec:authorize access="isAnonymous()">
					<a href="#" data-toggle="modal" data-target="#myModal"><i class="fa fa-unlock-alt" aria-hidden="true"></i> 
					ログイン
					</a>
				</sec:authorize>
				<!-- 로그인 상태 -->
				<sec:authorize access="isAuthenticated()">
					<form role="form" method='post' action="/logout" name="logoutForm">
						<i class="fa fa-unlock-alt" aria-hidden="true"></i>
							<a href="#" onclick="log()">ログアウト</a>
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					</form>
				</sec:authorize>
				</li>
				<li> <a href="../join"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> 会員登録 </a></li>
				<li> 
					<sec:authorize access="isAnonymous()">
						<a href="#" onclick="myPageLogin()"><i class="fa fa-user" aria-hidden="true"></i> 
							マイページ
						</a>
					</sec:authorize>
					<sec:authorize access="isAuthenticated()">
						<a href="../myPage" ><i class="fa fa-user" aria-hidden="true"></i> 
							マイページ
						</a>
					</sec:authorize>
				</li>
				<li> <a href="../notice"><i class="fa fa-envelope-o" aria-hidden="true"></i> お問い合わせ </a></li>
			</ul>
		</div>
	</div>
  <!-- //header -->
  <!-- header-bot -->
  <div class="header-bot">
    <div class="header-bot_inner_wthreeinfo_header_mid">
      <div class="col-md-4 header-middle">
        
      </div>
      <!-- header-bot -->
      <div class="col-md-4 logo_agile">
				<h1><a href="../"><span>F</span>undNavi <i class="fa fa-shopping-bag top_logo_agile_bag" aria-hidden="true"></i></a></h1>
			</div>
      <!-- header-bot -->
      <div class="col-md-4 agileits-social top_content">
        <ul class="social-nav model-3d-0 footer-social w3_agile_social">
          <li class="share">Share On : </li>
          <li><a href="#" class="facebook">
              <div class="front"><i class="fa fa-facebook" aria-hidden="true"></i></div>
              <div class="back"><i class="fa fa-facebook" aria-hidden="true"></i></div>
            </a></li>
          <li><a href="#" class="twitter">
              <div class="front"><i class="fa fa-twitter" aria-hidden="true"></i></div>
              <div class="back"><i class="fa fa-twitter" aria-hidden="true"></i></div>
            </a></li>
          <li><a href="#" class="instagram">
              <div class="front"><i class="fa fa-instagram" aria-hidden="true"></i></div>
              <div class="back"><i class="fa fa-instagram" aria-hidden="true"></i></div>
            </a></li>
          <li><a href="#" class="pinterest">
              <div class="front"><i class="fa fa-linkedin" aria-hidden="true"></i></div>
              <div class="back"><i class="fa fa-linkedin" aria-hidden="true"></i></div>
            </a></li>
        </ul>
      </div>
      <div class="clearfix"></div>
    </div>
  </div>
  <!-- //header-bot -->
  <!-- banner -->
  <div class="ban-top">
    <div class="container">
      <div class="top_nav_left">
        <nav class="navbar navbar-default">
          <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
              <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </button>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse menu--shylock" id="bs-example-navbar-collapse-1">
              <ul class="nav navbar-nav menu__list">
                <li class="active menu__item"><a class="menu__link" href="../">メイン<span class="sr-only">(current)</span></a></li>
                <li class=" menu__item" style="margin-left:20px;"><a class="menu__link" href="/front/project">プロジェクト</a></li>
                <li class=" menu__item" style="margin-left:20px;"><a class="menu__link" href="/front/open">スタート予定</a></li>
                <li class=" menu__item" style="margin-left:20px;"><a class="menu__link" href="/front/culture_project">文化コンテンツ</a></li>
                <li class=" menu__item" style="margin-left:20px;"><a class="menu__link" href="/front/end">終了したプロジェクト</a></li>
              </ul>
            </div>
          </div>
        </nav>
      </div>
      <div class="top_nav_right">
        <div class="wthreecartaits wthreecartaits2 cart cart box_1">
          <form action="#" method="post" class="last">
          	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <input type="hidden" name="cmd" value="_cart">
            <input type="hidden" name="display" value="1">
            <!-- style.css w3view-cart 색상 변경 및 projectSubmitButton 클래스 생성 -->
            <sec:authorize access="isAnonymous()">
				<button class="w3view-cart" type="button" onclick = "myPageLogin()">
              		<h5 class="projectSubmitButton">プロジェクト申し込み</h5>
            	</button>
			</sec:authorize>
			<sec:authorize access="isAuthenticated()">
				<a href="/front/project_write">
					<button class="w3view-cart" type="button" name="submit">
	              		<h5 class="projectSubmitButton">プロジェクト申し込み</h5>
	            	</button>
            	</a>
			</sec:authorize>
          </form>

        </div>
      </div>
      <div class="clearfix"></div>
    </div>
  </div>
  <!-- //banner-top -->
  <!-- Modal1 -->
  <div class="modal fade" id="myModal" tabindex="-1" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body modal-body-sub_agile">
          <div class="col-md-8 modal_body_left modal_body_left1">
            <h3 class="agileinfo_sign">ログイン<span></span></h3>
            <form role="form" action="/login" method="post">
           
              <div class="styled-input agile-styled-input-top">
                <input type="text" name="username" required="">
                <label>E-mail</label>
                <span></span>
              </div>
              <div class="styled-input">
                <input type="password" name="password" required="">
                <label>パスワード</label>
                <span></span>
                <input type="checkbox" name="remember" value="">
                <font size="2em" color="black">セーブする</font>
              </div>
              <a href="#">
                <input type="submit" value="login">
              </a>
               <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            </form>
            <div class="styled-input">
              <p>
                <font size="2em" color="gray">登録してみましょう！</font>&nbsp;
                <a href="join">
                  <font size="4em" color="black"><ins> 会員登録 </ins></font>
                </a>
              </p>
            </div>
          </div>
          <div class="col-md-3 modal_body_right modal_body_right1" style="margin-left:25px;">
            <img src="/resources/images/log_pic.jpg" />
          </div>
          <div class="clearfix"></div>
        </div>
      </div>
      <!-- //Modal content-->
    </div>
  </div>
  <!-- //Modal1 -->
</body>
</html>