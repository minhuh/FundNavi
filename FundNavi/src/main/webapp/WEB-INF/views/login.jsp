<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>ログイン</title>

<!-- Bootstrap Core CSS -->
<link href="/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- MetisMenu CSS -->
<link href="/resources/vendor/metisMenu/metisMenu.min.css"
	rel="stylesheet">

<!-- Custom CSS -->
<link href="/resources/dist/css/sb-admin-2.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="/resources/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

	<!-- Modal content-->
	<div class="modal-body modal-body-sub_agile">
		<div class="col-md-4"></div>
		<div class="col-md-4">
			<h3 class="agileinfo_sign" style="text-align: center;">
				<span>ログイン</span>
			</h3>
			<br>
			<form role="form" method='post' action="/login">
				<fieldset>
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
					<div class="form-group">
						<input class="form-control" placeholder="ID" name="username"
							type="text" autofocus>
						<c:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION}">
							<font color="red">
								<p>
									Your login attempt was not successful due to <br />
									${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}
								</p> <c:remove var="SPRING_SECURITY_LAST_EXCEPTION" scope="session" />
							</font>
						</c:if>
					</div>
					<div class="form-group">
						<input class="form-control" placeholder="パスワード" name="password"
							type="password" value="">
					</div>
					<div class="checkbox">
						<label> <input name="remember-me" type="checkbox">セーブする
						</label>
					</div>
					<!-- Change this to a button or input when using this as a form -->
					<a href="index.html" class="btn btn-lg btn-success btn-block">ログイン</a>
				</fieldset>

			</form>
			<div class="styled-input">
				<p>
					<br> <font size="2em" color="gray">まだ会員ではありませんか？</font>&nbsp;

					<a href="join"> <font size="4em" color="black"><ins>
								会員登録 </ins></font>
					</a>
					<br><br><br><br><br><br>
					<a href="../" class="btn btn-warning btn-lg btn-block">メインページへ</a>
				</p>
			</div>
		</div>
		<div class="clearfix"></div>
	</div>
	<!-- //Modal content-->





	<!-- jQuery -->
	<script src="/resources/vendor/jquery/jquery.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>

	<!-- Metis Menu Plugin JavaScript -->
	<script src="/resources/vendor/metisMenu/metisMenu.min.js"></script>

	<!-- Custom Theme JavaScript -->
	<script src="/resources/dist/js/sb-admin-2.js"></script>
	<script>
  
  
  
  
  $(".btn-success").on("click", function(e){
    
    e.preventDefault();
    $("form").submit();
    
  });
  
  </script>

	<c:if test="${param.logout != null}">
		<script>
      $(document).ready(function(){
      	alert("ログアウトしました。");
      });
      </script>
	</c:if>

</body>

</html>
