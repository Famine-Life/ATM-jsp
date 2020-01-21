package util;

import java.sql.*;

/**
 * jdbc数据库连接简单封装
 */
public class DBhelper {
	
	//private static final String driver = "com.mysql.jdbc.Driver";   //com.mysql.cj.jdbc.Driver
	private static final String driver = "com.mysql.cj.jdbc.Driver";   //com.mysql.jdbc.Driver (新版)
	private static final String url = "jdbc:mysql://127.0.0.1:3306/atm?useUnicode=true&characterEncoding=utf8&serverTimezone=GMT";
	private static final String user = "root";
	private static final String password = "123456";

	//静态代码
	static{
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			System.out.println("驱动加载失败!");
		}
	}
	
	public static Connection getConnection() throws SQLException{
		//返回connection连接
		return DriverManager.getConnection(url,user,password);
	}

	//关闭数据库连接的方法
	public static void closeConnection(ResultSet rs, PreparedStatement ps, Connection conn) throws SQLException {
		if(rs!= null) {
			//  关闭结果集对象
			rs.close();
		}
		if(ps != null) {
			// 关闭处理SQL语句的对象
			ps.close();
		}
		if(conn != null) {
			// 关闭数据的连接对象
			conn.close();
		}
	}

}





