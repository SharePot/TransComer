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
			<div id="alarmPage"></div>
		</div>
	</section>

	<script>
	
	$(function() {
		getAlarmList();
		var cPage;
	})
	
	function getAlarmList(cPage) {
		var memberId = $("#memberId").val();
		$.ajax({
			url : "alarmList.tc",
			data : {memberId : memberId},
			dataType : "json",
			success : function(data) {
				$divSection = $("#alarmSection");
				$divSection.html("");
				
				var currentPage;
				var startPage;
				var endPage;
				var maxPage;
				
				var pageLimit = 5;
				
				if (cPage == null) {
					cPage = 1;
				}
				
				currentPage = cPage;
				
				if (data.length > 0) {
					
					maxPage = parseInt((data.length / 5) + 0.8);
					startPage = ((parseInt((currentPage / pageLimit) + 0.8)) - 1) * pageLimit + 1;
					endPage = startPage + pageLimit - 1;
					
					for (var i = (currentPage * 5) - 5; i <currentPage * 5; i++) {
						
						if (data.length == i) {
							break;
						}
						
						$table = $("<table>");
						$firstTr = $("<tr>");
							$sendTimeTd = $("<td>").text(data[i].sendTime);
							$btnTd = $("<td>");
								$readBtn = $("<a href='#redirect' id='readBtn' onclick='readBtn(this, " + data[i].alarmNo +");'>").text("읽음 ");
								$deleteBtn = $("<a href='#redirect' id='deleteBtn' onclick='deleteBtn(this, " + data[i].alarmNo + ");'>").text("삭제");
						$secondTr = $("<tr>");
							$contentTd = $("<td colspan='3'>").text(decodeURIComponent(data[i].alarmContent.replace(/\+/g, " ")));
							$simpleContentTd = $("<td colspan='3'>").html(" ' <a href='" + data[i].boardAddress + "'>" + data[i].boardTitle + " </a> ' " + decodeURIComponent(data[i].alarmContent.replace(/\+/g, " ")));
							console.log(data[i].boardTitle);
						$divSection.append($table);
							$table.append($firstTr);
								$firstTr.append($sendTimeTd);
									$sendTimeTd.after($btnTd);
										$btnTd.append($deleteBtn);
								$firstTr.after($secondTr);
									
						if (data[i].checkYN == 'N') {
							$deleteBtn.before($readBtn);
							$table.css("color", "black");
						}
						
						if (data[i].boardAddress != null) {
							$secondTr.append($simpleContentTd);
						} else {
							$secondTr.append($contentTd);
						}
						
					}
					
					/* 알림 페이징 부분 */
					$alarmPage = $("#alarmPage");
					$alarmPage.html("");
					$aTable = $("<table>");
					
					$alarmTr = $("<tr align='center'>");
					$alarmTd = $("<td>");
					var before = "< &nbsp;";
					var after = "&nbsp; >";
					
					if (currentPage <= 1) {
						$alarmTd.append(before);
					} else if (currentPage > 1) {
						$before = $("<a href='javascript:getAlarmList(" + (currentPage - 1) + ")'><&nbsp;</a> &nbsp;");
						$alarmTd.append($before);
					}
					
					for (var i = startPage; i <= maxPage; i++) {
						if (i == currentPage) {
							$link = $("<font color = 'red' size='4'><b>[" + i + "]</b></font> &nbsp;");
							$alarmTd.append($link);
						} else if (i != currentPage) {
							$link = $("<a href='javascript:getAlarmList(" + i + ")'>" + i + "</a> &nbsp;");
							$alarmTd.append($link);
						}
					}
					
					if (currentPage >= maxPage) {
						$alarmTd.append(after);
					} else if (currentPage < maxPage) {
						$after = $("<a href='javascript:getAlarmList( " + (currentPage + 1) + ")'>&nbsp;></a>");
						$alarmTd.append($after);
					}
					
					$alarmPage.append($aTable);
					$aTable.append($alarmTr);
					$alarmTr.append($alarmTd);
					
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