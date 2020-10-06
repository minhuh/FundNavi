<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
   uri="http://www.springframework.org/security/tags"%>
<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE html>
<html>

<head>
   <title>FundNavi - Main Page</title>
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
   </script>
   <!--//tags -->
   <link href="resources/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
   <link href="resources/css/style.css" rel="stylesheet" type="text/css" media="all" />
   <link href="resources/css/font-awesome.css" rel="stylesheet">
   <link href="resources/css/easy-responsive-tabs.css" rel='stylesheet' type='text/css' />
   <link href="resources/css/istyle.css" rel="stylesheet" type="text/css" media="all" />
   <!-- //for bootstrap working -->
   <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800" rel="stylesheet">
   <link href='https://fonts.googleapis.com/css?family=Lato:400,100,100italic,300,300italic,400italic,700,900,900italic,700italic' rel='stylesheet' type='text/css'>

   <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
</head>

<body>
    <%@include file="header.jsp"%>
   <!-- banner -->
   <div id="myCarousel" class="carousel slide" data-ride="carousel">
      <!-- Indicators -->
      <ol class="carousel-indicators">
         <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
         <li data-target="#myCarousel" data-slide-to="1" class=""></li>
         <li data-target="#myCarousel" data-slide-to="2" class=""></li>
         <li data-target="#myCarousel" data-slide-to="3" class=""></li>
         <li data-target="#myCarousel" data-slide-to="4" class=""></li>
      </ol>
      <div class="carousel-inner" role="listbox">
         <c:forEach items="${main_slide}" var="slide_info" varStatus="status">
            <c:if test="${not empty slide_info.title_image}">
               <c:set var="imageLink" value="resources/upload/${slide_info.title_image}"></c:set>
            </c:if>
            <c:if test="${empty slide_info.title_image}">
               <c:set var="imageLink" value="resources/img/no_img.png"></c:set>
            </c:if>
               
               
            <c:if test="${status.count eq 1}">
               <div class="item active" style="background-image: url('${imageLink}'); cursor: pointer;" onclick="location.href='/front/single?project_num=${slide_info.project_num}'">
                  <div class="container">
                     <div class="carousel-caption">
                        <a class="hvr-outline-out button2">Funding Now </a>
                     </div>
                  </div>
               </div>
            </c:if>
            <c:if test="${status.count ne 1}">
               <div class="item item${status.count}" style="background-image: url('${imageLink}'); cursor: pointer;" onclick="location.href='/front/single?project_num=${slide_info.project_num}'">
                  <div class="container">
                     <div class="carousel-caption">
                        <a class="hvr-outline-out button2">Funding Now </a>
                     </div>
                  </div>
               </div>
            </c:if>
         </c:forEach>
      </div>
      <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
         <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
         <span class="sr-only">Previous</span>
      </a>
      <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
         <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
         <span class="sr-only">Next</span>
      </a>
      <!-- The Modal -->
   </div>
   
   
   <div class="container-fluid" style=" height:100%; border-bottom:1px solid #E6E6E6;">
   
         <div class="col-md-4-1" style="border-right:1px solid #E6E6E6; float: left; width: 50%; margin: 30px 0 0 0;">
            <h2>これはどうですか？</h2>
            <br>
            <c:forEach items="${list}" var="project">

               
               <div class="col-md-new" style="width:240px; cursor: pointer;" onclick="location.href='front/single?project_num=${project.project_num}'" >
                  <c:if test="${not empty project.title_image}">
                        <div class="thumb-image">
                        <img src="resources/upload/${project.title_image}" style="width: 240px; height: 130px;" class="img-responsive" data-imagezoom="true"></div>
                  </c:if>
                  <c:if test="${empty project.title_image}">
                        <div class="thumb-image"><img src="http://placehold.it/240x130"  class="img-responsive" data-imagezoom="true"></div>
                  </c:if>
                  <h4><c:out value="${fn:substring(project.simple_content, 0, 20)}"/></h4>
                  <strong style="font-size: 15px; color: #00CCCC;"><fmt:formatNumber value="${(project.current_invest / project.achive_invest) * 100}" pattern="##.#" />%</strong>
                  <strong style="font-size: 15px; color: gray;"><c:out value="${project.category}"/></strong>
               </div>
      
            </c:forEach>
            <div class="col-md-new multi-gd-img multi-gd-text bgBlur" id="blurBanner" style="width:240px; height:130px; cursor: pointer;" onclick="location.href='front/project'" >
                  
                     <img src="resources/images/deobogi.png" alt=" ">
                        <h4>
                           <br>
                           <span style="font-size: 20px;">もっと見る</span> 
                        </h4>
            </div>
         </div>
         
         <div class="col-md-8-1" style="float: left; width: 40%; margin: 30px 0 0 50px;">
            <h2><span class="item_price">ランキング</span></h2>
            <br>
            <c:forEach items="${rank_list}" var="project_rank"  varStatus="status">
            <div style="height:65px; margin: 0 0 5px 0; cursor: pointer;" onclick="location.href='front/single?project_num=${project_rank.project_num}'">
               <div style="float:right; width:30%; height: 100%;" class="">
                  <c:if test="${not empty project_rank.title_image}">
                     <div class="thumb-image">
                           <img src="/resources/upload/${project_rank.title_image}"
                              data-imagezoom="true" class="img-responsive"
                              style="width: 200px; height: 60px;" id="img-positions">
                     </div>
                     </c:if>
                     <c:if test="${empty project_rank.title_image}">
                        <div class="thumb-image">
                           <img src="http://placehold.it/200x60"
                              data-imagezoom="true" class="img-responsive"
                              style="width: 200px; height: 60px;" id="img-positions">
                        </div>
                  </c:if>
               </div>
               <div style="width:10%; float:left;" class="">
                  <strong style="font-size: 20px; color: gray;"><c:out value="${status.count}"/></strong>
               </div>
               <div style="width:60%; height:100%; float:left;" class="">
                  <div style="float: top; width: 100%; height:40%; margin: 0 0 10px 0;">
                     <c:out value="${fn:substring(project_rank.detail_content, 0, 20)}"/>...
                  </div>
                  <div style="float: bottom; width: 100%; height: 40%;">
                     <strong style="font-size: 15px; color: #00CCCC;"><fmt:formatNumber value="${project_rank.current_invest}" pattern="#,###,###,###,###" />円</strong>
                     <small><c:out value="${project_rank.category}"/></small>
                  </div>
               </div>
            </div>
            </c:forEach>
         </div>
   
