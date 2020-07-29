<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ONLINE</title>
<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
</head>
<body class="homepage is-preload">
	<div id="page-wrapper">

		<!-- Header -->
		<c:import url="../common/menuBar.jsp" />

		<!-- Main -->
		<section id="main">
			<!--컨테이너-->
			<div class="container">
				<!--로우-->
				<div class="row">
					<!--메인 내용 구역 1-->
					<div class="col-12">
						<div class="d-flex justify-content-center">
							<span class="h3"> <svg width="1em" height="1em"
									viewBox="0 0 16 16" class="bi bi-person-lines-fill"
									fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd"
										d="M1 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm7 1.5a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 0 1h-2a.5.5 0 0 1-.5-.5zm-2-3a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4a.5.5 0 0 1-.5-.5zm0-3a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4a.5.5 0 0 1-.5-.5zm2 9a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 0 1h-2a.5.5 0 0 1-.5-.5z" />
                                </svg>&nbsp; 실시간 의뢰
							</span>
						</div>
						<hr>
						<!--메인 내용 구역 2(지워도 됨, 자유롭게 추가)-->
						<div class="d-flex justify-content-center">
							<div class="card" style="width: 50%">
								<div class="card-header d-flex justify-content-center">
									실시간 접속 유저 목록
								</div>
								<div class="card-body">
									<!-- 로그인 O 유저 : 실시간 접속자 확인가능 -->
									<c:if test="${!empty sessionScope.loginUser }">
										<nav class="nav flex-column h5">
											<!-- 실시간 유저 리스트를 반복 출력 -->
											<c:forEach var="online" items="${onlineList }" varStatus="i">
												<!-- 실시간 유저 리스트는 나를 제외한 사람만 표시 -->
												<c:if test="${online.memberId != loginUser.memberId }">
													<c:url var="wsclient" value="wsclient.tc">
														<c:param name="sendUser" value="${loginUser.memberId }" />
														<c:param name="receiveUser" value="${online.memberId }" />
													</c:url>
													<a href="${wsclient }" onclick="window.open(this.href,'채팅','width=500, height=700, left=100, top=50');return false;" class="nav-link" style="text-decoration: none;">${loginUser.memberName }</a>
													<br>
												</c:if>
											</c:forEach>
										</nav>
									</c:if>
									<!-- 로그인 X : 실시간 접속자 확인 불가 -->
									<c:if test="${empty sessionScope.loginUser }">
										<br>
										<p class="text-center">로그인 후에 이용하실 수 있습니다.</p>
									</c:if>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>

		<!-- Footer -->
		<c:import url="../common/footer.jsp" />
	</div>
</body>

</html>