<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*, java.lang.*"%>
<%@ page import="java.text.*, java.net.InetAddress"%>
<c:set var="path1" value="${request.getContextPath() }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSON Test1</title>
<jsp:include page="/head.jsp" />
</head>
<body>
<div class="container">
	<h2 class="title">JSON(JavaScript Object Notation)</h2>
	<p>자바스크립트의 객체 형태로 데이터를 교환하는 방식</p>
	<br><hr><br>
	<div id="js">
		
	</div>
	<script>
	$(document).ready(function(){
		//JSON = java MAP
		var obj = {name:"이름", age:10};
		$("#js").html("<p>이름 : " + obj.name + "</p>");
		$("#js").append("<p>나이 : " + obj.age + "</p>");
	});
	
	</script>
	<br><hr><br>
	<div id="con">
	<h2 class="title">JSON 데이터 받기</h2>
	</div>
	<script>
	$(document).ready(function(){
		$.ajax({
			url:"${path1 }/JSONTest1.do",	//아이디가 전송되어질 곳
			type:"post",		//전송방식
			dataType:"json",	//데이터 반환 방식
			success:function(result){
				console.log(result.result);
				var test = result.result;
				$("#con").html(test);
			}
		});
	});
	</script>
	
	<br><hr><br>
	<div id="con2">
	
	</div>
	<script>
	$(document).ready(function(){
		var params = { name : "김기태" }
		$.ajax({
			url:"${path1 }/JSONTest2.do",	//전송되어질 곳
			type:"post",		//전송방식
			dataType:"json",	//데이터 반환 방식
			data:params,
			success:function(data){
				console.log(data);
				var user = data;
				$("#con2").html("이름 : " + user.name + ", 점수 : " + user.point);
			}
		});
	});
	</script>
	
	<br><hr><br>
	<div id="con3">
	
	</div>
	<script>
	$(document).ready(function(){
		var params = { name : "" }
		$.ajax({
			url:"${path1 }/JSONTest3.do",	//전송되어질 곳
			type:"post",		//전송방식
			dataType:"json",	//데이터 반환 방식
			data:params,
			success:function(data){
				console.log(data);
				var user = data;
				$("#con3").html("이름 : " + user.name + ", 점수 : " + user.point);
			}
		});
	});
	</script>
	
</div>
</body>
</html>