<br>


   </div>

   <br>
   <!-- //banner -->
   <h2 style="margin-left:10px;">今年スタート予定のプロジェクト</h2><br/>
   <div class="end-grid-agile-w3s">
      <c:forEach items="${openProject}" var="open">
      <fmt:formatDate var="startDate" value="${open.project_start}" 
      pattern="MM" />
      
         <c:if test="${not empty open.title_image}">
            <c:set var="imageLink" value="/resources/upload/${open.title_image}" />
         </c:if>
         <c:if test="${empty open.title_image}">
            <c:set var="imageLink" value="/resources/img/no_img.png" />
         </c:if>
         
         <div class="col-md-3 multi-gd-img multi-gd-text " style="padding:10px;">
            <a href="front/single_open?project_num=${open.project_num}">
            <img src="${imageLink}">
            <h3><span>${startDate}月 OPEN</span></h3>
            </a>  
            <c:out value="${fn:substring(open.simple_content, 0, 20)}"/> 
         </div>
      </c:forEach>

      
      <div class="clearfix"></div>
   </div>

   <br>

   <!-- schedule-bottom -->
   <div class="schedule-bottom">
      <div class="col-md-6 agileinfo_schedule_bottom_left">
         <img src="resources/images/mid.jpg" alt=" " class="img-responsive" />
      </div>
      <div class="col-md-6 agileits_schedule_bottom_right">
         <div class="w3ls_schedule_bottom_right_grid">
            <h3>FundNavi</h3>
            <p><h4>「FundNavi」は。。。<br><br>一般の方々がより易くファンディングができるようにサービスを提供しております。</h4></p>
            <div class="col-md-4 w3l_schedule_bottom_right_grid1">
               <i class="fa fa-user-o" aria-hidden="true"></i>
               <h4>Customers</h4>
               <h5 class="counter">${memberCnt}</h5>
            </div>
            <div class="col-md-4 w3l_schedule_bottom_right_grid1">
               <i class="fa fa-calendar-o" aria-hidden="true"></i>
               <h4>Idea</h4>
               <h5 class="counter">${projectCnt}</h5>
            </div>
            <div class="col-md-4 w3l_schedule_bottom_right_grid1">
               <i class="fa fa-shield" aria-hidden="true"></i>
               <h4>Complete</h4>
               <h5 class="counter">${projectEndCnt}</h5>
            </div>
            <div class="clearfix"> </div>
         </div>
      </div>
      <div class="clearfix"> </div>
   </div>
   <!-- //schedule-bottom -->
   <!-- banner-bootom-w3-agileits -->
   <div class="banner-bootom-w3-agileits">
      <div class="container">
         <h3 class="wthree_text_info">FundNavi <span>Service</span></h3>

         <div class="col-md-5 bb-grids bb-left-agileits-w3layouts">
            <a href="front/open">
               <div class="bb-left-agileits-w3layouts-inner grid">
                  <figure class="effect-roxy">
                     <img src="resources/images/bb1.jpg" alt=" " class="img-responsive" />
                     <figcaption>
                        <h3><span>スタート</span>予定 </h3>

                     </figcaption>
                  </figure>
               </div>
            </a>
         </div>
         <div class="col-md-7 bb-grids bb-middle-agileits-w3layouts">
            <a href="front/project">
               <div class="bb-middle-agileits-w3layouts grid">
                  <figure class="effect-roxy">
                     <img src="resources/images/bottom3.jpg" alt=" " class="img-responsive" />
                     <figcaption>
                        <h3><span>プ</span>ロジェクト </h3>

                     </figcaption>
                  </figure>
               </div>
            </a>
            <a href="front/culture_project">
               <div class="bb-middle-agileits-w3layouts forth grid">
                  <figure class="effect-roxy">
                     <img src="resources/images/bottom4.jpg" alt=" " class="img-responsive">
                     <figcaption>
                        <h3><span>文化</span>コンテンツ </h3>

                     </figcaption>
                  </figure>
               </div>
            </a>
            <div class="clearfix"></div>
         </div>
      </div>
   </div>
   <!--/grids-->

   <!--/grids-->
   <!-- /new_arrivals -->
   
   <!--grids-->
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