<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<section>
	<div class="container-fluid">
		<div class="row">
			<!--lg에서 9그리드, xs에서 전체그리드-->
			<div class="col-lg-9 col-xs-12 board-table">
				<div class="titlebox">
					<p>자유게시판</p>
				</div>
				<hr>

				<!--form select를 가져온다 -->
				<form action="freeList" method="get" name="searchForm">
				
					<div class="search-wrap">
						<span style="float:left;">게시글 수: ${pageVO.totalBno}</span>
						
						<button type="submit" class="btn btn-info search-btn">검색</button>
						<input type="text" value="${cri.search }" name="search" class="form-control search-input">
						<select id="searchOption" name="searchOption" class="form-control search-select">
							<option value="0">제목</option>
							<option value="1">내용</option>
							<option value="2">작성자</option>
							<option value="3">제목+내용</option>
						</select>
					</div>
					
					<div style="width:100%; margin: 10px 0px; overflow: hidden;">
						<select id="bnoAmount" name="bnoAmount" class="form-control" style="float:left; width: 100px; padding-left: 10px;">
							<option value=10  ${cri.bnoAmount == 10?'selected':''}>10개</option>
							<option value=20  ${cri.bnoAmount == 20?'selected':''}>20개</option>
							<option value=50  ${cri.bnoAmount == 50?'selected':''}>50개</option>
							<option value=100 ${cri.bnoAmount == 100?'selected':''}>100개</option>
						</select>
					</div>
					
				</form>
				
				<table class="table table-bordered">
					<thead>
						<tr>
							<th>번호</th>
							<th class="board-title">제목</th>
							<th>작성자</th>
							<th>등록일</th>
							<th>수정일</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${list.isEmpty()}">
							<tr>
								<td colspan="5" align="center">-- 없 음  --</td>
							<tr>
						</c:if>
						<c:forEach var="boardVO" items="${list}">
							<tr>
								<td>${boardVO.bno}</td>
								<td><a href="freeDetail?page=${boardVO.bno}">${boardVO.title}</a>	</td>
								<td>${boardVO.writer}</td>
								<td><fmt:formatDate value="${boardVO.regdate}" pattern="yyyy년 MM월 dd일 HH:mm"/> </td>
								<td><fmt:formatDate value="${boardVO.alterdate}" pattern="yyyy년 MM월 dd일 HH:mm"/></td>
							</tr>
						</c:forEach>
					</tbody>

				</table>

				<!--페이지 네이션을 가져옴-->
				<!-- ${cri.search!=null?'&search='+=cri.search+='&searchOption='+=cri.searchOption:''} -->
				<%-- <form name="pageForm">
					<div class="text-center">
						<hr>
						<ul class="pagination pagination-sm">
							<c:if test="${pageVO.prevPage}"><li><a href="freeList?page=${pageVO.startPage-1 }&bnoAmount=${cri.bnoAmount}">이전</a></li></c:if>
							<c:forEach var="i" begin="${pageVO.startPage}" end="${pageVO.endPage }" step="1">
								<li ${pageVO.page == i?"class='active'":""}>
									<a href="freeList?page=${i}&bnoAmount=${cri.bnoAmount}">${i}</a>
								</li>
							</c:forEach>							
							<c:if test="${pageVO.nextPage}"><li><a href="freeList?page=${pageVO.endPage+1}&bnoAmount=${cri.bnoAmount}">다음</a></li></c:if>
						</ul>
						<button type="button" class="btn btn-info" onclick="location.href='freeRegist'">글쓰기</button>
					</div>
				</form> --%>
				
				<form name="pageForm">
					<div class="text-center">
						<hr>
						<ul class="pagination pagination-sm">
							<c:if test="${pageVO.prevPage}">
								<li>
									<%-- <a href="#" data-page="{page:'${pageVO.startPage-1}'}">이전</a> --%>
									<a href="#" data-page="${pageVO.startPage-1}">이전</a>
								</li>
							</c:if>
							<c:forEach var="i" begin="${pageVO.startPage}" end="${pageVO.endPage }" step="1">
								<li ${pageVO.page == i?"class='active'":""}>
									<a href="#" data-page="${i}">${i}</a>
								</li>
							</c:forEach>							
							<c:if test="${pageVO.nextPage}">
								<li>
									<a href="#" data-page="${pageVO.endPage+1}">다음</a>
								</li>
							</c:if>
						</ul>
						<button type="button" class="btn btn-info" onclick="location.href='freeRegist'">글쓰기</button>
					</div>
					
					
				</form>
			</div>
		</div>
	</div>
</section>


<script type="text/javascript">
		
	//페이지 이벤트 설정
	var pagination = document.querySelector(".pagination");
	pagination.onclick = function(){
		event.preventDefault();
		
		var tag = event.target;
		
		if(tag.tagName === 'A'){
			console.dir(pagination);
			console.dir(event.target);
			
			var page =			tag.dataset.page;
			var bnoAmount = 	'${cri.bnoAmount}';
			var search = 		'${cri.search}';
			var searchOption = 	'${cri.searchOption}';
			
			//전송 방식 설정
			pageForm.action = "freeList";
			pageForm.method = "get";
			
			//데이터 삽입
			addAttribute( pageForm, "page", page);
			addAttribute( pageForm, "bnoAmount", bnoAmount);
			if(search !== '') {addAttribute( pageForm, "search", search);}
			if(searchOption !== ''){addAttribute( pageForm, "searchOption", searchOption);}
			
			pageForm.submit();
		}
	}
	
	//form에 값 삽입 함수
	function addAttribute(inputForm, name, value){
		var hiddenField = document.createElement("input");
		
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", name);
		hiddenField.setAttribute("value", value);
		
		inputForm.appendChild(hiddenField);
	}
	
	
	//검색 옵션 변경
	var s = document.getElementById("searchOption");
	var bno = '${cri.searchOption!=null?cri.searchOption:0}';
	s.options[bno].selected = true;
	
	//옵션 변경시 기존 값 초기화
	s.onchange = function() {
		document.querySelector("input[name='search']").value = '';
	}
	
	//데이터 표기수 변경 이벤트
	var d = document.getElementById("bnoAmount");
	d.onchange = function(){
		
		var page = '${cri.page}';

		addAttribute(searchForm, "page", page);
		
		searchForm.search.value = '${cri.search}';
		searchForm.submit();
	}
	

	window.onload = function() {
		if (history.state === '')
			return;
		else{
			var msg = "${msg}";
			if (msg !== "") {
				alert(msg);
				history.replaceState('', null, null);
			}
		}
	}
</script>
