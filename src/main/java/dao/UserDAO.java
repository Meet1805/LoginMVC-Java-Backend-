package dao;

import java.sql.*;

import model.User;
import Util.DBConnection;
public class UserDAO {
		
	Connection con = DBConnection.getConnection();
	
	// Register 
	
	@SuppressWarnings("null")
	public boolean register(User user) {
		boolean status = false ;
		try {
			String sql = 
					"insert into users(name,email,password) values(?,?,?)";
			
			PreparedStatement ps = con.prepareStatement(sql);
			
			ps.setString(1, user.getName());
			ps.setString(2, user.getEmail());
			ps.setString(3, user.getPassword());
			
			int row = ps.executeUpdate();
			
			if (row > 0)
				status = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}

	//login
	public User login(String email,String password) {
		User user = null;
		
		try {
			String sql = "select * from users where email=? and password=?";
			
			PreparedStatement ps = con.prepareStatement(sql);
			
			ps.setString(1, email);
			ps.setString(2, password);

			ResultSet rs = ps.executeQuery();
			
			if (rs.next()) {
				
				user = new User();
				user.setId(rs.getInt("id"));
				user.setName(rs.getString("name"));
				user.setEmail(rs.getString("email"));
				}
		}catch (Exception e) {
			
		}
		return user;
		
	}

}
