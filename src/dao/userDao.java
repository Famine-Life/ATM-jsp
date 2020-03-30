package dao;

import entity.UserInfo;
import util.DBhelper;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class userDao {

	/**
	 * 查询所有user信息
	 * @return List<UserInfo>
	 */
	public List<UserInfo> getUsersList() throws SQLException {
		Connection conn=null;
		PreparedStatement ps=null;
		ResultSet rs = null;
		List<UserInfo> usersList = new ArrayList<UserInfo>();
		String sql = "select * from user";
		try {
			 conn = DBhelper.getConnection();
			 ps = conn.prepareStatement(sql);
			  rs = ps.executeQuery(sql);
			 while(rs.next()){
				 UserInfo user = new UserInfo();
				 int id = rs.getInt(1);
				 String name = rs.getString(2);
				 String pid = rs.getString(3);
				 String phone = rs.getString(4);
				 String address = rs.getString(5);
				 user.setCustomerId(id);
				 user.setCustomerName(name);
				 user.setPid(pid);
				 user.setTelephone(phone);
				 user.setAddress(address);
				 usersList.add(user);
			 }
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBhelper.closeConnection(rs,ps,conn);
		}
		return usersList;
	}

	//通过id查user信息
	public UserInfo getUsersById(String id) throws SQLException {
		Connection conn=null;
		PreparedStatement ps=null;
		ResultSet rs = null;
		UserInfo user = new UserInfo();
		String sql = "select * from userinfo where customer_id="+id;
		try {
			 conn=DBhelper.getConnection();
			 ps = conn.prepareStatement(sql);
			 rs = ps.executeQuery();
			while(rs.next()){
				user.setCustomerId(rs.getInt(1));
				user.setCustomerName(rs.getString(2));
				user.setPid(rs.getString(3));
				user.setTelephone(rs.getString(4));
				user.setAddress(rs.getString(5));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBhelper.closeConnection(rs,ps,conn);
		}
		return user;
	}

	//通过username查user信息
	public UserInfo getUsersByUsername(String username) throws SQLException {
		Connection conn=null;
		PreparedStatement ps=null;
		ResultSet rs = null;
		UserInfo user = new UserInfo();
		String sql = "select * from userinfo where customer_name="+"\'"+username+"\'";
		System.out.println(sql);
		try {
			conn=DBhelper.getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()){
				user.setCustomerId(rs.getInt(1));
				user.setCustomerName(rs.getString(2));
				user.setPid(rs.getString(3));
				user.setTelephone(rs.getString(4));
				user.setAddress(rs.getString(5));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBhelper.closeConnection(rs,ps,conn);
		}
		return user;
	}


	/**
	 * 添加user的方法,,应该用不到
	 * @param
	 */
	public void addUser(UserInfo user) throws SQLException {
		Connection conn=null;
		PreparedStatement ps=null;
		ResultSet rs = null;
		String sql="insert into userinfo values(?,?,?,?,?,?);";
		try {
			conn = DBhelper.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1,user.getCustomerId());
			ps.setString(2,user.getCustomerName());
			ps.setString(3,user.getPid());
			ps.setString(4,user.getTelephone());
			ps.setString(5,user.getAddress());
			ps.execute();
			
		/*	 ResultSet rs = ps.getGeneratedKeys();
	            if (rs.next()) {
	                int id = rs.getInt(1);
	                user.setId(id);
	            }*/
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBhelper.closeConnection(rs,ps,conn);
		}
	}
		
	//根据据id删除user
	public boolean deleteUser(String id) throws SQLException {
		Connection conn=null;
		PreparedStatement ps=null;
		ResultSet rs = null;
		boolean result = false;
		try {
			 conn = DBhelper.getConnection();
			String sql="delete from userinfo where customer_id=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, id);
			result=ps.execute();
			//System.out.println(result); //execute()  true or false
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBhelper.closeConnection(rs,ps,conn);
		}
		return result;
	}
	
	//更新user信息
	public void updataUser(UserInfo user) throws SQLException {
		Connection conn=null;
		PreparedStatement ps=null;
		ResultSet rs = null;
		String sql="update userinfo set customer_id=?,customer_name=?,pid=?,telephone=?,address=? where id=?";
		try {
			 conn=DBhelper.getConnection();
			 ps = conn.prepareStatement(sql);
			ps.setInt(1, user.getCustomerId());
			ps.setString(2, user.getCustomerName());
			ps.setString(3, user.getPid());
			ps.setString(4, user.getTelephone());
			ps.setString(5, user.getAddress());
			ps.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBhelper.closeConnection(rs,ps,conn);
		}
	}
	
}
