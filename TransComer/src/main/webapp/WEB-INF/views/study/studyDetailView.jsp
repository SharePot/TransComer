<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세</title>
</head>
<body>
   <c:import url="../common/menuBar.jsp" />
   <br style="clear: both">
   <h1 align="center">${study.studyNo }번 글 상세보기</h1>
   <br>
   <br>

   <table align="center" width="450" border="1" cellspacing="0"
      style="clear: right;" id="tb">
      <tr>
         <td width="80">번호</td>
         <td>${study.studyNo }</td>
      </tr>
      <tr>
         <td>제목</td>
         <td>${study.studyTitle }</td>
      </tr>
      <tr>
         <td>작성자</td>
         <td>${study.memberId }</td>
      </tr>
      <tr>
         <td>작성일</td>
         <td>${study.studyWriteDate }</td>
      </tr>
      <tr height="300">
         <td>내용</td>
         <td>${study.studyContent }</td>
      </tr>
      <tr>
         <td>첨부파일</td>
         <td>${study.studyFilePath }</td>
      </tr>
      <c:if test="${loginUser.memberId eq study.memberId }">
         <tr>
            <td colspan="2" align="center">
            	<c:url var="studyUpdate" value="studyUploadView.tc">
            	<c:param name="studyNo" value="${study.studyNo }"></c:param> <!-- ?뒤에 보내는 값을 넣어줘야함 -->
            	<!-- 쿼리스트링을 보내주어야 컨트롤러 메소드의 매개변수(파라미터)가 받아서 처리 가능 -->
            	</c:url>
            	<c:url var="studyDelete" value="studyDelete.tc">
            		<c:param name="studyNo" value="${study.studyNo }"></c:param>
            	</c:url>
               <a href="${studyUpdate }">수정페이지로 이동</a> &nbsp;&nbsp;
               <a href="${studyDelete }">삭제하기</a>
            </td>
         </tr>
      </c:if>
      
   </table>


   <p align="center">

      <c:url var="home" value="home.kh" />
      <a href="${home }">시작페이지로 이동</a>
      <c:url var="nlist" value="nlist.kh" />
      <a href="${nlist }">목록 전체보기</a>
      
        <!-- 댓글 등록  -->
   <table align="center" width="500" border="1" cellspacing="0" id="commentTable">
      <tr>
         <td><textarea cols="55" rows="3" id="content"></textarea></td>
         <input type="hidden" id="commentCondition" name="commentCondition" value="study">
         <td>
            <button id="submit">등록하기</button>
         </td>
      </tr>
   </table>
   
   
   <!-- 댓글 목록  -->
   <table id="rtb" align="center" width="500" border="1" cellspacing="0">
      <thead>
         <tr>
            <td colspan="2"><b id="count"></b></td>
            <input type="hidden" id="commentCondition" name="commentCondition" value="study">
         </tr>
      </thead>
      <tbody>
		<tr>
		<ul class="pagination">

		<li class="disabled"><a><<</a></li>
		
		<li class="disabled"><a><</a></li>
		
		<li class="disabled active"><a>1</a></li>
		
		<li class="goPage" data-page="2"><a>2</a></li>
		
		<li class="goPage" data-page="3"><a>3</a></li>
		
		<li class="disabled"><a>></a></li>
		
		<li class="goLastPage"><a>>></a></li>
		
		</ul> 

		</tr>         
      </tbody>
   </table>
       <script>
       $result['paging'] = array(

    		   'startPage' => $startPage,                //시작페이지

    		   'endPage' => $endPage,                 //종료페이지

    		   'totalBlock' => $totalBlock,              //전체 페이지 블럭 갯수

    		   'totalPage' => $totalPage,                // 전체 페이지 갯수

    		   'blockPageNum' => $blockPageNum,    //한페이지에 나올 블럭갯수

    		   'rowsByPage' => $rowsByPage,           //한페이지에 나올 리스트갯수

    		   'totalCount' => $totalCount,            //전체 리스트갯수

    		   'block' => $block,                        //현재 페이지가 어느 블럭에 포함되어있는지

    		   'page' => $page                            //현재 페이지

    		   );

       var page = 1;                       //페이지 변수를 1로 초기화
       var searchKey = '';                 //검색기능을 위해 검색 변수 초기화

       // 초기 페이지 로딩 시 댓글 불러오기
         getCommentList(); //이게 실행되면 밑에 댓글들 나옴 (ajax가 실행됨)
         
         // ajax polling
         //타회원이 댓글들을 작성했을 수 있으니 지속적으로 댓글 불러오기
         setInterval(function() {
        	 getCommentList();
         }, 10000); //10초 마다 불러옴
         
         // 댓글 등록 ajax
         $("#submit").on("click", function commentAjax() {
            
            var content = $("#content").val(); // 댓글의 내용
            var refStudyNo = ${study.studyNo }; // 어느 게시글의 댓글인지 알려줌
            
            $.ajax({
               url : "insertComment.tc",
               data : {content:content, refStudyNo:refStudyNo},
               			'page': page,
               			'searchKeyword':searcKey,
               type : "post",
               success : function(data) { //data를 String으로 받아옴, 단순 결과값만 받아오는 거기때문에 String
                  if(data == "success") { //결과값이 success이면
                	  getCommentList(); //목록을 가져오도록
                     $("#content").val("");
                  }
               }
     

   	    }

       });

   });



                           
            });
         });

         
         
    
      
      // 댓글 리스트 불러오는 ajax 함수
      function getCommentList(){
         var studyNo= ${study.studyNo};
         $.ajax({
            url:"insertComment.tc",
            data:{studyNo:studyNo,
            	'page':page,
            	 'searchKeyword' : searchKey
            },
            dataType:"json", //응답이 오는 data는(밑에꺼) json형태 이다.
            success:function(data){ //controller에서 json으로 받아오는 코드 만들어줌
               $tableBody = $("#rtb tbody");
               $tableBody.html("");
               
               var $tr;
               var $memberId;
               var $commentContent;
               var $commentWriteDate;
               
               $("#count").text("댓글 (" + data.length+")"); //리스트의 길이를 댓글의 갯수로 확인할 수있다.
               if( data.length > 0 ) {
                  for ( var i in data ) {
                     $tr = $("<tr>");
                     $memberId = $("<td width='100'>").text(data[i].memberId);
                     //내용(복호화)
                     $commentContent = $("<td>").text(decodeURIComponent(data[i].commentContent.replace(/\+/g, " ")));
                     //(위코드)td를 선택해서 댓글 내용 넣고 역슬래시면 공백으로 만들어줌
                     $commentWriteDate = $("<td width='100'>").text(data[i].commentWriteDate);
                     
                     $tr.append($memberId);
                     $tr.append($commentContent);
                     $tr.append($commentWriteDate);
                     $tableBody.append($tr); //(위에 코드 써있는) 파란색 댓글목록의 tablebody부분에 넣어줌
                  }
               }else{ //데이터가 없을때
                  $tr = $("<tr>");
                  $rContent = $("<td colspan='3'>").text("등록된 댓글이 없습니다.");
                  
                  $tr.append($commentContent);
                  $tableBody.append($tr);
               }

            }
            function(result){
            	respone = result.lists;          	       	 //반환값중 데이터목록을 response변수에 삽입
            	paging = result.paging;             //페이징관련 데이터들을 paging변수에 삽입

            }
            ///=============================================페이징
            
            $(".pagination").empty();  //페이징에 필요한 객체내부를 비워준다.

	        	

	        if(paging.page != 1){            // 페이지가 1페이지 가아니면

	        	$(".pagination").append("<li class=\"goFirstPage\"><a><<</a></li>");        //첫페이지로가는버튼 활성화

	        }else{

	        	$(".pagination").append("<li class=\"disabled\"><a><<</a></li>");        //첫페이지로가는버튼 비활성화

	        }



	        if(paging.block != 1){            //첫번째 블럭이 아니면

	        	$(".pagination").append("<li class=\"goBackPage\"><a><</a></li>");        //뒤로가기버튼 활성화

	        }else{

	        	$(".pagination").append("<li class=\"disabled\"><a><</a></li>");        //뒤로가기버튼 비활성화

	        }

	        	

	        for(var i = paging.startPage ; i <= paging.endPage ; i++){        //시작페이지부터 종료페이지까지 반복문

	        	if(paging.page == i){                            //현재페이지가 반복중인 페이지와 같다면

	                	$(".pagination").append("<li class=\"disabled active\"><a>"+i+"</a></li>");    //버튼 비활성화

	        	}else{

	        		$(".pagination").append("<li class=\"goPage\" data-page=\""+i+"\"><a>"+i+"</a></li>"); //버튼 활성화

	        	}

	        }



	        if(paging.block < paging.totalBlock){            //전체페이지블럭수가 현재블럭수보다 작을때

	        	$(".pagination").append("<li class=\"goNextPage\"><a>></a></li>");         //다음페이지버튼 활성화

	        }else{

	        	$(".pagination").append("<li class=\"disabled\"><a>></a></li>");        //다음페이지버튼 비활성화

	        }

  

          if(paging.page < paging.totalPage){                //현재페이지가 전체페이지보다 작을때

        		$(".pagination").append("<li class=\"goLastPage\"><a>>></a></li>");    //마지막페이지로 가기 버튼 활성화

        	}else{

        		$(".pagination").append("<li class=\"disabled\"><a>>></a></li>");        //마지막페이지로 가기 버튼 비활성화

        	}



//첫번째 페이지로 가기 버튼 이벤트

        	$(".goFirstPage").click(function(){

		       	page = 1;

		       	pageFlag = 1;
		 	$(getCommentList);
		     //  	$("상단 ajax를 함수로 만들어 재귀호출");

		       	pageFlag = 0;

	        });



//뒷페이지로 가기 버튼 이벤트

		$(".goBackPage").click(function(){

		      	page = Number(paging.startPage) - 1;

		       	pageFlag = 1;
		 		$(getCommentList);
		       //	$("상단 ajax를 함수로 만들어 재귀호출");

		       	pageFlag = 0;

	        });



//클릭된 페이지로 가기 이벤트

		$(".goPage").click(function(){

			page = $(this).attr("data-page");

			pageFlag = 1;

			$(getCommentList);
		       //	$("상단 ajax를 함수로 만들어 재귀호출");

		       	pageFlag = 0;

		});



//다음페이지로 가기 클릭이벤트

		$(".goNextPage").click(function(){

			page = Number(paging.endPage) + 1;

			pageFlag = 1;

			$(getCommentList);

		       	pageFlag = 0;

	        });



//마지막페이지로 가기 클릭이벤트

	        $(".goLastPage").click(function(){

	        	page = paging.totalPage;

	        	pageFlag = 1;

		       	$(getCommentList);

		      	pageFlag = 0;

	        });
            
         });
      }
      
      
      
      
   </script>

   </p>
   <br>
   <br>
   <br>
   <br>
   <br>
   <br>
   <br>
   <br>
   <br>
   <br>
   <br>
   <br>

</body>
</html>