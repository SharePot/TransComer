<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="resources/css/alarm.css" />
</head>
<body>
	<!-- Main -->
	<c:import url="../common/menuBar.jsp" />
    <section id="main">
		<div id="mainWrapper">
                      
			<img src="/resources/css/images/notification.png" id="alarmImg">
			<h1 id="alarmTitle">알림</h1>
			<hr>
                       
			<div id="alarmSection">
				
            </div>
        </div>
	</section>
	
	<script>
	function getAlarmList() {
		var memberNo = ${loginUser.memberNo};
		$.ajax({
			url : "alarmList.tc",
			data : {memberNo : memberNo},
			dataType : "json",
			success : function(data) {
				
				$divSection = $("#alarmSection");
				$divSection.html("");
				
				if (data.length > 0) {
					for (var i in data) {
						/* $table = $("<table>");
						$tr = $("<tr>");
						$td = $("<td>");
						$tdcol = $("<td colspan='3'>").text(data[i].alarmContent);
						$readBtn = $("<a id='readBtn'>").text("읽음");
						$deleteBtn = $("<a id='deleteBtn'>").text("삭제");
						
						$divSection.append($table);
						$table.append($tr); */
						var memberNo = data[i].memberNo;
						console.log(memberNo);
						
					}
				}
				
				
			}
		});
	}
	
	
	</script>
	
</body>
</html>