package yong.member;

import java.sql.*;

public class MemberDAO {

	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	ConnectionPoolMgr pool;

	public MemberDAO() {
		pool = new ConnectionPoolMgr();
	}

	// 회원 추가
	public int insertMember(MemberDTO dto) throws SQLException {
		int cnt = 0;

		try {
			System.out.println("memberJoin() 실행\r\n");

			con = pool.getConnection();

			String sql = "insert into member values(member_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, sysdate, sysdate)";
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getId());
			ps.setString(2, dto.getPassword());
			ps.setString(3, dto.getName());
			ps.setString(4, dto.getBirthday());
			ps.setString(5, dto.getGender());
			ps.setString(6, dto.getEmail());
			ps.setString(7, dto.getTel());
			ps.setString(8, dto.getZipcode());
			ps.setString(9, dto.getAddress1());
			ps.setString(10, dto.getAddress2());

			cnt = ps.executeUpdate();

			System.out.println("회원가입 결과 cnt : " + cnt);
			System.out.println("MemberDTO : " + dto + "\r\n");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.dbClose(ps, con);
		}

		return cnt;
	}// memberJoin

	public boolean idCheck(String id) throws SQLException {
		boolean flag = false;

		try {
			System.out.println("idCheck() 실행\r\n");

			con = pool.getConnection();

			String sql = "select * from member where id like ?";

			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();

			if (rs.next())
				flag = true;

			System.out.println("flag 값 : " + flag);
			System.out.println("매개변수 id : " + id + "\r\n");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.dbClose(rs, ps, con);
		}

		return flag;
	}// idCheck

}
