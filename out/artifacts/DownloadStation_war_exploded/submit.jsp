<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.PreparedStatement" %>
<html>
<head>
    <title>添加结果</title>
    <style type="text/css">
        body{
            background: #d7c7e9;
            align-content: center;
            text-align: center;
        }
    </style>
</head>

<body>
<%request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id="info" class="vo.info"></jsp:useBean>
<jsp:setProperty name="info" property="*"/>
<%
    Connection conn =null;
    try{
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            out.print("驱动器加载失败");
        }
        String url = "jdbc:mysql://tty5.top:3306/grade?serverTimezone=GMT%2B8";
        String username = "root";
        String password = "213113";
        try{
            conn = DriverManager.getConnection(url,username,password);
        }catch (SQLException e){
            out.println(e.getMessage());
            out.println("数据库连接失败");
        }
        if(conn != null){
            String sql = "insert into info(webname,webURL64,webURL32)values(?,?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1,request.getParameter("webname"));
            ps.setString(2,request.getParameter("webURL64"));
            ps.setString(3,request.getParameter("webURL32"));
//            ps.setString(1,info.getWebnmae());
         //   ps.setString(2,info.getWeburl64());
         //   ps.setString(3, info.getWeburl32());,

            int row = ps.executeUpdate();
            if(row>0){
                out.println("成功添加了" + row + "条数据！");
            }
        }
    }catch (Exception e){
        e.printStackTrace();
        out.print("信息添加失败！");
    }
%>
<br>
<a href="book.jsp">返回</a>
</body>
</html>
