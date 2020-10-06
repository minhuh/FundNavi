<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>プロジェクトの統計</title>

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
          <h1 class="page-header">プロジェクトの統計</h1>
        </div>
      </div>
      <div class="row">
        <div class="col-lg-4 col-md-6">
          <div class="panel panel-primary">
            <div class="panel-heading">
              <div class="row">
                <div class="col-xs-3">
                  <i class="glyphicon glyphicon-education fa-5x"></i>
                </div>
                <div class="col-xs-9 text-right">
                  <div class="huge">${count.countProject} つ</div>
                  <div>登録中のプロジェクト</div>
                </div>
              </div>
            </div>
              <div class="panel-footer">
                
                <div class="clearfix"></div>
              </div>
          </div>
        </div>
        <div class="col-lg-4 col-md-6">
          <div class="panel panel-green">
            <div class="panel-heading">
              <div class="row">
                <div class="col-xs-3">
                  <i class="glyphicon glyphicon-stats fa-5x"></i>
                </div>
                <div class="col-xs-9 text-right">
                  <div class="huge">${category.category}</div>
                  <div>人気のカテゴリー</div>
                </div>
              </div>
            </div>
              <div class="panel-footer">
              
                <div class="clearfix"></div>
              </div>
          </div>
        </div>
        <div class="col-lg-4 col-md-6">
          <div class="panel panel-yellow">
            <div class="panel-heading">
              <div class="row">
                <div class="col-xs-3">
                  <i class="glyphicon glyphicon-user fa-5x"></i>
                </div>
                <div class="col-xs-9 text-right">
                  <div class="huge">${count.countUser} 名</div>
                  <div>投資家会員の人数</div>
                </div>
              </div>
            </div>
              <div class="panel-footer">

                <div class="clearfix"></div>
              </div>
          </div>
        </div>
        <div class="col-lg-12"></div>
        <div class="col-lg-12">
          <h4>プロジェクトのランキング</h4>

          <ul class="nav nav-tabs" role="tablist">
              <li class="nav-item">
                <a class="nav-link active" data-toggle="tab" href="#home">進行中</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#menu1">終了</a>
              </li>
            </ul>

            <!-- Tab panes -->
            <div class="tab-content">
              <div id="home" class="container tab-pane active">
                <table class="table table-hover" id="categoryTableIng" style="width:84%;">
                  <thead>
                    <tr>
                      <th onclick="w3.sortHTML('#categoryTableIng', '.item', 'td:nth-child(1)')" style="cursor:pointer">
                        No</th>
                      <th onclick="w3.sortHTML('#categoryTableIng', '.item', 'td:nth-child(2)')" style="cursor:pointer">
                        カテゴリー</th>
                      <th onclick="w3.sortHTML('#categoryTableIng', '.item', 'td:nth-child(3)')" style="cursor:pointer">
                        プロジェクト名</th>
                      <th>もらっている金額</th>
                      <th onclick="w3.sortHTML('#categoryTableIng', '.item', 'td:nth-child(5)')" style="cursor:pointer">
                        終了日</th>
                      <th onclick="w3.sortHTML('#categoryTableIng', '.item', 'td:nth-child(6)')" style="cursor:pointer">
                        会員名</th>
                    </tr>
                  </thead>
                  <tbody>
                  	<c:forEach items="${project}" var="Project">
                  	<fmt:formatDate var="endDate" value="${Project.project_end}" pattern="yyyy-MM-dd" />
	                    <tr class="item">
	                      <td>${Project.rownum}</td>
	                      <td>${Project.category}</td>
	                      <td>${Project.simple_content}</td>
	                      <td>
	                      	<fmt:formatNumber type="number" maxFractionDigits="3" 
	        				value="${Project.current_invest}" />円
	        			  </td>
	                      <td>${endDate}</td>
	                      <td>${Project.company}</td>
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
              </div>
              <div id="menu1" class="container tab-pane fade">
                <table class="table table-hover" id="categoryTableEnd" style="width:84%;">
                  <thead>
                    <tr>
                      <th onclick="w3.sortHTML('#categoryTableEnd', '.item', 'td:nth-child(1)')" style="cursor:pointer">
                        No</th>
                      <th onclick="w3.sortHTML('#categoryTableEnd', '.item', 'td:nth-child(2)')" style="cursor:pointer">
                        カテゴリー</th>
                      <th onclick="w3.sortHTML('#categoryTableEnd', '.item', 'td:nth-child(3)')" style="cursor:pointer">
                        プロジェクト名</th>
                      <th>もらった金額</th>
                      <th onclick="w3.sortHTML('#categoryTableEnd', '.item', 'td:nth-child(5)')" style="cursor:pointer">
                        会員名</th>
                      <th onclick="w3.sortHTML('#categoryTableEnd', '.item', 'td:nth-child(6)')" style="cursor:pointer">
                        目標率</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr class="item">
                      <td></td>
                      <td></td>
                      <td></td>
                      <td></td>
                      <td></td>
                      <td></td>
                    </tr>

                  </tbody>
                </table>
              </div>
            </div>
      </div>
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
