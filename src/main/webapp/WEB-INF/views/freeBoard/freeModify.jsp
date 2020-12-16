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
                                <span></span>
                            </div>

                            <div class="form-group">
                                <label>내용</label>
                                <textarea class="form-control" rows="10" name='content' style="resize: none;">${boardVO.content }</textarea>
                            </div>

                            <button id="listBtn" type="button" class="btn btn-dark">목록</button>    
                            <button id="modifyBtn" type="button" class="btn btn-primary">변경</button>
                            <button id="deleteBtn" type="button" class="btn btn-info">삭제</button>
                    </form>
                                    
                </div>
            </div>
        </div>
        </section>
        
        <script>
        	var listBtn =  document.getElementById("listBtn");
        	listBtn.onclick = function(){
        		location.href = "listBtn";
        	}
        	var modifyBtn = document.getElementById("modifyBtn");
        	modifyBtn.onclick = function(){
        		if(modifyForm.title.value === ''){
        			var warning = modifyForm.title.nextElementSibling;
        			warning.innerHTML = "제목은 필수입니다.";
        			warning.style.color = "red";
        		}else{
        			modifyForm.action = "freeModifyReq";
        			modifyForm.submit();
        		}
        	}
        	//form의 액션값을 바꿈으로서 하나의 폼에서 여러개의 버튼 동작을 만들 수 있음
        	var deleteBtn = document.getElementById("deleteBtn");
        	deleteBtn.onclick = function(){
        		modifyForm.action = "freeDeleteReq";
        		modifyForm.submit();
        	}
        </script>

        
        
        
        