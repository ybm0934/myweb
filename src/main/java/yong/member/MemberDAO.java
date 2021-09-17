package yong.member;

import java.sql.*;

public class MemberDAO {

	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	ConnectionPoolMgr pool;

	public static final int LOGIN_OK = 1;
	public static final int ID_NONE = 2;
	public static final int PWD_DISCORD = 3;

	public MemberDAO() {
		pool = new ConnectionPoolMgr();
	}

	// 회원 추가
	public int insertMember(MemberDTO dto) throws SQLException {
		int cnt = 0;

		try {
			System.out.println("insertMember() 실행\r\n");

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
	}// insertMember

	// 아이디 중복 체크
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

	// 로그인 체크
	public int loginCheck(String id, String pwd) throws Exception {
		int cnt = -1;

		try {
			System.out.println("loginCheck() 실행\r\n");

			con = pool.getConnection();

			String sql = "select password from member where id = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			if (rs.next()) {
				String dbPwd = rs.getString("password");
				if (dbPwd.equals(pwd)) {
					cnt = LOGIN_OK;
				} else {
					cnt = PWD_DISCORD;
				}
			} else {
				cnt = ID_NONE;
			}

			System.out.println("cnt 값 : " + cnt);
			System.out.println("파라미터 id : " + id);
			System.out.println("파라미터 pwd : " + pwd + "\r\n");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.dbClose(rs, ps, con);
		}

		return cnt;
	}// loginCheck

	// 회원 정보 가져오기
	public MemberDTO selectMember(String userid) throws Exception {
		MemberDTO dto = new MemberDTO();

		try {
			System.out.println("selectMember() 실행\r\n");

			con = pool.getConnection();

			String sql = "select * from member where id = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, userid);
			rs = ps.executeQuery();
			if (rs.next()) {
				String id = rs.getString("id");
				String name = rs.getString("name");
				String birthday = rs.getString("birthday");
				String gender = rs.getString("gender");
				String email = rs.getString("email");
				String tel = rs.getString("tel");
				String zipcode = rs.getString("zipcode");
				String address1 = rs.getString("address1");
				String address2 = rs.getString("address2");
				Timestamp regdate = rs.getTimestamp("regdate1");

				dto.setId(id);
				dto.setName(name);
				dto.setBirthday(birthday);
				dto.setGender(gender);
				dto.setEmail(email);
				dto.setTel(tel);
				dto.setZipcode(zipcode);
				dto.setAddress1(address1);
				dto.setAddress2(address2);
				dto.setRegdate(regdate);
			}
			
			System.out.println("파라미터 userid = " + userid);
			System.out.println("입력값 dto = " + dto);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.dbClose(rs, ps, con);
		}

		return dto;
	}// selectMember

}
