<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>コメント管理</title>

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
	<%@include file="header.jsp"%>

    <div id="page-wrapper">
      <div class="row">
        <div class="col-lg-12">
          <h1 class="page-header">コメントのリスト</h1>
        </div>
        <table class="table table-hover" id="openTable">
    <thead>
      <tr>
        <th onclick="w3.sortHTML('#openTable', '.itemss', 'td:nth-child(1)')" style="cursor:pointer">No</th>
        <th onclick="w3.sortHTML('#openTable', '.itemss', 'td:nth-child(2)')" style="cursor:pointer">プロジェクト名</th>
        <th>内容</th>
        <th onclick="w3.sortHTML('#openTable', '.itemss', 'td:nth-child(4)')" style="cursor:pointer">会員名</th>
        <th onclick="w3.sortHTML('#openTable', '.itemss', 'td:nth-child(5)')" style="cursor:pointer">作成日付</th>
        <th>管理</th>
      </tr>
    </thead>
    <tbody>
    <c:forEach items="${comment}" var="Comment">
    <fmt:formatDate var="Reg_date" value="${Comment.reg_date}" pattern="yyyy-MM-dd hh:mm:ss" />
      <tr class="itemss">
        <td>${Comment.ripple_num}</td>
        <td>${Comment.simple_content}</td>
        <td>${Comment.content}</td>
        <td>${Comment.userid}</td>
        <td>${Reg_date}</td>
        <td>
			<form action="/admin/com_delete" method="post">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
				<input type="hidden" name="ripple_num" value="${Comment.ripple_num}"> 
				<input type="submit" value="[削除]" onclick="alert('削除しました。')">
			</form>
        </td>
      </tr>
      <c:forEach items="${ripple}" var="Ripple">
      	<fmt:formatDate var="RReg_date" value="${Ripple.reg_date}" pattern="yyyy-MM-dd hh:mm:ss" />  
		      <c:if test="${Comment.ripple_num == Ripple.ripple_num}">
		      	<tr class="itemss" style="background-color:#e6e6e6">
			        <td></td>
			        <td>--(コメント返し)</td>
			        <td>${Ripple.content}</td>
			        <td>${Ripple.userid}</td>
			        <td>${RReg_date}</td>
			        <td>
			        	<form action="/admin/rip_delete" method="post">
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
							<input type="hidden" name="ripple_ripple_num" value="${Ripple.ripple_ripple_num}"> 
							<input type="submit" value="[削除]" onclick="alert('削除しました。')">
						</form>
			        </td>
			    </tr>
			  </c:if>
      </c:forEach>
	</c:forEach>
      <!-- <tr class="itemss">
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
