<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@page import="java.sql.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">
    <title>My JSP 'datatest.jsp' starting page</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">

    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->
    <style>
        main{
            width:70%;
            text-align:center;
            margin:auto;
        }
    </style>
</head>

<body>
<div style="text-align:right"><a href="https://tty5.top/mypage/" style="text-decoration:none">回到首页</a>
        <main >
            <%
                try {
                    Class.forName("com.mysql.jdbc.Driver");  ////驱动程序名
                    String url = "jdbc:mysql://tty5.top:3306/grade"; //数据库名
                    String username = "root";  //数据库用户名
                    String password = "213113";  //数据库用户密码
                    Connection conn = DriverManager.getConnection(url, username, password);  //连接状态

                    if(conn != null){
                        out.print("\n");
                        out.print("<br />");
            %>
            <table class="table table-hover" >
                <caption fontweight:700>下载</caption>
                <thead>
                <tr>
                    <th>序号</th>
                    <th>名称</th>
                    <th>URL</th>
                </tr>
                </thead>
                <%
                    Statement stmt = null;
                    ResultSet rs = null;
                    String sql = "SELECT * FROM info ORDER BY webname;";  //查询语句
                    stmt = conn.createStatement();
                    rs = stmt.executeQuery(sql);
                    //   out.print("查询结果：");
                    out.print("<br/>");
                    int i = 1;
                    while (rs.next()) {

                %>
                <tbody>
                <tr>

                    <td><%=i++%></td>
                    <td><%=rs.getString("webname") %>
                    </td>
                    <td><a href="<%= rs.getString("webURL64")%>">
                        <button type="button" class="btn btn-primary btn-xs"> 64 位 下 载</button>
                    </a>&nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="<%= rs.getString("webURL32")%>">
                            <button type="button" class="btn btn-primary btn-xs"> 32 位 下 载</button>
                        </a>
                    </td>
                </tr>
                </tbody>
                <%
                            }
                        } else {
                            out.print("连接失败！");
                        }
                    } catch (Exception e) {
                        //e.printStackTrace();
                        out.print("数据库连接异常！");
                    }
                %>
            </table>
        </main>
</body>
</html>
