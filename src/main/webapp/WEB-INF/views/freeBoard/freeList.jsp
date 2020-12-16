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
				<form action="freeList" method="get">
					<div class="search-wrap">
						<span style="float:left">게시글 수: ${pageVO.totalBno}</span>
						<button type="submit" class="btn btn-info search-btn">검색</button>
						<input type="text" value="${pageVO.search }" name="search" class="form-control search-input">
						<select id="searchOption" name="searchOption" class="form-control search-select">
							<option value="0">제목</option>
							<option value="1">내용</option>
							<option value="2">작성자</option>
							<option value="3">제목+내용</option>
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
								<td>${boardVO.num}</td>
								<td><a href="freeDetail?page=${boardVO.num}">${boardVO.title}</a>	</td>
								<td>${boardVO.writer}</td>
								<td><fmt:formatDate value="${boardVO.regdate}" pattern="yyyy년 MM월 dd일 HH:mm"/> </td>
								<td><fmt:formatDate value="${boardVO.alterdate}" pattern="yyyy년 MM월 dd일 HH:mm"/></td>
							</tr>
						</c:forEach>
					</tbody>

				</table>

				<!--페이지 네이션을 가져옴-->
				<form>
					<div class="text-center">
						<hr>
						<ul class="pagination pagination-sm">
							<c:if test="${pageVO.prevPage}"><li><a href="freeList?page=${pageVO.startPage-1 }">이전</a></li></c:if>
							<c:forEach var="i" begin="${pageVO.startPage}" end="${pageVO.endPage }" step="1">
								<li ${pageVO.page == i?"class='active'":""}><a href="freeList?page=${i}${pageVO.search!=null?'&search='+=pageVO.search+='&searchOption='+=pageVO.searchOption:''}">${i}</a></li>
							</c:forEach>							
							<c:if test="${pageVO.nextPage}"><li><a href="freeList?page=${pageVO.endPage+1}">이전</a></li></c:if>
						</ul>
						<button type="button" class="btn btn-info" onclick="location.href='freeRegist'">글쓰기</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</section>

<script type="text/javascript">

	var s = document.getElementById("searchOption");
	var num = ${pageVO.searchOption!=null?pageVO.searchOption:0};
	s.options[num].selected = true;
	
	s.onchange = function() {
		document.querySelector("input[name='search']").value = '';
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
