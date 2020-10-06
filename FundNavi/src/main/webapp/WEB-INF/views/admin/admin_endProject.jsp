<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>終了したプロジェクト</title>

<!-- Bootstrap Core CSS -->
<link href="/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- MetisMenu CSS -->
<link href="/resources/vendor/metisMenu/metisMenu.min.css"
	rel="stylesheet">

<!-- Custom CSS -->
<link href="/resources/dist/css/sb-admin-2.css" rel="stylesheet">

<!-- Morris Charts CSS -->
<link href="/resources/vendor/morrisjs/morris.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="/resources/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

<link rel="stylesheet" href="/resources/css/white.css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>
	<%@include file="header.jsp"%>

	<div id="page-wrapper">
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">終了したプロジェクトのリスト</h1>
			</div>
			<table class="table table-hover" id="endProjectTable">
				<thead>
					<tr>
						<th
							onclick="w3.sortHTML('#endProjectTable', '.item', 'td:nth-child(1)')"
							style="cursor: pointer">No</th>
						<th
							onclick="w3.sortHTML('#endProjectTable', '.item', 'td:nth-child(2)')"
							style="cursor: pointer">カテゴリー</th>
						<th
							onclick="w3.sortHTML('#endProjectTable', '.item', 'td:nth-child(3)')"
							style="cursor: pointer">プロジェクトの名</th>
						<th>もらった金額</th>
						<th
							onclick="w3.sortHTML('#endProjectTable', '.item', 'td:nth-child(5)')"
							style="cursor: pointer">会員名</th>
						<th
							onclick="w3.sortHTML('#endProjectTable', '.item', 'td:nth-child(6)')"
							style="cursor: pointer">目標率</th>
						<th>管理</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${project}" var="Project">
						<tr class="itemss">
							<td>${Project.project_num}</td>
							<td>${Project.category}</td>
							<td>${Project.simple_content}</td>
							<td><fmt:formatNumber type="number" maxFractionDigits="3" 
	        	value="${Project.current_invest}" />円</td>
							<td>${Project.company}</td>
							<td>${Project.achive}%</td>
							<td>
								<form action="/admin/delete" method="post">
									<input type="hidden" name="${_csrf.parameterName}"
										value="${_csrf.token}" /> <input type="hidden"
										name="project_num" value="${Project.project_num}"> <input
										type="submit" value="[削除]" onclick="alert('削除')">
								</form>
							</td>
						</tr>
					</c:forEach>
					<!-- <tr class="item">
              <td></td>
              <td></td>
              <td></td>
              <td></td>
              <td></td>
              <td></td>
              <td></td>
            </tr> -->
				</tbody>
			</table>
			<!-- /.col-lg-12 -->
		</div>
		<!-- /.row -->

		<!-- /.row -->
	</div>
	<!-- /#page-wrapper -->

	</div>
	<!-- /#wrapper -->

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

</body>

</html>
