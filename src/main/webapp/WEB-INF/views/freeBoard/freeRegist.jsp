﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>

<%@ include file="/WEB-INF/views/include/header.jsp"%>
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
								</td>
							</tr>
							<tr>
								<td class="t-title">TITLE</td>
								<td>
									<input class="form-control input-sm" name="title">
								</td>
							</tr>
							<tr>
								<td class="t-title">COMMNET</td>
								<td>
									<textarea class="form-control" rows="7" name="content"></textarea>
								</td>
							</tr>
						</tbody>
					</table>

				</form>

				<div class="titlefoot">
					<button class="btn" onclick="registForm.submit()">등록</button>
					<button class="btn">목록</button>
				</div>
			</div>
		</div>
	</div>
</section>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>