<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
    
    <section>
        <div class="container">
            <div class="row">
                <div class="col-xs-12 col-md-9 write-wrap">
                        <div class="titlebox">
                            <p>수정하기</p>
                        </div>
                        
                        <form action="freeDeleteReq" method="post" name="deleteForm">
                        	<input name="num" value='${boardVO.num}' type="hidden">
                        </form>
                        
                        <form action="freeModifyReq" method="post" name="modifyForm">
                            <div>
                                <label>DATE</label>
                                <p><fmt:formatDate value="${boardVO.alterdate }" pattern="yyyy년 MM월 dd일 HH:mm"/></p>
                            </div>   
                            <div class="form-group">
                                <label>번호</label>
                                <input class="form-control" name='num' value='${boardVO.num }' readonly>
                            </div>
                            <div class="form-group">
                                <label>작성자</label>
                                <input class="form-control" name='writer' value='${boardVO.writer }' readonly>
                            </div>    
                            <div class="form-group">
                                <label>제목</label>
                                <input class="form-control" name='title' value='${boardVO.title }'>
                            </div>

                            <div class="form-group">
                                <label>내용</label>
                                <textarea class="form-control" rows="10" name='content'>${boardVO.content }</textarea>
                            </div>

                            <button type="button" class="btn btn-dark" onclick="location.href='freeList'">목록</button>    
                            <button type="button" class="btn btn-primary" onclick="modifyForm.submit()">변경</button>
                            <button type="button" class="btn btn-info" onclick="deleteForm.submit()">삭제</button>
                    </form>
                                    
                </div>
            </div>
        </div>
        </section>
