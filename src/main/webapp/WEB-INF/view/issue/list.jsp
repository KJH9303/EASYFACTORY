<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시판</title>
    <link rel="stylesheet" href="../../../resources/issue/css/board.css">
    <script src="/resources/js/app.js"></script>
    <script defer src="/resources/js/pagination.js"></script>  
</head>
<body>
    <div id="headerContainer"></div>
    <div class="container">
        <h1>Table</h1>      
        <form id="searchForm">
            <label for="searchTerm">검색:</label>
            <input type="text" name="searchTerm" id="searchTerm">
            <button type="submit">검색</button>
            <button type="button" onclick="event.preventDefault(); location.href='write.html'">새 글 작성</button>    
        </form>
        

        <table>
            <tr>
                <th>글번호</th>
                <th>제목</th>
                <th>작성자</th>
                <th>작성일자</th>
            </tr>
            <tbody id="posts">
                <!-- 게시글 목록 -->
            </tbody>
        </table>
        
        
        <div id="pagination">
            <!-- 페이징 버튼 -->
        </div>       
        <hr>
    </div>
</body>
</html>
