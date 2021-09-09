package yong.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class abcd {

	ConnectionPoolMgr pool = new ConnectionPoolMgr();
	PreparedStatement ps;
	ResultSet rs;
	Connection conn;

	public int idCheck(String id) {
		int count = 0;
		try {
			pool.getConnection();
			String sql = "select count(*) from jsp_member where id = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();

			while (rs.next()) {
				count = rs.getInt(1);
			}
			return count;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {

			}
		}
	}
}