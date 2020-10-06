<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>


<!DOCTYPE html>
<html>

<head>
<title>プロジェクト</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://www.gstatic.com/charts/loader.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<script type="text/javascript">
	function myPageLogin() {
		alert("ログインしてください。");
	}
</script>

<!--새로 추가한 것 여기부터-->

<!--새로 추가한 바 그래프-->
<script src="//www.google.com/jsapi"></script>
	<c:set var = "sum" value = "0" />
	<c:set var = "sum2" value = "0" />
	<c:set var = "sum3" value = "0" />
	<c:set var = "sum4" value = "0" />
	<c:set var = "sum5" value = "0" />
	<c:set var = "investor_total" value = "0"/>

	<c:forEach items="${investorList}" var="investor">
	<c:set var = "investor_total" value="${investor_total + 1}"/>
	<c:choose>
	<c:when test="${investor.score eq 1}">
	<c:set var= "sum" value="${sum + 1}"/>
	</c:when>

	<c:when test="${investor.score eq 2}">
	<c:set var= "sum2" value="${sum2 + 1}"/>
	</c:when>

	<c:when test="${investor.score eq 3}">
	<c:set var= "sum3" value="${sum3 + 1}"/>
	</c:when>

	<c:when test="${investor.score eq 4}">
	<c:set var= "sum4" value="${sum4 + 1}"/>
	</c:when>

	<c:when test="${investor.score eq 5}">
	<c:set var= "sum5" value="${sum5 + 1}"/>
	</c:when>

	</c:choose>
	</c:forEach>
<script type="text/javascript">
var myChart = {
		"type" : "bar",
		"title" : {
			"text" : "プロジェクトのグラフ"
		},

		"plot" : {
			"value-box" : {
				"text" : "%v"
			},
			"tooltip" : {
				"text" : "%v"
			}
		},
		"scale-x" : {
			"values" : [ "収益性", "安定性", "成長性", "市場性", "総合" ]
		},
		"series" : [ {
			"values" : [ <c:out value="${sum}"/>, <c:out value="${sum2}"/>,
					<c:out value="${sum3}"/>, <c:out value="${sum4}"/>,
					<c:out value="${sum5}"/> ],
		} ]
	};

	function clearTextarea() {
		/* 텍스트박스 지우는 부분 */
		$('#ripple').val('');
	}

	function clearInput() {
		$('#invest_content').val('');
	}
</script>


<script>
	function onlyNumber(event) {
		event = event || window.event;
		var keyID = (event.which) ? event.which : event.keyCode;
		if ((keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105)
				|| keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39)
			return;
		else
			return false;
	}
	function removeChar(event) {
		event = event || window.event;
		var keyID = (event.which) ? event.which : event.keyCode;
		if (keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39)
			return;
		else
			event.target.value = event.target.value.replace(/[^0-9]/g, "");
	}
</script>
<!--여기까지 바 그래프-->
	<c:set var = "ssum" value = "0" />
	<c:set var = "ssum2" value = "0" />
	<c:set var = "ssum3" value = "0" />
	<c:set var = "ssum4" value = "0" />
	<c:set var = "ssum5" value = "0" />
	<c:set var = "sinvestor_total" value = "0"/>



	<c:forEach items="${investorList}" var="investor">
		<c:set var = "sinvestor_total" value="${sinvestor_total + 1}"/>
		<c:choose>
			<c:when test="${investor.job == '公務員'}">
				<c:set var= "ssum" value="${ssum + 1}"/>
			</c:when>
		
			<c:when test="${investor.job == 'CEO'.toString()}">
				<c:set var= "ssum2" value="${ssum2 + 1}"/>
			</c:when>
		
			<c:when test="${investor.job eq '営業'.toString()}">
				<c:set var= "ssum3" value="${ssum3 + 1}"/>
			</c:when>
		
			<c:when test="${investor.job eq '学生'.toString()}">
				<c:set var= "ssum4" value="${ssum4 + 1}"/>
			</c:when>
		
			<c:when test="${investor.job eq 'その他'.toString()}">
				<c:set var= "ssum5" value="${ssum5 + 1}"/>
			</c:when>
		</c:choose>
	</c:forEach>





