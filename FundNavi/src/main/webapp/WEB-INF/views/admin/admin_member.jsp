<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>会員管理</title>

  <!-- Bootstrap Core CSS -->
  <link href="../resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- MetisMenu CSS -->
  <link href="../resources/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

  <!-- Custom CSS -->
  <link href="../resources/dist/css/sb-admin-2.css" rel="stylesheet">

  <!-- Morris Charts CSS -->
  <link href="../resources/vendor/morrisjs/morris.css" rel="stylesheet">

  <!-- Custom Fonts -->
  <link href="../resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

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
          <h1 class="page-header">会員リスト</h1>
        </div>
        <table class="table table-hover" id="myTable">
    <thead>
      <!-- 태그 누르면 정렬됨 -->
      <tr class="item">
        <th onclick="w3.sortHTML('#myTable', '.itemss', 'td:nth-child(1)')" style="cursor:pointer">会員名</th>
        <th onclick="w3.sortHTML('#myTable', '.itemss', 'td:nth-child(2)')" style="cursor:pointer">ニックネーム</th>
        <th>電話番号</th>
        <th>e-mail</th>
        <th onclick="w3.sortHTML('#myTable', '.itemss', 'td:nth-child(5)')" style="cursor:pointer">住所</th>
        <th onclick="w3.sortHTML('#myTable', '.itemss', 'td:nth-child(6)')" style="cursor:pointer">職業</th>
        <th>口座番号</th>
        <th onclick="w3.sortHTML('#myTable', '.itemss', 'td:nth-child(8)')" style="cursor:pointer">認証の有り無し</th>
      </tr>
    </thead>
    <tbody>
    <c:forEach items="${member}" var="Member">
    	<tr class="itemss">
	        <td>${Member.name}</td>
	        <td>${Member.nickname}</td>
	        <td>${Member.phone}</td>
	        <td>${Member.userid}</td>
	        <td>${Member.address}</td>
	        <td>
	        	${Member.nowJob}
	        </td>
	        <td>
	        	${Member.acc}
	        </td>
	        <td>
	        	<c:choose>
	        		<c:when test="${Member.acc == '無し'}">
	        			X
	        		</c:when>
	        		<c:otherwise>
	        			O
	        		</c:otherwise>
	        	</c:choose>
	        </td>
      	</tr>
    </c:forEach>
      
      <!-- <tr class="itemss">
        <td></td>
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

  <!-- /#wrapper -->

  <!-- jQuery -->
  <script src="/../resources/vendor/jquery/jquery.min.js"></script>

  <!-- Bootstrap Core JavaScript -->
  <script src="/../resources/vendor/bootstrap/js/bootstrap.min.js"></script>

  <!-- Metis Menu Plugin JavaScript -->
  <script src="/../resources/vendor/metisMenu/metisMenu.min.js"></script>

  <!-- Morris Charts JavaScript -->
  <script src="/../resources/vendor/raphael/raphael.min.js"></script>
  <script src="/../resources/vendor/morrisjs/morris.min.js"></script>
  <script src="/../resources/data/morris-data.js"></script>

  <!-- Custom Theme JavaScript -->
  <script src="/../resources/dist/js/sb-admin-2.js"></script>
  <script type="text/javascript" src="/../resources/js/w3.js"></script>

</body>

</html>
