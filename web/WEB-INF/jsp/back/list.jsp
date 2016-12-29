<%@ page import="com.dao.MessageDao" %>
<%@ page import="com.bean.Message" %>
<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/12/19 0019
  Time: 下午 8:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <%--<meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE" />--%>
  <title>内容列表页面</title>
  <link href="<%= basePath %>resources/css/all.css" rel="stylesheet" type="text/css" />
  <script src="<%= basePath %>resources/js/common/jquery-1.8.0.min.js"></script>
  <script src="<%= basePath %>resources/js/back/list.js"></script>
</head>

<body style="background: #e1e9eb;">
<form action="<%= basePath %>List.action" id="mainForm" method="post">
  <input type="hidden" name="currentPage" id="currentPage" value=" "/>
  <div class="right">
    <div class="current">当前位置：<a href="javascript:void(0)" style="color:#6E6E6E;">内容管理</a> &gt; 内容列表</div>
    <div class="rightCont">
      <p class="g_title fix">内容列表 <a class="btn03" href="#">新 增</a>&nbsp;&nbsp;&nbsp;&nbsp;<a class="btn03" href="javascript:deleteBatch('<%=basePath%>');">删 除</a></p>
      <table class="tab1">
        <tbody>
        <tr>
          <td width="90" align="right">指令名称：</td>
          <td>
            <%--此处要用el表达式来设置value的值，否则不会显示空白而是显示null--%>
            <input name="command" type="text" class="allInput" value="${command}"/>
          </td>
          <td width="90" align="right">描述：</td>
          <td>
            <input name="description" type="text" class="allInput" value="${description}"/>
          </td>
          <td width="85" align="right"><input type="submit" class="tabSub" value="查 询" /></td>
        </tr>
        </tbody>
      </table>
      <div class="zixun fix">
        <table class="tab2" width="100%">
          <tbody>
          <tr>
            <th><input type="checkbox" id="all" onclick=""/></th>
            <th>序号</th>
            <th>指令名称</th>
            <th>描述</th>
            <th>操作</th>
          </tr>
          <%
            List<Message> messageList = (List)request.getAttribute("messageList");
            for (int i = 0;i < messageList.size();i++){
          %>
            <tr style=<%=(i % 2 == 0)?"background-color:#e1e9eb;":"background-color:#ECF6EE;"%>>
              <td><input type="checkbox" name="id" value="<%=messageList.get(i).getId()%>"></td>
              <td><%=(i+1)%></td>
              <td><%=messageList.get(i).getCommand()%></td>
              <td><%=messageList.get(i).getDescription()%></td>
              <td>
                <a href="#">修改</a>&nbsp;&nbsp;&nbsp;
                <a href="<%=basePath%>DeleteOneServlet.action?id=<%=messageList.get(i).getId()%>" onclick="deleteOne();">删除</a>
              </td>
            </tr>
          <%
            }
          %>
          </tbody>
        </table>
        <div class='page fix'>
          共 <b>${page.totalNumber}</b> 条
          <c:if test="${page.currentPage != 1}">
            <a href="javascript:changeCurrentPage('1')" class='first'>首页</a>
            <a href="javascript:changeCurrentPage('${page.currentPage-1}')" class='pre'>上一页</a>
          </c:if>
          当前第<span>${page.currentPage}/${page.totalPage}</span>页
          <c:if test="${page.currentPage != page.totalPage}">
            <a href="javascript:changeCurrentPage('${page.currentPage+1}')" class='next'>下一页</a>
            <a href="javascript:changeCurrentPage('${page.totalPage}')" class='last'>末页</a>
          </c:if>
          跳至&nbsp;<input id="currentPageText" type='text' value='${page.currentPage}' class='allInput w28' />&nbsp;页&nbsp;
          <a href="javascript:changeCurrentPage($('#currentPageText').val())" class='go'>GO</a>
        </div>
      </div>
    </div>
  </div>
</form>
</body>
</html>
