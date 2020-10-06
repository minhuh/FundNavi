<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>管理ページ</title>

<!-- Bootstrap Core CSS -->
<link href="../resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- MetisMenu CSS -->
<link href="../resources/vendor/metisMenu/metisMenu.min.css"
	rel="stylesheet">

<!-- Custom CSS -->
<link href="../resources/dist/css/sb-admin-2.css" rel="stylesheet">

<!-- Morris Charts CSS -->
<link href="../resources/vendor/morrisjs/morris.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="../resources/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<script type="text/javascript">
	function log(){
		logoutForm.submit();
	}
</script>
</head>

<body>

	<div id="wrapper">

		<!-- Navigation -->
		<nav class="navbar navbar-default navbar-static-top" role="navigation"
			style="margin-bottom: 0">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="admin_member">FundNavi</a>
			</div>
			<!-- /.navbar-header -->

			<ul class="nav navbar-top-links navbar-right">
				<!-- /.dropdown -->
				
				<!-- /.dropdown -->
				
				<!-- /.dropdown -->
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#"> <i class="fa fa-user fa-fw"></i>
						<i class="fa fa-caret-down"></i>
				</a>
					<ul class="dropdown-menu dropdown-user">
						
						
						<li>
							<form role="form" action="/logout" method="post"
								name="logoutForm">
								<a href="#" onclick="log()"> <i class="fa fa-sign-out fa-fw"></i>
									Logout
								</a> <input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" />
							</form>
						</li>
					</ul> <!-- /.dropdown-user --></li>
				<!-- /.dropdown -->
			</ul>
			<!-- /.navbar-top-links -->

			<div class="navbar-default sidebar" role="navigation">
				<div class="sidebar-nav navbar-collapse">
					<ul class="nav" id="side-menu">
						<h4 style="margin-left: 30px;">管理ページ</h4>
						<li><a href="#"><i class="fa fa-dashboard fa-fw"></i> 会員管理
						 <span class="fa arrow"></span></a>
							<ul class="nav nav-second-level">
								<li><a href="admin_member">会員リスト</a></li>
							</ul></li>
						<li><a href="#"><i class="fa fa-bar-chart-o fa-fw"></i>
								プロジェクト管理 <span class="fa arrow"></a>
							<ul class="nav nav-second-level">
								<li><a href="admin_project">進行中のプロジェクト</a></li>
								<li><a href="admin_openProject">スタート予定のプロジェクト</a></li>
								<li><a href="admin_endProject">終了したプロジェクト</a></li>
								<li><a href="admin_writeProject">申し込み中のプロジェクト</a></li>
								<li><a href="admin_removeProject">削除待機のプロジェクト</a></li>
								<li><a href="admin_comment">コメント管理</a></li>
							</ul> <!-- /.nav-second-level --></li>
						<li><a href="tables.html"><i class="fa fa-table fa-fw"></i>
								統計 <span class="fa arrow"></a>
							<ul class="nav nav-second-level">
								<li><a href="admin_dashboardProject">プロジェクトの統計</a></li>
								<li><a href="admin_invest">投資の統計</a></li>
							</ul></li>
						<li><a href="forms.html"><i class="fa fa-edit fa-fw"></i>
								お問い合わせ <span class="fa arrow"></a>
							<ul class="nav nav-second-level">
								<li><a href="admin_inqury">お知らせ</a></li>
								<li><a href="admin_1-1inqury">お問い合わせ</a></li>
							</ul></li>

					</ul>
				</div>
				<!-- /.sidebar-collapse -->
			</div>
			<!-- /.navbar-static-side -->
		</nav>
	</div>
</body>
</html>
