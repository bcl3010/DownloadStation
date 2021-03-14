//package Dao;
//
//import java.sql.*;
//import java.util.ArrayList;
//
//import vo.info;
//
//public class infoDao {
//    private Connection conn=null;
//
//    public void initConnection() throws Exception{
//        Class.forName("com.mysql.jdbc.Driver");
//        conn= DriverManager.getConnection("jdbc:mysql://tty5.top:3306/grade","root","213113");
//    }
//
//    //查询
//    public ArrayList getAllInfo(String webname) throws Exception{
//        ArrayList al=new ArrayList();
//        initConnection();
//        String sql="select * from info";
//        PreparedStatement ps= conn.prepareStatement(sql);
//        ps.setString(1,webname);
//        ResultSet rs= ps.executeQuery();
//        while(rs.next()){
//            info info=new info();
//            info.setWebnmae(rs.getString("webname"));
//            info.setWeburl64(rs.getString("webURL"));
//            al.add(webname);
//        }
//        closeConnection();
//        return al;
//    }
//
//    private void closeConnection() throws Exception{
//        conn.close();
//    }
//}
