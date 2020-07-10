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
		<link rel="stylesheet" href="resources/css/main.css" />
		<link rel="stylesheet" href="resources/css/alarm.css" />
</head>
<body>
	<!-- Main -->
	<c:import url="../common/menuBar.jsp" />
    <section id="main">
		<div id="mainWrapper">
                      
			<img src="/resources/css/images/notification.png" id="alarmImg">
			<h1 id="alarmTitle">알림 <%-- &#40;${fn:length(alarm.checkYN) }&#41; --%> </h1>
			<hr>
                       
			<div id="alarmSection">
				<c:forEach var="alarm" items="${arList }">
					<div id="alarmItem">
						<table id="alarmTb">
							<c:if test="${loginUser.memberNo eq alarm.memberNo }">
								<c:if test="${fn:length(alarm) == 0}">
									<tr>
										<td id="alarmContent">알림이 없습니다.</td>
									</tr>
								</c:if>
								<c:if test="${!empty alarm.alarmContent}">
									<tr>
										<td id="alarmContent">${alarm.alarmContent }</td>
										<td id="alarmBtn">
											<c:if test="${alarm.checkYN eq 'N' }">
												<button id="cBtn" onclick="coneBtn();">읽음</button>
											</c:if>
											<c:if test="${alarm.checkYN eq 'Y' }">
												<a id="ucBtn">안읽음</a>
											</c:if>
											<c:url var="deleteBtn" value="deleteAlarm.tc">
												<c:param name="alarmNo" value="${alarm.alarmNo }" />
											</c:url>
			                                <a id="dBtn" href="${deleteBtn }">삭제</a>
			                            </td>
			                        </tr>
			                      </c:if>
								</c:if>
	                     </table>
	                 </div>
				</c:forEach>
            </div>
        </div>
	</section>
	
	<script>
	
	/* $("#cBtn").on("Click", function() {
		
		var alarmNo = ${alarm.alarmNo}; // 어느 알람인지 알려주고
		
		$.ajax ({
			url : "readAlarm.tc",
			data : {alarmNo:alarmNo},
			type: "post",
			success : function(data) {
				if (data == "success") {
					colsole.log(data);
				}
			}
			
			
		});
		
	}); */
	
	function coneBtn() {
		
		var alarmNo = ${alarm.alarmNo}; // 어느 알람인지 알려주고
		
		/* $.ajax ({
			url : "readAlarm.tc",
			data : {alarmNo:alarmNo},
			type: "post",
			success : function(data) {
				if (data == "success") {
					colsole.log(data);
				}
			}
			
			
		});  */
		
		console.log(alarmNo);
	}
	
		
	</script>
	
</body>
</html>