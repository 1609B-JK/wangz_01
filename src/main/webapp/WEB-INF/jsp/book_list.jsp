<%--
  Created by IntelliJ IDEA.
  User: tianming
  Date: 2017/5/15
  Time: 16:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title></title>
  <script src="${pageContext.request.contextPath}/js/jquery-1.8.2.min.js"></script>
  <link href="${pageContext.request.contextPath}/styles/index.css" rel="stylesheet" type="text/css">
  <script>
    function addBook(){
      location.href="/toAddBook.action";
    }
    function updateBook(id){
      location.href="/toUpdateBook.action?id="+id;
    }
    function deleteBook(id){
      $.ajax({
        type:'post',
        url:'/deleteBookById.action',
        data:{id:id},
        dataType:'json',
        success:function(data){
          if(data){
            location.href="/findBookList.action";
          }else{
            alert("删除失败");
          }
        }
      })
    }
  </script>
</head>
<body>
<table>
  <tr>
    <th colspan="6">
      <form action="/findBookList.action" method="post">
        书名:<input value="${book.name}" name="name">
        <input type="submit" value="查询">
        <input value="新增" type="button" onclick="addBook()">
      </form>
    </th>
  </tr>
  <tr>
    <th>ID</th>
    <th>书名</th>
    <th>作者</th>
    <th>类型</th>
    <th>价格</th>
    <th>操作</th>
  </tr>
  <c:forEach items="${pageInfo.list}" var="b">
    <tr>
      <td>${b.id}</td>
      <td>${b.name}</td>
      <td>${b.author}</td>
      <td>${b.type}</td>
      <td>${b.price}</td>
      <td>
        <input value="修改" type="button" onclick="updateBook(${b.id})">
        <input value="删除" type="button" onclick="deleteBook(${b.id})">
      </td>
    </tr>
  </c:forEach>
  <tr>
    <th colspan="6">
      共${pageInfo.total}条记录&nbsp;&nbsp;
      共${pageInfo.pages}页&nbsp;&nbsp;
      第${pageInfo.pageNum}页&nbsp;&nbsp;
      <c:if test="${!pageInfo.isFirstPage}">
        <a href="/findBookList.action?name=${book.name}&pageNum=1">首页</a>&nbsp;
      </c:if>
      <c:if test="${pageInfo.hasPreviousPage}">
        <a href="/findBookList.action?name=${book.name}&pageNum=${pageInfo.prePage}">&laquo;</a>&nbsp;
      </c:if>
      <c:forEach items="${pageInfo.navigatepageNums}" var="i">
        <c:if test="${i==pageInfo.pageNum}">
          <span style="color: gray;">${i}</span>&nbsp;
        </c:if>
        <c:if test="${i!=pageInfo.pageNum}">
          <a href="/findBookList.action?name=${book.name}&pageNum=${i}">${i}</a>&nbsp;
        </c:if>
      </c:forEach>
      <c:if test="${pageInfo.hasNextPage}">
        <a href="/findBookList.action?name=${book.name}&pageNum=${pageInfo.nextPage}">&raquo;</a>&nbsp;
      </c:if>
      <c:if test="${!pageInfo.isLastPage}">
        <a href="/findBookList.action?name=${book.name}&pageNum=${pageInfo.pages}">尾页</a>&nbsp;
      </c:if>
    </th>
  </tr>
</table>
</body>
</html>
