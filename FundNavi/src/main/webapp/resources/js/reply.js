/**
 * 댓글용 module 
 */

console.log("Ripple Module........");

var RippleService = (function() {

	// 댓글 추가
	function add(content, callback, error) {
		console.log("add ripple...............");

		$.ajax({
			type : 'post',
			url : '/replies/new',
			data : JSON.stringify(content), // JavaScript 값이나 객체를 JSON 문자열로 변환
			contentType : "application/json; charset=utf-8",
			success : function(result, status, xhr) { // (Anything data(서버에서 받은 data), String textStatus, jqXHR jqXHR )
				if (callback) {
					callback(result);
				}
			},
			error : function(xhr, status, err) {
				if (error) {
					// error 발생 시 응답 메세지와 err code를 alert 시킨다. 
					error(err);
				}
			}
		});
	}
	
	// 댓글 목록 (댓글 숫자와 목록을 가져오는 경우)
	function getList(param, callback, error) {

	    var project_num = param.bnoValue;
	    var page = param.page || 1;
	    
	    $.getJSON("/replies/pages/" + page + ".json",
	    	function(data) {
	    		if (callback) {    		
	    			callback(data.replyCnt, data.list); //댓글 숫자와 목록을 가져오는 경우 
	    		}
	    		
	    	}).fail(function(xhr, status, err) {
	    		if (error) {
	    			error();
	    		}
	    	});
	}

	// 댓글 삭제
	/*
	function remove(rno, callback, error) {
		$.ajax({
			type : 'delete',
			url : '/replies/' + rno,
			success : function(deleteResult, status, xhr) {
				if (callback) {
					callback(deleteResult);
				}
			},
			error : function(xhr, status, err) {
				if (error) {
					error(err);
				}
			}
		});
	}
	*/
	
	// 댓글 삭제. security 적용 후
	function remove(ripple_num, userid, callback, error) {
		  
		console.log("--------------------------------------");  
		console.log(JSON.stringify({ripple_num:ripple_num, userid:userid}));  
		    
		$.ajax({
			type : 'delete',
			url : '/replies/' + ripple_num,
			data:  JSON.stringify({ripple_num:ripple_num, userid:userid}),
			contentType: "application/json; charset=utf-8",
			success : function(deleteResult, status, xhr) {
				if (callback) {
					callback(deleteResult);
				}
			},
			error : function(xhr, status, err) {
				if (error) {
					error(err);
				}
			}
		});
	}

	// 댓글 수정
	function update(content, callback, error) {

		console.log("ripple_num: " + content.ripple_num);

		$.ajax({
			type : 'put',
			url : '/replies/' + content.ripple_num,
			data : JSON.stringify(content), // JavaScript 값이나 객체를 JSON 문자열로 변환
			contentType : "application/json; charset=utf-8",
			success : function(result, status, xhr) {
				if (callback) {
					callback(result);
				}
			},
			error : function(xhr, status, err) {
				if (error) {
					error(err);
				}
			}
		});
	}
	
	// 댓글 조회
	function get(ripple_num, callback, error) {

		$.get("/replies/" + ripple_num + ".json", function(result) {
			if (callback) {
				callback(result);
			}
		}).fail(function(xhr, status, err) {
			if (error) {
				error();
			}
		});
	}
	
	// 날짜 포맷 변환
	function displayTime(timeValue) {

		var today = new Date();

		var gap = today.getTime() - timeValue;

		var dateObj = new Date(timeValue);
		var str = "";

		if (gap < (1000 * 60 * 60 * 24)) {

			var hh = dateObj.getHours();
			var mi = dateObj.getMinutes();
			var ss = dateObj.getSeconds();

			return [ (hh > 9 ? '' : '0') + hh, ':', (mi > 9 ? '' : '0') + mi,
					':', (ss > 9 ? '' : '0') + ss ].join('');

		} else {
			var yy = dateObj.getFullYear();
			var mm = dateObj.getMonth() + 1; // getMonth() is zero-based
			var dd = dateObj.getDate();

			return [ yy, '/', (mm > 9 ? '' : '0') + mm, '/',
					(dd > 9 ? '' : '0') + dd ].join('');
		}
	}

	return {
		add : add,
		getList : getList,
		remove : remove,
		update : update,
		get : get, 
		displayTime : displayTime
	};
	
	return {name:"aaaa"}
})();