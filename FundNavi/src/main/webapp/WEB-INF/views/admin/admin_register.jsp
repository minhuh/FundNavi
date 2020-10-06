<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>



<div class="row">
  <div class="col-lg-12">
    <h1 class="page-header">登録</h1>
  </div>
  <!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
  <div class="col-lg-12">
    <div class="panel panel-default">

      <div class="panel-heading">登録</div>
      <!-- /.panel-heading -->
      <div class="panel-body">

        <form role="form" action="admin/admin_register" method="post" enctype="multipart/form-data">
        	<!--
        	controller에서 파라미터 수집시 upload file은 uploadFile 이름으로 server로 넘어간다.(binary data로)
        	하지만 BoardVO에서는 file_1,file_2,file_3의 이름으로 setter를 해줘야 한다.
        	따라서 file_1,file_2,file_3를 hidden으로 넘겨서 controller에서 file이 upload가 안됐을 경우에도
        	파라미터 수집이 되도록(값은 null로 됨) 하기위해 hidden으로 값을 넘긴다.
        	-->
			<input type="hidden" name="file_1" value="">
	        <input type="hidden" name="file_2" value="">
	        <input type="hidden" name="file_3" value="">
	        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
          <div class="form-group">
            <label>タイトル</label> <input class="form-control" name='title'>
          </div>

          <div class="form-group">
            <label>内容</label>
            <textarea class="form-control" rows="3" name='content'></textarea>
          </div>

          <div class="form-group">
            <label>会員名</label> <input class="form-control" name='writer' 
                value='<sec:authentication property="principal.username"/>' readonly="readonly">
          </div>
          
          <div class="form-group">
            <label>イメージ</label> <input type="file" class="form-control" name='uploadFile'>
          </div>
          
          <div class="form-group">
            <label>イメージ</label> <input type="file" class="form-control" name='uploadFile'>
          </div>
          
          <div class="form-group">
            <label>イメージ</label> <input type="file" class="form-control" name='uploadFile'>
          </div>
          
          <button type="submit" class="btn btn-default">完了</button>
          <button type="reset" class="btn btn-default">戻る</button>
        </form>

      </div>
      <!--  end panel-body -->

    </div>
    <!--  end panel-body -->
  </div>
  <!-- end panel -->
</div>
<!-- /.row -->
