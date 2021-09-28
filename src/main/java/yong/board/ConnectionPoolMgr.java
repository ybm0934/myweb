package yong.board;

import java.sql.*;

public class ConnectionPoolMgr {

	public ConnectionPoolMgr() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("드라이버 로딩 성공\r\n");
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 로딩 실패\r\n");
			e.printStackTrace();
		}
	}// 생성자

	public Connection getConnection() throws SQLException {
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "scott";
		String pwd = "1234";

		Connection con = DriverManager.getConnection(url, user, pwd);
		System.out.println("DB연결 con : " + con + "\r\n");

		return con;
	}// getConnection

	public void dbClose(PreparedStatement ps, Connection con) throws SQLException {
		if (ps != null)
			ps.close();
		if (con != null)
			con.close();
	}

	public void dbClose(ResultSet rs, PreparedStatement ps, Connection con) throws SQLException {
		if (rs != null)
			rs.close();
		if (ps != null)
			ps.close();
		if (con != null)
			con.close();
	}

}
