<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src ="js/jquery-3.7.1.min.js"></script>
<script>
$(document).ready(function(){
	
});
</script>
</head>
<body>
<table>
    <thead>
        <tr>
            <th>번호</th>
            <th>제목</th>
            <th>작성자</th>
            <th>가격</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="item" items="${seachlist}">
            <tr>
                <td>${item.id}</td>
                <td>${item.title}</td>
                <td>${item.user_pk}</td>
                <td>${item.price}</td>
            </tr>
        </c:forEach>
    </tbody>
</table>
<h3>페이지번호를 선택하세요</h3>
 <%
int total = (Integer)request.getAttribute("total");
int totalpage=0;
if(total % 5 == 0){
	totalpage = total/5;
}
else{
	totalpage = total/5 +1;
}

for(int i = 1; i<= totalpage; i++){
%>	
	<a href="/seachlisttt?pagenum=<%=i%>&keyword=${keyword}"><%=i%>페이지</a>&nbsp;
<%
}
%>
</body>
</html>