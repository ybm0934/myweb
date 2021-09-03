package yong.jdbc;

import java.sql.*;

public class ConnectionJDBC {
	
	public void connect() {
		
		try {
			
		Class.forName("oracle.jdbc.driver.OracleDriver");
		
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "YBM";
		String pwd = "1234";
		
		Connection con = DriverManager.getConnection(url, user, pwd);
		
		}catch (ClassNotFoundException e) {
			e.printStackTrace();
		}catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

}
