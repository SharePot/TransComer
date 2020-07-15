<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="resources/css/alarmPage.css" />
</head>
<body>
	<!-- Main -->
	<c:import url="../common/menuBar.jsp" />
	<section id="main">
		<div id="mainWrapper">

			<img src="/resources/css/images/notification.png" id="alarmImg">
			<h1 id="alarmTitle">알림</h1>
			<hr>
			<input type="hidden" id="memberId" value="${loginUser.memberId }">
			<div id="alarmSection">
				
			</div>
		</div>
	</section>

	<script>
	
	$(function() {
		getAlarmList();
	})
	
	function getAlarmList() {
		var memberId = $("#memberId").val();
		$.ajax({
			url : "alarmList.tc",
			data : {memberId : memberId},
			dataType : "json",
			success : function(data) {
				$divSection = $("#alarmSection");
				$divSection.html("");
				
				if (data.length > 0) {
					for (var i in data) {
						$table = $("<table>");
						$firstTr = $("<tr>");
							$sendTimeTd = $("<td>").text(data[i].sendTime);
							$btnTd = $("<td>");
								$readBtn = $("<a id='readBtn' onclick='readBtn(this, " + data[i].alarmNo +")'>").text("읽음 ");
								$deleteBtn = $("<a id='deleteBtn' onclick='deleteBtn(this, " + data[i].alarmNo + ")'>").text("삭제");
						$secondTr = $("<tr>");
							$contentTd = $("<td colspan='3'>").text(decodeURIComponent(data[i].alarmContent.replace(/\+/g, " ")));
						
						$divSection.append($table);
							$table.append($firstTr);
								$firstTr.append($sendTimeTd);
									$sendTimeTd.after($btnTd);
										$btnTd.append($deleteBtn);
								$firstTr.after($secondTr);
									$secondTr.append($contentTd);
									
						if (data[i].checkYN == 'N') {
							$deleteBtn.before($readBtn);
							$table.css("color", "black");
						}			
						
					}
				} else {
					
					$table = $("<table>");
					$tr = $("<tr>");
					$td = $("<td id='noAlarm'>");
					
					$divSection.append($table);
					$table.append($tr);
					$tr.append
					($td).text("알림이 없습니다.");
				}
			}
		});
	}
	
	function deleteBtn(obj, alarmNo) {
		
		var result = window.confirm("알람을 삭제하시겠습니까?");
  			if (result) {
  				
		  		$.ajax({
					url : "deleteAlarm.tc",
					data : {alarmNo : alarmNo},
					type : "post",
					success : function(data) {
						console.log(alarmNo);
						getAlarmList();
						alert("알람이 삭제되었습니다.")
							
					}
				});
		  		
  			}
  	};
  	
  	function readBtn(obj, alarmNo) {
  		$.ajax ({
  			url : "readAlarm.tc",
  			data : {alarmNo : alarmNo},
  			type : "post",
  			success : function(data) {
  				getAlarmList();
  			}
  		});
  	}
	</script>

</body>
</html>