<!-- 도넛 그래프 시작 -->
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	var dd = 12;
	google.charts.load("current", {
		packages : [ "corechart" ]
	});
	google.charts.setOnLoadCallback(drawChart);

	function drawChart() {
		var data = google.visualization.arrayToDataTable([
				[ 'Task', 'Hours per Day' ],
				[ '無し' + ' ' + 0 + '名',1 ],
				[ '公務員' + ' ' + <c:out value="${ssum}"/> + '名',<c:out value="${ssum}"/> ],
				[ 'CEO' + ' ' + <c:out value="${ssum2}"/> + '名',<c:out value="${ssum2}"/> ],
				[ '営業' + ' ' + <c:out value="${ssum3}"/> + '名',<c:out value="${ssum3}"/> ],
				[ '学生' + ' ' + <c:out value="${ssum4}"/> + '名',<c:out value="${ssum4}"/> ],
				[ 'その他' + ' ' + <c:out value="${ssum5}"/> + '名',<c:out value="${ssum5}"/> ] ]);

		var options = {
			title : '投稿者の現況',
			pieHole : 0.7,
			width : 380,
			height : 200,
			pieSliceText : 'none',
			fontSize : 11,
			enableInteractivity : false,
		};

		var chart = new google.visualization.PieChart(document
				.getElementById('donutchart'));
		chart.draw(data, options);
	}
</script>

<script type="text/javascript">
	
</script>
<!--바 그래프-->
<script src="/resources/js/zingchart.min.js"></script>

<!--여기까지-->


<style>
img {
	display: block;
	margin: 0px auto;
}
</style>


<!--새로 추가한 것 여기까지-->


<!--/tags -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="" />
<script type="application/x-javascript">
	
    addEventListener("load", function() {
      setTimeout(hideURLbar, 0);
    }, false);

    function hideURLbar() {
      window.scrollTo(0, 1);
    }
  
</script>
<!-- //tags -->
<link href="/resources/css/bootstrap.css" rel="stylesheet"
	type="text/css" media="all" />
<link href="/resources/css/istyle.css" rel="stylesheet" type="text/css"
	media="all" />
<link rel="stylesheet" href="/resources/css/flexslider.css"
	type="text/css" media="screen" />
<link href="/resources/css/font-awesome.css" rel="stylesheet">
<link href="/resources/css/easy-responsive-tabs.css" rel='stylesheet'
	type='text/css' />
<link href="/resources/css/style.css" rel="stylesheet" type="text/css"
	media="all" />

<!-- //for bootstrap working -->
<link
	href="//fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800"
	rel="stylesheet">
<link
	href='//fonts.googleapis.com/css?family=Lato:400,100,100italic,300,300italic,400italic,700,900,900italic,700italic'
	rel='stylesheet' type='text/css'>
