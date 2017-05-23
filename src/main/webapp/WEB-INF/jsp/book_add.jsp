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
    function tijiao(){
      $.ajax({
        type:'post',
        url:"/insertOrUpdateBook.action",
        data:$('form').serialize(),
        dataTpye:'json',
        success:function(data){
          if(data){
            location.href="/findBookList.action";
          }else{
            alert("提交失败");
          }
        }
      })
    }
  </script>
</head>
<body>
<form>
  <table>
    <tr>
      <th>书名</th>
      <td><input name="name"></td>
    </tr>
    <tr>
      <th>作者</th>
      <td><input name="author"></td>
    </tr>
    <tr>
      <th>类型</th>
      <td><input name="type"></td>
    </tr>
    <tr>
      <th>价格</th>
      <td><input name="price"></td>
    </tr>
    <tr>
      <th colspan="2">
        <input value="提交" type="button" onclick="tijiao()">
      </th>
    </tr>
  </table>
</form>
</body>
</html>
