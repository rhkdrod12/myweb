<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

		<section>
			<div class="container">
				<div class="row">
					<div class="col-xs-12 col-md-9 write-wrap">
						<div class="titlebox">
							<p>상세보기</p>
						</div>
		
						<form action="freeModify" method="post" name="modifyForm">
							<div>
								<label>DATE</label>
								<p>
									<fmt:formatDate value="${boardVO.alterdate }"
										pattern="yyyy년 MM월 dd일 HH:mm"
									/>
								</p>
								<input type="hidden" name='alterdate' value='${boardVO.alterdate}'>
							</div>
							<div class="form-group">
								<label>번호</label> <input class="form-control" name='bno'
									value="${boardVO.bno}" readonly
								>
							</div>
							<div class="form-group">
								<label>작성자</label> <input class="form-control" name='writer'
									value="${boardVO.writer }" readonly
								>
							</div>
							<div class="form-group">
								<label>제목</label> <input class="form-control" name='title'
									value="${boardVO.title }" readonly
								>
							</div>
		
							<div class="form-group">
								<label>내용</label>
								<textarea class="form-control" rows="10" name='content' readonly>${boardVO.content}</textarea>
							</div>
		
							<button type="button" class="btn btn-primary"
								onclick="modifyForm.submit()"
							>변경</button>
							<button type="button" class="btn btn-dark"
								onclick="location.href='freeList'"
							>목록</button>
						</form>
		
					</div>
				</div>
			</div>
		</section>
		
		<section style="margin-top: 80px;">
			<div class="container">
				<div class="row">
					<div class="col-xs-12 col-md-9 write-wrap">
						<form class="reply-wrap" name="replyForm">
							<div class="reply-image">
								<img src="../resources/img/profile.png">
							</div>
							<!--form-control은 부트스트랩의 클래스입니다-->
							<div class="reply-content">
								<textarea class="form-control" rows="3" id="reply"></textarea>
								<div class="reply-group">
									<div class="reply-input">
										<input type="text" class="form-control" id="replyId"
											placeholder="이름"
										> <input type="password" class="form-control" id="replyPw"
											placeholder="비밀번호"
										>
									</div>
		
									<button type="button" class="right btn btn-info" id="replyRegist">등록하기</button>
								</div>
							</div>
						</form>
		
						<!--여기에접근 반복-->
						<div id="replyList">
							<!-- <div class='reply-wrap'>
			                            <div class='reply-image'>
			                                <img src='../resources/img/profile.png'>
			                            </div>
			                            <div class='reply-content'>
			                                <div class='reply-group'>
			                                    <strong class='left'>honggildong</strong> 
			                                    <small class='left'>2019/12/10</small>
			                                    <a href='#' class='right'><span class='glyphicon glyphicon-pencil'></span>수정</a>
			                                    <a href='#' class='right'><span class='glyphicon glyphicon-remove'></span>삭제</a>
			                                </div>
			                                <p class='clearfix'>여기는 댓글영역</p>
			                            </div>
			                        </div> -->
						</div>
						
					
						<div>
							<button class="form-control hidden" id="moreList">게시글 더보기</button>
						</div>
						
					</div>
				</div>
			</div>
		</section>
		
		<!-- 모달 -->
		<div class="modal fade" id="replyModal" role="dialog">
			<div class="modal-dialog modal-md">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="btn btn-default pull-right"
							data-dismiss="modal"
						>닫기</button>
						<h4 class="modal-title">댓글수정</h4>
					</div>
					<div class="modal-body">
						<!-- 수정폼 id값을 확인하세요-->
						<div class="reply-content">
							<textarea class="form-control" rows="4" id="modalReply"	placeholder="내용입력"	></textarea>
							<div class="reply-group">
								<div class="reply-input">
									<input type="hidden" id="modalRno"> 
									<input type="password" class="form-control" placeholder="비밀번호"	id="modalPw">
								</div>
								<button class="right btn btn-info" id="modalModBtn">수정하기</button>
								<button class="right btn btn-info" id="modalDelBtn">삭제하기</button>
							</div>
						</div>
						<!-- 수정폼끝 -->
					</div>
				</div>
			</div>
		</div>
		
		<script type="text/javascript">
		
			
			/* 
				선택자.modal
				
				부트스트랩에서 지원하는 함수
				.modal 부트스트랩에서 만들어놓은 함수임 , show, hide로 보이고 숨길 수 있음
				
				선택자.modal("show") : 모달 보이기
				선택자.modal("hide") : 모달 숨기기
			*/
			
			
			
			var page = 1;	
			var totalPage = 0;
		
			//댓글 정보 얻어오기		
			getList(1);
			
			// 더보기 버튼 이벤트
			$("#moreList").click(function(){
				console.dir($(this));
				if(++page <= totalPage){
					console.log(page);
					getList(page);
				}
			})
 			
			// 댓글 삭제, 수정 버튼 클릭시 이벤트
			$("#replyList").on("click", "a", function(){
				event.preventDefault();				
				
				$("#modalRno").val($(this).attr("href"));
				$("#modalPw").val("");
				
				if($(this).hasClass("replyModify")){
					
					var text = $(this).parent().parent().children("p").html();
					
					$("#modalReply").val(text);
					
					$(".modal-title").html("댓글 수정");
					$(".modal-body .hidden").removeClass("hidden");	
					$("#modalDelBtn").addClass("hidden");
				}
				else if($(this).hasClass("replyDelete")){
					
					$(".modal-title").html("댓글 삭제");
					$(".modal-body .hidden").removeClass("hidden");	
					$("#modalModBtn, #modalReply").addClass("hidden");
				}
				
				$("#replyModal").modal("show");
			});
			
			// 비밀번호 확인
		
			// 수정하기 버튼 클릭시
			$("#modalModBtn").click(function(){
				
				var target = $("#modalModBtn");
				
				var rno = $("#modalRno").val();
				var reply = $("#modalReply").val();
				var modalPw = $("#modalPw").val();
				
				if(reply === '' || replyPw === ''){
					alert("내용 또는 비밀번호를 입력해주세요");
					return;
				}else{
					
					// 버튼 정지
					target.attr("disabled", true);
					
					// 비동기 요청
					$.ajax({
						type : "post",
						url : "../reply/updateReq",
						data : JSON.stringify({
							"rno" : rno,
							"reply" : reply,
							"replyPw" : modalPw
						}),
						contentType : "application/json; charset=utf-8"
					})
					// 통신 성공시
					.done(function(data) {
						console.log(data);
						
						if(data === 0){
							alert("비밀번호를 확인해주세요");							
						}else{
					
							alert("수정에 성공했습니다.");		
					
							$("#modalReply").val('');
							$("#modalPw").val('');
							$("a[href="+rno+"]").parent().parent().children("p").html(reply);
							
							$("#replyModal").modal("hide");
						}
		
					})
					// 통신 실패시
					.fail(function(error) {
						console.log(error);
						console.log("에러 발생시 실행됨");
						alert("문제가 발생했습니다. 관리자에게 문의하세요");
		
					})
					// 실행 완료시
					.always(function() {
						
						//버튼 정지 해제
						target.removeAttr("disabled");
					})
				}
			})
			
			// 삭제하기 버튼 클릭시
			$("#modalDelBtn").click(function(){
				var target = $("#modalModBtn");
				
				var rno = $("#modalRno").val();
				var modalPw = $("#modalPw").val();
				
				if(reply === '' || replyPw === ''){
					alert("비밀번호를 입력해주세요");
					return;
				}else{
					
					// 버튼 정지
					target.attr("disabled", true);
					
					// 비동기 요청
					$.ajax({
						type : "delete",
						url : "../reply/deleteReq",
						data : JSON.stringify({
							"rno" : rno,
							"replyPw" : modalPw
						}),
						contentType : "application/json; charset=utf-8"
					})
					// 통신 성공시
					.done(function(data) {
						console.log(data);
						
						if(data === 0){
							alert("비밀번호를 확인해주세요");							
						}else{
							alert("삭제에 성공했습니다.");
							
							page = 1;
							getList(1);
							
							$("#modalPw").val('');
							$("#replyModal").modal("hide");
						}
		
					})
					// 통신 실패시
					.fail(function(error) {
						console.log(error);
						console.log("에러 발생시 실행됨");
						alert("문제가 발생했습니다. 관리자에게 문의하세요");
		
					})
					// 실행 완료시
					.always(function() {
						
						//버튼 정지 해제
						target.removeAttr("disabled");
					})
				}
			});
		
			
			// 윈도우 로드시 동작할 함수
			$(document).ready(function() {
				$("#replyRegist").click(add);
				msg();
			})
		
			// 메시지가 있는 경우 해당 처리, history 관련해서 볼 것
			function msg() {
				if (history.state === '')
					return;
				//아래서 state에 대해서 공백처리했기 때문에 공백을 가지고 있을 것임
				//원래는 어떤 처리값을 가지고 잇을 것임
		
				var msg = "${msg}";
				if (msg !== "") {
					alert(msg);
					//history.replaceState(전달할 데이터, 페이지 제목, 변경할 주소): 브라우저의 기록을 변경
					history.replaceState('', null, null);
				}
			}
		
			// 게시글 추가
			function add() {
		
				var bno = "${boardVO.bno}"; //게시글 번호
				var reply = $("#reply").val(); //reply 내용
				var replyId = $("#replyId").val(); //아이디
				var replyPw = $("#replyPw").val(); //비밀번호
				
				var target = event.target;
				
				console.log(bno, reply, replyId, replyPw);
		
				if (reply === '' || replyId === '' || replyPw === '') {
					alert("이름, 비밀번호, 내용을 입력하세요");
					return;
				} else {
		
					target.setAttribute("disabled", true);
				        
					$.ajax({
						type : "post",
						url : "../reply/registReq",
						data : JSON.stringify({
							"bno" : bno,
							"reply" : reply,
							"replyId" : replyId,
							"replyPw" : replyPw
						}),
						contentType : "application/json; charset=utf-8"
					}).done(function(data) {
						console.log(data);
						if (data === 1) {
							$("#reply").val("");
							$("#replyId").val("");
							$("#replyPw").val("");
							
							page = 1;
							getList(1);
							
							alert("댓글 등록에 성공");
						} else {
							alert("댓글 등록에 실패");
						}
		
					}).fail(function(error) {
						console.log(error);
						console.log("에러 발생시 실행됨");
						alert("문제가 발생했습니다. 관리자에게 문의하세요");
		
					}).always(function() {
						console.log("항상 실행됨");
						target.removeAttribute("disabled");
					})
				}
			}
			//end regist
			
			function getList(page) {
		
				var bno = "${boardVO.bno}";
		
				//$.ajax() 		- get, post, put, delete 등을 공용적으로 처리하는 쿼리 기능
				//$.getJSON(요청주소, 콜백함수) 	- 단순히 get방식의 데이터만을 얻어올 때 사용하는 기능
				$.getJSON("../reply/getList/" + bno + "/"+page, 
					function(data) {
					
						console.log(data);
						
						var list = $("#replyList");
						var html = "";
						
						//받을 데이터가 없을 시 
						if (data.list.length <= 0) {
							
							html += "<div class='reply-wrap'>"	   
							html += "<div class='reply-image'>";
							html += "<img src='../resources/img/profile.png'>";
							html += "</div>";
							html += "<div class='reply-content'>";
							html += "<div class='reply-group'>";
							html += "<strong class='left'>관리자</strong> ";
							html += "<small class='left'>"+timeStamp(new Date())+"</small>";				
							html += "</div>";
							html += "<p class='clearfix'>첫 댓글을 달아주세요!</p>";
							html += "</div>";
							html += "</div>";
							
							list.html(html);
							
							return;
						} 
						//받은 데이터가 있을 때 
						else {
							
							totalPage = data.totalPage;
							if(totalPage > page){
								$("#moreList").removeClass("hidden");
							}else{
								$("#moreList").addClass("hidden");
							}
							
							var dataList = data.list;
							
							for (var i = 0; i < dataList.length; i++) {							
							
								html += "<div class='reply-wrap'>";
								html += "<div class='reply-image'>";
								html += "<img src='../resources/img/profile.png'>";
								html += "</div>";
								html += "<div class='reply-content'>";
								html += "<div class='reply-group'>";
								html += "<strong class='left'>"+dataList[i].replyId+"</strong> ";
								html += "<small class='left'>"+timeStamp(dataList[i].replyDate)+(dataList[i].replyDate != dataList[i].updateDate?" | 수정됨":"")+"</small>";
								html += "<a href='"+dataList[i].rno+"' class='right replyModify'><span class='glyphicon glyphicon-pencil'></span>수정</a>";
								html += "<a href='"+dataList[i].rno+"' class='right replyDelete'><span class='glyphicon glyphicon-remove'></span>삭제</a>";
								html += "</div>";
								html += "<p class='clearfix'>"+dataList[i].reply+"</p>";
								html += "</div>";
								html += "</div>";
							}
							
							list.html(list.html() + html);
							
							return;
						}
					}
				);
			}
			
			function timeStamp(miles){
				
				/********************************* 
				 * 게시글 시간 차이 계산 
				 *
				 * 밀리초를 입력받아 현재 시간과 얼마나 차이나는지를 반환함
				 *
				 * 입력값 : 	밀리초
				 * 출력값 : 
				 *	 		1분 미만 	: 방금 전 
				 *   		1시간 미만	: ##분 전
				 *	  		하루 이전 	: ##시간 전
				 *	  		하루 이상 	: yyyy-mm-dd
				 *********************************/
				
				var date;
				
				date = (new Date() - miles)/1000;	// 초단위
				if(date < 60){						// 60미만이면 초
					return "방금 전";
				}
				date = date/60;						// 분단위
				if(date < 60){						// 60미만이면 분
					return parseInt(date)+"분 전";
				}
				date = date/60;						// 시간단위
				if(date < 24){						// 24미만이면 시간
					return parseInt(date)+"시간 전";
				}
				
				date = new Date(miles);				// 24시간 이상이므로 날짜로 연산
				date = date.getFullYear() + "-" + (date.getMonth()+1) + "-" + date.getDate();
				return date;
			}
			
		</script>