</head>
<% 
String nowUserId="";
String contentUserId="";
%>
<body>
	<%@include file="header.jsp"%>
	<c:if test="${not empty project.title_image}">
		<c:set var="imageLink" value="/resources/upload/${project.title_image}"></c:set>
	</c:if>
	<c:if test="${empty project.title_image}">
		<c:set var="imageLink" value="/resources/img/no_img.png"></c:set>
	</c:if>

	<!-- /banner_bottom_agile_info -->
	<div class="bgBlur page-head_agile_info_w3l" id="blurBanner" style="background-image: url('${imageLink}');">
		<div class="container" style="">
			<h3>${project.simple_content}</h3>
		</div>
			<!--/w3_short-->
			<div class="services-breadcrumb">
				<div class="agile_inner_breadcrumb" style="padding: 0 0 0 50px;">

					<ul class="w3_short">
						<li><a href="../">メインページ</a><i>|</i></li>
						<li>進行中のプロジェクト</li>
					</ul>
				</div>
			</div>
			<!--//w3_short-->
	</div>

	<!-- banner-bootom-w3-agileits -->
	<div class="banner-bootom-w3-agileits">
		<div class="container">




			<!--테스트용 두개 붙이기-->
			<div class="container-fluid" style="height: 100%;">
				<!-- <div class="row" > -->
				<!-- 이미지 및 글자 출력 상단 div -->
				<div class="col-md-4-1" style="float: top; width: 100%; height:40%;">


					<div class="grid images_3_of_2" style="float: left; width: 60%;">

						<div class="flexslider">
								<div class="thumb-image">
									<img src="${imageLink}"
										data-imagezoom="true" class="img-responsive"
										style="width: 650px; height: 350px;">
								</div>
							<div class="clearfix"></div>
						</div>
					</div>
					
					<div class="col-md-8-1" style="float: right; width: 37%; margin: 0 0 0 20px;">
					<h3>
						<span class="item_price"> <!--날짜 계산  --> <jsp:useBean
								id="now" class="java.util.Date" /> <fmt:formatDate value="${project.project_start}" pattern="yyyy-MM-dd"
								var="openDate" /> <fmt:formatDate value="${project.project_end}"
								pattern="yyyy-MM-dd" var="closeDate" /> <fmt:formatDate
								value="${now}" pattern="yyyy-MM-dd" var="nowDate" /><fmt:parseDate value="${openDate}"
								var="strPlanDate" pattern="yyyy-MM-dd" /> <fmt:parseNumber
								value="${strPlanDate.time / (1000*60*60*24)}" integerOnly="true"
								var="strDate"></fmt:parseNumber> <fmt:parseDate
								value="${closeDate}" var="endPlanDate" pattern="yyyy-MM-dd" /> <fmt:parseNumber
								value="${endPlanDate.time / (1000*60*60*24)}" integerOnly="true"
								var="endDate"></fmt:parseNumber> <fmt:parseDate
								value="${nowDate}" var="nowPlanDate" pattern="yyyy-MM-dd" /> <fmt:parseNumber
								value="${nowPlanDate.time / (1000*60*60*24)}" integerOnly="true"
								var="nowDate"></fmt:parseNumber> ${endDate - nowDate} 日残りました。<!--날짜 계산 end  -->

						</span>
					</h3>
					<br>
					<div class="progress">
						<div class="progress-bar progress-bar-success"
							style="width: ${(project.current_invest / project.achive_invest) * 100}%"><fmt:formatNumber value="${(project.current_invest / project.achive_invest) * 100}" pattern="##.#" />%</div>
						<!--모금현황-->
					</div>
					<p>
						<span style="font-size: 25px;"><fmt:formatNumber value="${(project.current_invest / project.achive_invest) * 100}" pattern="##.#" /></span>
						% 達成
					</p>
					<br> <br>
					<p>
						<span class="item_price" style="font-size: 25px;"><fmt:formatNumber
								value="${project.current_invest}" pattern="#,###,###,###,###" /></span>円
					</p>
					<br>
					<p>
						<span style="font-size: 25px;"><c:out
								value="${investor_total}" /></span>名の投資家様
					</p>
					<br>

					<br>



					<!--투자버튼 여기부터 시작-->		
												<sec:authorize access="isAnonymous()">
													
														<a href="#" onclick="myPageLogin()" class='btn btn-primary btn-xs pull-right' style="width:400px; height:35px;"><h3>ファンディングする</h3></a>
												</sec:authorize>
												
					<sec:authorize access="isAuthenticated()">
						<c:if test="${not empty login_info.bank}">
							<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#invest_button" style="width: 400px;" id="test2">ファンディングする</button>	
						</c:if>
						<c:if test="${empty login_info.bank}">
							<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#invest_button" style="width: 400px;" id="iregister" onclick="location.href='../investorjoin'">投資会員登録</button>	
						</c:if>
					</sec:authorize>
					
					
					
					<!-- The Modal -->
					<div class="modal fade" id="invest_button">
						<div class="modal-dialog">
							<div class="modal-content">
								<form class="" action="../invest/funding" method="post">
									<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
									<input type="hidden" name="project_num" value="${project.project_num}" />
									<input type="hidden" name="job" value="${login_info.job}">
									<!-- Modal Header -->
									<div class="modal-header">
										<h4 class="modal-title">ファンディング</h4>
										<button type="button" class="close" data-dismiss="modal">&times;</button>
									</div>
									<!-- Modal body -->
									<div class="modal-body">
																
										金額入力 <br> <input type="text" class="form-control"
											placeholder="投資する金額を入力してください。" id="invest_content"
											name="amount" onkeydown='return onlyNumber(event)'
											onkeyup='removeChar(event)' onfocusout='removeChar(event)'>
											<input type = "hidden" name="userid" value="${login_user.userid}">

										<br>
										
										<h4>ファンディングのきっかけを教えてください。</h4>

										<input type="radio" name="score" value=1 checked>収益性
										<input type="radio" name="score" value=2>安定性 
										<input type="radio" name="score" value=3>成長性
										<input type="radio" name="score" value=4>市場性 
										<input type="radio" name="score" value=5>総合 <br>
									
									
									</div>

									<!-- Modal footer -->
									<div class="modal-footer">

										
										&nbsp;&nbsp; <input type="submit" class="btn btn-danger2"
											name="submit" value="ファンディングする" class="button">
										<button type="button" class="btn btn-danger"
											data-dismiss="modal" onclick="clearInput()">戻る</button>
									</div>

								</form>
							</div>
						</div>
					</div>
					<!--투자버튼 여기까지-->

				</div>
					
				</div>
				<!-- //이미지 및 글자 출력 상단 div -->
				
				
				
					<!-- 하단 div -->
					<div class="container-fluid" style="width:100%; float: bottom; width: 100%; height:40%;">
						
						<div class="row2" style="float:left; width:50%;">
							<div class="col-sm-4-1">
								<div id="myChart" style="width: 300px;"></div>
								<!-- <div id="barchart_values"></div> -->
							</div>
							<div class="col-sm-8-1">
								<div id="donutchart" style="padding: 0px 0px 0px 80px;"></div>
							</div>
						</div>
					
							<div class="col-md-8-1" style=" margin: 0 0 0 0; float:right; width:40%;">
							<!--새로 추가할 컨텐츠-->
							投稿者の情報
							<div style="border: 1px solid gray; margin: 10px; height: 200px;">
								<div style="height: 60%;">
									<div style="float: left; width: 40%; height: 100%;">
										<c:if test="${not empty project.profile_image}">
											<img src="/resources/upload/${project.profile_image}" style="width: 100px; height: 100px;" class="mr-3 mt-3 rounded-circle">
										</c:if>
										<c:if test="${empty project.profile_image}">
											<img src="http://placehold.it/700x600" alt="John Doe" class="mr-3 mt-3 rounded-circle" style="width: 100px; height: 100px;">
										</c:if>
									</div>
									<div style="float: left; width: 60%; ">
										<p>会員名 : <strong style="font-size: 15px;"><c:out value="${project.company}"/></strong></p>
										
										<p><c:out value="${project.self_introduce}"/></p>
									</div>
								</div>
								<div style="height: 40%;">
									<div id="flip" style="margin: 10px 0px 0px 0px;">連絡先</div>
								</div>
								<div id="panel" style="width: 100%;">
									<p>Address :<c:out value="${project.address}"/></p>
									<p>Phone :<c:out value="${project.phone}"/></p>
									<p>Email :<a href="mailto:${project.userid}"> ${project.userid}</a></p>
								</div>
							</div>
		
						</div>	
						
						
						
				</div>
				<!-- //하단 div -->
			</div>

			<div class="clearfix"></div>

			<!-- /new_arrivals -->
			<div class="responsive_tabs_agileits"
				style="width: 960px; margin: 0 auto; padding-bottom: 30px; overflow: hidden;">
				<div id="horizontalTab">
					<ul class="resp-tabs-list"
						style="width: 500px; margin-left: auto; margin-right: auto;">
						<li>内容</li>
						<li>投稿者</li>
						<li>コメント</li>
					</ul>
					<div class="resp-tabs-container">
						<!--/tab_one-->
						<div class="tab1">
							<div class="single_page_agile_its_w3ls">
								<h2>説明</h2>
								<img src="/resources/upload/${project.contents_image1}"
									style="width: 900px;"><br>
								<h3>内容</h3>
								<p class="w3ls_para">
									<c:out value="${project.detail_content}"></c:out>
								</p>
								<img src="/resources/upload/${project.contents_image2}"
									style="width: 900px;">
							</div>
						</div>
	
						<!--//tab_one-->
						<!--투자자 총 인원수 구하는 기능-->
						<c:set var = "invest_total" value = "0" />

						<c:forEach items="${investorList}" var="invest_cnt">     
							<c:set var= "invest_total" value="${invest_total + 1}"/>
						</c:forEach>
						
						<!--//투자자 총 인원수 구하는 기능-->
						
						<div class="tab2">
							<div class="single_page_agile_its_w3ls">
								<p style="font-size:25px; color:black;">このプロジェクトに</p>
								<p><strong style="font-size: 25px; color: #00CCCC;"><c:out value="${invest_total}"/></strong><span style="font-size:25px; color:black;">名の方が参加しました。</span></p>
								
									<div class="bootstrap-tab-text-grid">
										<c:forEach items="${investorList}" var="investor">
										<fmt:formatDate value="${investor.invest_date}" pattern="yyyy-MM-dd HH:mm" var="invest_date" />
											<div class="media p-3">
													<c:if test="${not empty investor.profile_image}">
														<img src="/resources/upload/${investor.profile_image}" style="width: 60px;" class="mr-3 mt-3 rounded-circle">
													</c:if>
													<c:if test="${empty investor.profile_image}">
														<img src="http://placehold.it/700x600" alt="John Doe" class="mr-3 mt-3 rounded-circle" style="width: 60px;">
													</c:if>
												<div class="media-body">
													<br>
													<h4>
														<c:out value="${investor.userid}" />
														<small><i><c:out value="${invest_date}" /></i></small>
													</h4>
													<p style="font-size: 20px;">
														<strong style="font-size: 20px;"><c:out value="${investor.nickname}" /></strong>様が
														<strong style="font-size: 20px;"><fmt:formatNumber value="${investor.amount}" pattern="#,###,###,###,###" />円</strong>をファンディングしました。
													</p>
												</div>
										</div>
										</c:forEach>
										<div class="clearfix"></div>
									</div>
								
							</div>
						</div>

						<div class="tab3">
							<div class="single_page_agile_its_w3ls">
								<!-- 댓글 출력 부분 -->
								<div class='row'>
									<div class="col-lg-12">
										<!-- /.panel -->
										<div class="panel panel-default">

											<div class="panel-heading">
												<i class="fa fa-ripples fa-fw"></i>コメント

												<sec:authorize access="isAnonymous()">
													<a href="#" onclick="myPageLogin()"
														class='btn btn-primary btn-xs pull-right'>コメント作成 </a>
												</sec:authorize>
												<sec:authorize access="isAuthenticated()">
													<button id='addReplyBtn'
														class='btn btn-primary btn-xs pull-right'>コメント作成</button>
												</sec:authorize>

											</div>
											<c:forEach items="${ripple}" var="ripple2">
												<div class="media p-3">
													<img src="http://placehold.it/700x600" alt="John Doe"
														class="mr-3 mt-3 rounded-circle" style="width: 60px;">
													<div class="media-body">
														<br>
														<h4>
															<c:out value="${ripple2.userid}"></c:out>
															<sec:authorize access="isAuthenticated()">
											<form name="values">
												<input type="hidden" name="ripple_userid" id="ripple_userid" value="${ripple2.userid}" />
												<input type="hidden" name="c_ripple_userid" id="c_ripple_userid" value="${princ}" />
											</form>
															</sec:authorize>
															<small><i> <c:out value="${ripple2.reg_date}" /></i></small>
														</h4>
														<p>
															<c:out value="${ripple2.content}" />
														</p>
															<sec:authorize access="isAuthenticated()">
																<c:if test="${princ eq ripple2.userid}">
																	<button class='modalModBtn btn btn-warning'type="button" onclick="modifying('${ripple2.ripple_num}','${project.project_num}','${ripple2.content}','${ripple2.userid}')">修正</button> 
																	<form id="deleteForm" method="post" action="/replies/rippleDelete" >
																		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
																		<input type="hidden" name="ripple_num" value="${ripple2.ripple_num}" />
																		<input type="hidden" name="project_num" value="${project.project_num}" />
																		<input type="submit" class="btn btn-danger" value="削除">
																	</form>
																</c:if>
															</sec:authorize>
															</div>
												</div>
											</c:forEach>
											<div class="panel-footer"></div>
										</div>
									</div>
									<!-- ./ end row -->
								</div>
							</div>
						</div>
						<c:if test="${not empty project.attach_1}">
							<p style="padding: 0 0 5px 0;">
								<input type="button" class="btn" onclick="location.href='/resources/upload/${project.attach_1}'" download value="ファイル１"/>
							</p>
						</c:if>
						<c:if test="${not empty project.attach_2}">
							<p style="padding: 0 0 5px 0;">
								<input type="button" class="btn" onclick="location.href='/resources/upload/${project.attach_2}'" download value="ファイル２"/>
							</p>
						</c:if>
						<c:if test="${not empty project.attach_3}">
							<p style="padding: 0 0 5px 0;">
								<input type="button" class="btn" onclick="location.href='/resources/upload/${project.attach_3}'" download value="ファイル３"/>
							</p>
						</c:if>
					</div>
					<br>
						<form role="form_data" action="/front/remove_standBy" method="post">
							<input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum }"/>'>
					        <input type='hidden' name='amount' value='<c:out value="${cri.amount }"/>'>
						    <input type='hidden' name='type' value='<c:out value="${cri.type }"/>'>
							<input type='hidden' name='keyword' value='<c:out value="${cri.keyword }"/>'>
							<input type='hidden' name='pno' value='<c:out value="${project.project_num}"/>'>
							<input type='hidden' name='userid' value='<c:out value="${project.userid}"/>' readonly="readonly">
					      	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
								<sec:authentication property="principal" var="pinfo"/>
									<sec:authorize access="isAuthenticated()">
										<c:if test="${pinfo.username eq project.userid}">
											<input type="submit" id="remove_btn" data-oper='remove' value="削除する" class="btn btn-danger">
										</c:if>
									</sec:authorize>
						</form>
				</div>
			  </div>
			  
			<!-- 댓글 (수정) Modal -->
			<c:forEach items="${ripple}" var="ripple2">
			<form role="form" class="submitProject" action="/replies/modify" method="post" name="modifyingForm">
				<div class="modal fade" id="addReplyBtn_modify" tabindex="-1"
					role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						<input type="hidden" name="ripple_num" value="" id="modifyNum">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true">&times;</button>
								<h4 class="modal-title" id="myModalLabel">コメント修正</h4>
							</div>
							<div class="modal-body">
								<div class="form-group">
									<label>内容</label>
										<input type="text" class="form-control" id="modCont" value=""
										name="content">
								</div>
								<div class="form-group">
									
								</div>
								<%--<input type="text" class="form-control" name="ripple_num_test" value="${ripple2.ripple_num}">--%>
								<input type="hidden" class="form-control" name="project_num" id="modProN" 
									value="">
							</div>

							<div class="modal-footer">
								
								<button id='modalCloseBtn' type="button" class="btn btn-default">戻る</button>
								<input type="submit" class="btn btn-primary" name="submit"
									value="コメント修正">
							</div>
						</div>
						<!-- /.modal-content -->
					</div>
					<!-- /.modal-dialog -->
				</div>			
			</form>
		</c:forEach>
		<!-- /댓글 (수정) modal -->





	
		<!-- 댓글 (등록) Modal -->
			<form role="form" class="submitProject" action="/replies/new" method="post">
				<div class="modal fade" id="addReplyBtn_new" tabindex="-1"
					role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true">&times;</button>
								<h4 class="modal-title" id="myModalLabel">コメント登録</h4>
							</div>
							<div class="modal-body">
								<div class="form-group">
									<label>内容</label>
											
									<input type="text" class="form-control" name="content">

								</div>
								<div class="form-group">
								<label>会員名</label>
									
								<input type="text" class="form-control" name="userid" value="${princ}" readonly>
								</div>
								<%--<input type="text" class="form-control" name="ripple_num_test" value="${ripple2.ripple_num}">--%>
								<input type="hidden" class="form-control" name="project_num"  value="${project.project_num}" >
							</div>

							<div class="modal-footer">
								
								<input type="submit"  class="btn btn-primary" value="コメント登録">
							</div>
						</div>
						<!-- /.modal-content -->
					</div>
					<!-- /.modal-dialog -->
				</div>			
			</form>
		<!-- /댓글 (등록) Modal -->








			<br>
			<!-- 댓글 출력 script -->
			<script type="text/javascript" src="/resources/js/reply.js?v=1"></script>


			<!-- 댓글 기능 관련 script -->
			<script type="text/javascript">
			
			function modifying(rip_num,pro_num,cont,id){
				document.getElementById('modCont').value = cont;
				document.getElementById('modProN').value = pro_num;
				document.getElementById('modifyNum').value = rip_num;
				
				// 로그인한 사람
				var c_user_modify = document.getElementById("c_ripple_userid").value; 
				
				if (!c_user_modify) {
					alert("ログインしてください。");
					modal.modal("hide");
					return;
				}
				
				if (id != c_user_modify) {
					alert("自分のコメントだけ修正が可能です。");
				}

				if (id == c_user_modify) {
					alert("修正します。");
					
					$("#addReplyBtn_modify")
					.modal("show");
					return;
				}
				
				RippleService.update(content, function(
						result) {
					alert(result);
					modal.modal("hide");
					showList(pageNum);
				});
				
			}
			
				$(document).ready(function() {

									var bnoValue = '<c:out value="${board.project_num}"/>';
									var replyUL = $(".chat");

									showList(1);

			// 댓글 목록을 출력하는 함수
			function showList(page) {

			console.log("show list " + page);

			RippleService.getList({project_num : bnoValue, page : page || 1},
			function(replyCnt, list) {console.log("replyCnt: "+ replyCnt);
									   console.log("list: "+ list);
									   console.log(list);
									
									   if (page == -1) {pageNum = Math.ceil(replyCnt / 10.0);
														showList(pageNum);
														return;
														}

														var str = "";

														if (list == null|| list.length == 0) {
															return;
															}

															for (var i = 0, len = list.length || 0; i < len; i++) {
																str += "<li class='' data-ripple_num='"+list[i].ripple_num+"'>";
																str += "<div><div class='header'><strong class='primary-font'>["
																		+ list[i].ripple_num
																		+ "] "
																		+ list[i].userid
																		+ "</strong>";
																str += "    <small class='pull-right text-muted'>"
																		+ RippleService
																				.displayTime(list[i].reg_date)
																		+ "</small></div>";
																str += "    <p>"
																		+ list[i].content
																		+ "</p></div></li>";
															}

															replyUL.html(str);

															showReplyPage(replyCnt);

														});//end function

									}//end showList

									var pageNum = 1;
									var replyPageFooter = $(".panel-footer");

									function showReplyPage(replyCnt) {

										var endNum = Math.ceil(pageNum / 10.0) * 10;
										var startNum = endNum - 9;

										var prev = startNum != 1;
										var next = false;

										if (endNum * 10 >= replyCnt) {
											endNum = Math.ceil(replyCnt / 10.0);
										}

										if (endNum * 10 < replyCnt) {
											next = true;
										}

										var str = "<ul class='pagination pull-right'>";

										if (prev) {
											str += "<li class='page-item'><a class='page-link' href='"
													+ (startNum - 1)
													+ "'>Previous</a></li>";
										}

										for (var i = startNum; i <= endNum; i++) {

											var active = pageNum == i ? "active"
													: "";

											str += "<li class='page-item "+active+" '><a class='page-link' href='"+i+"'>"
													+ i + "</a></li>";
										}

										if (next) {
											str += "<li class='page-item'><a class='page-link' href='"
													+ (endNum + 1)
													+ "'>Next</a></li>";
										}

										str += "</ul></div>";

										console.log(str);

										replyPageFooter.html(str);
									}

									replyPageFooter.on("click", "li a",
											function(e) {
												e.preventDefault();
												console.log("page click");

												var targetPageNum = $(this)
														.attr("href");

												console.log("targetPageNum: "
														+ targetPageNum);

												pageNum = targetPageNum;

												showList(pageNum);
											});

									/* 댓글 modal 창 동작 부분*/
									var modal = $("#addReplyBtn_modify");
									var modalInputContent = modal.find("input[name='content']");
									var modalInputuserid = modal.find("input[name='userid']");
									var modalInputReg_Date = modal.find("input[name='reg_date']");
									var modalModBtn = $(".modalModBtn");
									var modalRemoveBtn = $(".modalRemoveBtn");
									var modalRegisterBtn = $("#modalRegisterBtn");
									var modalCloseBtn = $("#modalCloseBtn");

									// 댓글 인증 부분 추가
									var userid = null;

									/* <sec:authorize access="isAuthenticated()"> */
									userid = '<sec:authentication property="principal.username"/>';
									/* </sec:authorize> */

									var csrfHeaderName = "${_csrf.headerName}";
									var csrfTokenValue = "${_csrf.token}";

									$("#modalCloseBtn").on("click",
											function(e) {modal.modal('hide');
											});

									$("#addReplyBtn").on("click",
											function(e) {

														modal.find("button[id = 'addReplyBtn_new']").val("");

														// 댓글 등록 버튼 부분에 추가
														modalInputuserid.attr(
																"readonly",
																"readonly");
														modal.find("button[id !='addReplyBtn_new']").hide();

														modalRegisterBtn.show();
														modalModBtn.show();
														modalRemoveBtn.show();
														modalCloseBtn.show();
														
														$("#addReplyBtn_new")
														.modal("show");
													}); 

									// Ajax Spring Security Header
									$(document).ajaxSend(
											function(e, xhr, options) {
												xhr.setRequestHeader(
														csrfHeaderName,
														csrfTokenValue);
											});

									// 댓글 등록
									modalRegisterBtn.on("click", function(e) {

										var content = {
											content : modalInputContent.val(),
											userid : modalInputuserid.val(),
											project_num : bnoValue
										};

										RippleService.add(content, function(
												result) {

											alert(result);

											modal.find("input").val("");
											modal.modal("hide");

											showList(1);

										});

									});
									//댓글 조회 클릭 이벤트 처리 
									$(".chat").on("click","li",
									function(e) {var ripple_num = $(this).data("ripple_num");
														console.log(ripple_num);

														RippleService.get(ripple_num,
														function(content) {modalInputuserid.closest("div").show();
																			modalInputContent.val(content.content);
																			modalInputuserid.val(content.userid).attr(
																							"readonly",
																							"readonly");
																			modalInputReg_Date.val(RippleService.displayTime(content.reg_date)).attr(
																							"readonly",
																							"readonly");
																			modal.data("ripple_num",content.ripple_num);

																			modal.find("button[id !='modalCloseBtn']").hide();
																			modalModBtn.show();
																			modalRemoveBtn.show();

																			$(".modal").modal("show");
																		});
													});

									// 댓글 수정 이벤트
									

									// 댓글  이벤트
									// 댓글 삭제 부분. security 적용 후
									modalRemoveBtn.on("click", function(e) {
										
										// 댓글 작성자
										var user_modify = document.getElementById("ripple_userid").value;
										
										// 로그인한 사람
										var c_user_modify = document.getElementById("c_ripple_userid").value; 
										
										var ripple_num = modal.data("ripple_num");

										console.log("ripple_num: "+ ripple_num);
										//console.log("userid: " + userid);

										if (!userid) {
											alert("ログインしてください。");
											modal.modal("hide");
											return;
										}

										if (user_modify != c_user_modify) {
											alert("自分のコメントだけ削除ができます。");
											modal.modal("hide");
											return;
										}
										
										document.getElementById("deleteForm").submit();
									});

								});
			</script>

