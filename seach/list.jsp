<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <style>
        #myModal {
            display: none; 
            position: fixed;
            z-index: 1; 
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.4); 
        }

     
        .modal-content {
            background-color: #fefefe;
            margin: 15% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 80%;
            max-width: 500px;
        }

        
        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }
        
         .css-button {
            border: none; 
            background-color: transparent; 
            font-size: 1.2em;
            cursor: pointer; 
        }
        
        #searchResults {
    	display: none;
		}
 </style>
 <script src ="js/jquery-3.7.1.min.js"></script>
<script>
$(document).ready(function(){
	$('#openModalBtn').on('click', function() {
	        $('#myModal').css('display', 'block');
	    });
	 
	$('#closeModalBtn').on('click', function() {
	        $('#myModal').css('display', 'none');
	    });
	
	$('.css-button').on('click', function() {
	    var selectedCountry = $(this).text();
	    var newUrl = '/seachlistt?country_name=' + encodeURIComponent(selectedCountry);
	    window.history.pushState({}, '', newUrl); 
		 $('#myModal').css('display', 'none');

	});
	
    
    $('#country_name').on('input', function() {
        var inputVal = $(this).val().trim();
      
        if (inputVal === '') {
          
            $('#closesuggestion').show();
            $('#searchResults').hide();
        	} 
        else {
        	
            $('#closesuggestion').hide();
            $('#searchResults').show();      		      
              $.ajax({
                url: '/seachlistt2',  // 서버에 요청을 보낼 URL
                type: 'GET',
                data: { 'country_name' : inputVal },  // $("input[name=country_name]").val()입력한 지역을 파라미터로 보내기
                dataType : 'json',
                success: function(response) {
                	$("#searchResults").html("");
                	
    				for(let i=0; i <response.length; i++){
    					$('.css-button').on('click', function() {
                    	    var selectedCountry = $(this).text();
                    	    var newUrl = '/seachlistt?country_name=' + encodeURIComponent(selectedCountry);
                    	    window.history.pushState({}, '', newUrl); 
                    	    $('#myModal').css('display', 'none');
                    	});
    					$("#searchResults").append("<button type='button' class='css-button'>" + response[i].country_name+"</button><br><hr style='border: none; height: 0.5px; background-color: gray;'>");
    					}
    				} 
        		}); /* .ajax */
        }/* else */	
    });/*country_name*/
    
    $('#searchForm').on('keydown', function(event) {
        if (event.key === 'Enter') {
            event.preventDefault();
        }
    }); /* #searchForm Enter */

    $('#searchF').on('submit', function(event) {
        event.preventDefault(); 
        var keyword = $('input[name="keyword"]').val().trim();
        if (keyword) {
            var currentUrl = window.location.href;
            var separator = currentUrl.includes('?') ? '&' : '?';
            var newUrl = currentUrl + separator + 'country_name=' + encodeURIComponent(keyword);
            window.location.href = newUrl; 
        }
    });
    
    
});/* ready */
</script>
</head>
<body>
    <button id="openModalBtn">지역 변경</button>
    <div id="myModal" class="modal">
        <div class="modal-content">
            <span class="close" id="closeModalBtn">&times;</span>
            <h3>지역 변경</h3>
            <hr style="border: 1px solid gray;">
            
 
            <form id="searchForm" action="" method="get">
   			<input type="text" name="country_name" id="country_name" placeholder="지역이나 동네로 검색하기">
    		<button type="button" id="searchBtn">검색</button><br>
    		<hr style="border: 1px solid gray;">
			</form>
			<div id="closesuggestion">
			<h4>추천 지역</h4>
			<button type="button" class="css-button">서울 강남구</button><br>
    		<hr style="border: none; height: 0.5px; background-color: gray;">
    		<button type="button" class="css-button">인천 연수구</button><br>
    		<hr style="border: none; height: 0.5px; background-color: gray;">
    		<button type="button" class="css-button">인천 남동구</button><br>
    		<hr style="border: none; height: 0.5px; background-color: gray;">
    		<button type="button" class="css-button">인천 미추홀구</button><br>
    		<hr style="border: none; height: 0.5px; background-color: gray;">
    		<button type="button" class="css-button">서울 종로구</button><br>
    		<hr style="border: none; height: 0.5px; background-color: gray;">
    		<button type="button" class="css-button">인천 서구</button><br>
    		<hr style="border: none; height: 0.5px; background-color: gray;">
    		<button type="button" class="css-button">서울 용산구</button><br>
    		<hr style="border: none; height: 0.5px; background-color: gray;">
    		<button type="button" class="css-button">서울 송파구</button><br>
    		<hr style="border: none; height: 0.5px; background-color: gray;">
    		<button type="button" class="css-button">서울 마포구</button><br>
    		<hr style="border: none; height: 0.5px; background-color: gray;">
			</div>
			<div id="searchResults">
			</div>
        </div>
    </div>

<form id="searchF" action="/seachlisttt" method="get">
    <input type="text" name="keyword" placeholder="검색어를 입력하세요">
    <button type="submit">검색</button>
</form>
</body>
</html>

<!-- Countries:

서울 강남구
인천 연수구
인천 남동구
인천 미추홀구
인천 부평구
서울 종로구
인천 서구
서울 용산구
서울 송파구
서울 마포구
Categories:

뷰티
의류
유아 제품
기타 중고 제품
가전 제품
식품
가구 

    		<button type="button" class="css-button">서울 강남구</button><br>
    		<hr style="border: none; height: 0.5px; background-color: gray;">
    		<button type="button" class="css-button">인천 연수구</button><br>
    		<hr style="border: none; height: 0.5px; background-color: gray;">
    		<button type="button" class="css-button">인천 남동구</button><br>
    		<hr style="border: none; height: 0.5px; background-color: gray;">
    		<button type="button" class="css-button">인천 미추홀구</button><br>
    		<hr style="border: none; height: 0.5px; background-color: gray;">
    		<button type="button" class="css-button">서울 종로구</button><br>
    		<hr style="border: none; height: 0.5px; background-color: gray;">
    		<button type="button" class="css-button">인천 서구</button><br>
    		<hr style="border: none; height: 0.5px; background-color: gray;">
    		<button type="button" class="css-button">서울 용산구</button><br>
    		<hr style="border: none; height: 0.5px; background-color: gray;">
    		<button type="button" class="css-button">서울 송파구</button><br>
    		<hr style="border: none; height: 0.5px; background-color: gray;">
    		<button type="button" class="css-button">서울 마포구</button><br>
    		<hr style="border: none; height: 0.5px; background-color: gray;">

-->