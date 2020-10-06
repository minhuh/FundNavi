<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<html lang="en">

<head>
	<%@include file="header.jsp"%>
	
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>申し込み中のプロジェクト管理</title>

  <!-- Bootstrap Core CSS -->
  <link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- MetisMenu CSS -->
  <link href="/resources/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

  <!-- Custom CSS -->
  <link href="/resources/dist/css/sb-admin-2.css" rel="stylesheet">
  <link rel="stylesheet" href="/resources/css/white.css">

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
	<fmt:formatDate var="recordDate" value="${project.project_record}" pattern="yyyy-MM-dd" />
	<fmt:formatDate var="startDate" value="${project.project_start}" pattern="yyyy-MM-dd" />
	<fmt:formatDate var="endDate" value="${project.project_end}" pattern="yyyy-MM-dd" />
	
    <div id="page-wrapper">
      <div class="cleans">a</div>
        <!-- 제목 -->
        <div class="col-sm-12">
	        <div class="col-sm-2"></div>
	        <div class="col-sm-4">
	        <form action="/admin/standBy" method="post">
	          	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	          	<input type="hidden" name="project_num" value="${project.project_num}">
	          	<input type="submit" value="[スタートする]" onclick="alert('スタートしました。?')">
	        </form>
	        </div>
	        <div class="col-sm-4">
	          <form action="/admin/delete" method="post">
	          	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	          	<input type="hidden" name="project_num" value="${project.project_num}">
	          	<input type="submit" value="[削除]" onclick="alert('削除しました。')">
	          </form>
	        </div>
	        <div class="col-sm-2"></div>
        </div>
        <div class="col-sm-2" style="background-color:lavenderblush;">
          <h5>タイトル</h5>
        </div>
        <div class="col-sm-10">
          <h5>${project.simple_content}</h5>
        </div>
        <!-- 작성일 -->
        <div class="col-sm-2" style="background-color:lavenderblush;">
          <h5>作成日付</h5>
        </div>
        <div class="col-sm-10">
          <h5>${recordDate}</h5>
        </div>
        <!-- 회사명 / 연락처 -->
        <div class="col-sm-2" style="background-color:lavenderblush;">
          <h5>会員名</h5>
        </div>
        <div class="col-sm-4">
          <h5>${project.company}</h5>
        </div>
        <div class="col-sm-2" style="background-color:lavenderblush;">
          <h5>電話番号</h5>
        </div>
        <div class="col-sm-4">
          <h5>${project.phone}</h5>
        </div>
        <!-- 카테고리 -->
        <div class="col-sm-2" style="background-color:lavenderblush;">
          <h5>カテゴリー</h5>
        </div>
        <div class="col-sm-10">
          <h5>${project.category}</h5>
        </div>
        <!-- 내용 -->
        <div class="col-sm-2" style="background-color:lavenderblush;">
          <h5>内容</h5>
        </div>
        <div class="col-sm-10">
          <h5>${project.detail_content}</h5>
        </div>
        <!-- 시작/종료 -->
        <div class="col-sm-2" style="background-color:lavenderblush;">
          <h5>開始日 ・ 終了日</h5>
        </div>
        <div class="col-sm-5">
           <h5>${startDate}</h5>
        </div>
        <div class="col-sm-5">
          <h5>${endDate}</h5>
        </div>
        <!-- 목표금액 -->
        <div class="col-sm-2" style="background-color:lavenderblush;">
          <h5>目標金額</h5>
        </div>
        <div class="col-sm-10">
          <h5>
          	<fmt:formatNumber type="number" maxFractionDigits="3" 
	        	value="${project.achive_invest}" /> 円
          </h5>
        </div>
        <!-- 첨부파일 -->
        <div class="col-sm-2" style="background-color:lavenderblush;">
          <h5>ファイル</h5>
        </div>
        <div class="col-sm-10">
          <h5>${project.attach_1}</h5>
        </div>
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