<script type="text/javascript">
$(document).ready(function() {

var formObj = $("#form_data");

$('button').on("click",function(e) {

e.preventDefault();

var operation = $(this).data("oper");

console.log(operation);

if (operation === 'remove') {
formObj.attr("action","/front/remove_standBy");
}
				formObj.submit();
	});
});
</script>




		</div>
	</div>
	<!-- //new_arrivals -->

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
	<div class="modal fade" id="myModal4" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content modal-info">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body modal-spa">
					<div class="login-grids">
						<div class="login">
							<div class="login-bottom">
								<h3>Sign up for free</h3>
								<form>
									<div class="sign-up">
										<h4>Email :</h4>
										<input type="text" value="Type here"
											onfocus="this.value = '';"
											onblur="if (this.value == '') {this.value = 'Type here';}"
											required="">
									</div>
									<div class="sign-up">
										<h4>Password :</h4>
										<input type="password" value="Password"
											onfocus="this.value = '';"
											onblur="if (this.value == '') {this.value = 'Password';}"
											required="">

									</div>
									<div class="sign-up">
										<h4>Re-type Password :</h4>
										<input type="password" value="Password"
											onfocus="this.value = '';"
											onblur="if (this.value == '') {this.value = 'Password';}"
											required="">

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
										<input type="text" value="Type here"
											onfocus="this.value = '';"
											onblur="if (this.value == '') {this.value = 'Type here';}"
											required="">
									</div>
									<div class="sign-in">
										<h4>Password :</h4>
										<input type="password" value="Password"
											onfocus="this.value = '';"
											onblur="if (this.value == '') {this.value = 'Password';}"
											required=""> <a href="#">Forgot password?</a>
									</div>
									<div class="single-bottom">
										<input type="checkbox" id="brand" value=""> <label
											for="brand"><span></span>Remember Me.</label>
									</div>
									<div class="sign-in">
										<input type="submit" value="SIGNIN">
									</div>
								</form>
							</div>
							<div class="clearfix"></div>
						</div>
						<p>
							By logging in you agree to our <a href="#">Terms and
								Conditions</a> and <a href="#">Privacy Policy</a>
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- //login -->
	<a href="#home" class="scroll" id="toTop" style="display: block;">
		<span id="toTopHover" style="opacity: 1;"> </span>
	</a>
	<!-- js -->
	<script type="text/javascript" src="/resources/js/jquery-2.1.4.min.js"></script>
	<!-- //js -->
	<script src="/resources/js/modernizr.custom.js"></script>
	<!-- Custom-JavaScript-File-Links -->
	<!-- cart-js -->
	<script src="/resources/js/minicart.min.js"></script>
	<script>
		// Mini Cart
		paypal.minicart.render({
			action : '#'
		});

		if (~window.location.search.indexOf('reset=true')) {
			paypal.minicart.reset();
		}
	</script>

	<!-- //cart-js -->
	<!-- single -->
	<script src="/resources/js/imagezoom.js"></script>
	<!-- single -->
	<!-- script for responsive tabs -->
	<script src="/resources/js/easy-responsive-tabs.js"></script>
	<script>
		$(document).ready(function() {
			$('#horizontalTab').easyResponsiveTabs({
				type : 'default', //Types: default, vertical, accordion
				width : 'auto', //auto or any width like 600px
				fit : true, // 100% fit in a container
				closed : 'accordion', // Start closed if in accordion view
				activate : function(event) { // Callback function if tab is switched
					var $tab = $(this);
					var $info = $('#tabInfo');
					var $name = $('span', $info);
					$name.text($tab.text());
					$info.show();
				}
			});
			$('#verticalTab').easyResponsiveTabs({
				type : 'vertical',
				width : 'auto',
				fit : true
			});
		});
	</script>
	<!-- FlexSlider -->
	<script src="/resources/js/jquery.flexslider.js"></script>
	<script>
		// Can also be used with $(document).ready()
		$(window).load(function() {
			$('.flexslider').flexslider({
				animation : "slide",
				controlNav : "thumbnails"
			});
		});
	</script>
	<!-- //FlexSlider-->
	<!-- //script for responsive tabs -->
	<!-- start-smoth-scrolling -->
	<script type="text/javascript" src="/resources/js/move-top.js"></script>
	<script type="text/javascript" src="/resources/js/jquery.easing.min.js"></script>
	<script type="text/javascript">
		jQuery(document).ready(function($) {
			$(".scroll").click(function(event) {
				event.preventDefault();
				$('html,body').animate({
					scrollTop : $(this.hash).offset().top
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
				easingType : 'easeOutQuart'
			});

		});
	</script>
	<!-- //here ends scrolling icon -->

	<!-- for bootstrap working -->
	<script type="text/javascript" src="/resources/js/bootstrap.js"></script>
	<script type="text/javascript" src="/resources/js/bootstrap2.js"></script>
<svg version="1.1" xmlns="http://www.w3.org/2000/svg">
    <filter id="blur">
        <feGaussianBlur stdDeviation="6" />
    </filter>
</svg>
</body>

</html>