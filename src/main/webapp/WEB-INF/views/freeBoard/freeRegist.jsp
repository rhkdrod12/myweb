<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>

<section>
	<div class="container">
		<div class="row">
			<div class="col-xs-12 content-wrap">
				<div class="titlebox">
					<p>자유게시판</p>
				</div>

				<form name="registForm" action="freeRegistReq" method="post">
					<table class="table">
						<tbody class="t-control">
							<tr>
								<td class="t-title">NAME</td>
								<td>
									<input class="form-control input-sm" name="writer">
									<span></span>
								</td>
							</tr>
							<tr>
								<td class="t-title">TITLE</td>
								<td>
									<input class="form-control input-sm" name="title">
									<span></span>
								</td>
							</tr>
							<tr>
								<td class="t-title">COMMNET</td>
								<td>
									<span></span>
									<textarea class="form-control" rows="7" name="content" style="resize: none;"></textarea>
								</td>
							</tr>
						</tbody>
					</table>
				</form>

				<div class="titlefoot">
					<button class="btn" type="button" onclick="regist()">등록</button>
					<button class="btn" type="button" onclick="location.href='freeList'">목록</button>
				</div>
			</div>
		</div>
	</div>
</section>

<script type="text/javascript">
	function regist(){
		var flag = true;
		
		if(registForm.writer.value === ''){
			var target = registForm.writer.nextElementSibling;
			target.innerHTML="작성자는 필수입니다.";
			target.style.color = "red";		
			flag = false;
		}
		if(registForm.title.value === ''){
			var target = registForm.title.nextElementSibling;
			target.innerHTML="제목은 필수입니다.";
			target.style.color = "red";			
			flag = false;
		}
		
		if(flag){
			registForm.submit();
		}
	}
</script>
