package yong.emp;

import java.sql.*;
import java.util.*;
import javax.naming.*;
import javax.sql.*;

import javax.naming.InitialContext;

public class EmpDAO {

	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;

	public EmpDAO() {

	}

	public int empAdd(EmpDTO dto) throws SQLException {
		try {
			System.out.println("empAdd() 실행");

			con = yong.db.YongDB.getConn();

			String sql = "insert into employee values(employee_seq.nextval, ?, ?, ?, sysdate)";

			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getName());
			ps.setString(2, dto.getEmail());
			ps.setString(3, dto.getDept());

			int cnt = ps.executeUpdate();
			System.out.println("cnt 값 : " + cnt);
			System.out.println("입력 값 dto : " + dto);

			return cnt;
		} catch (Exception e) {
			e.printStackTrace();

			return -1;
		} finally {
			if (ps != null)
				ps.close();
			if (con != null)
				con.close();
		}
	}// empAdd

	public List<EmpDTO> empList(String category, String word) throws SQLException {
		List<EmpDTO> list = new ArrayList<EmpDTO>();
		// Vector<EmpDTO> list = new Vector<EmpDTO>();

		try {
			System.out.println("empList() 실행");
			System.out.println("category : " + category + ", word : " + word);

			con = yong.db.YongDB.getConn();

			String sql = "select * from employee";

			if (word != null && !(word.isEmpty())) {
				if (!(category.equals("empno"))) {
					sql += " where " + category + " like '%" + word + "%'";
				} else {
					sql += " where " + category + " like '" + word + "'";
				}
			}
			sql += " order by empno asc";
			System.out.println("sql : " + sql);

			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();

			while (rs.next()) {
				int empno = rs.getInt("empno");
				String name = rs.getString("name");
				String email = rs.getString("email");
				String dept = rs.getString("dept");
				Timestamp regdate = rs.getTimestamp("regdate");

				// 컬럼 수가 많을 경우에 유용한 방법
				EmpDTO dto = new EmpDTO(empno, name, email, dept, regdate);

//				dto.setEmpno(empno);
//				dto.setName(name);
//				dto.setEmail(email);
//				dto.setDept(dept);
//				dto.setRegdate(regdate);

				list.add(dto);
			}

			System.out.println("empList() 결과 : " + list.size());
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				rs.close();
			if (ps != null)
				ps.close();
			if (con != null)
				con.close();
		}

		return list;
	}// empList

	public EmpDTO empDetail(int empno) throws SQLException {
		EmpDTO dto = new EmpDTO();

		try {
			System.out.println("empDetail 실행");

			con = yong.db.YongDB.getConn();

			String sql = "select * from employee where empno = ?";

			ps = con.prepareStatement(sql);
			ps.setInt(1, empno);

			rs = ps.executeQuery();

			if (rs.next()) {
				String name = rs.getString("name");
				String email = rs.getString("email");
				String dept = rs.getString("dept");
				Timestamp regdate = rs.getTimestamp("regdate");

				dto.setEmpno(empno);
				dto.setName(name);
				dto.setEmail(email);
				dto.setDept(dept);
				dto.setRegdate(regdate);
			}

			System.out.println("입력 값 dto : " + dto + ", empno = " + empno);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				rs.close();
			if (ps != null)
				ps.close();
			if (con != null)
				con.close();
		}

		return dto;
	}// empDetail

	public int empDelete(EmpDTO dto) throws SQLException {
		int cnt = 0;

		try {
			System.out.println("empDelete() 실행");

			con = yong.db.YongDB.getConn();

			String sql = "delete from employee where empno = ? and name = ?";

			ps = con.prepareStatement(sql);
			ps.setInt(1, dto.getEmpno());
			ps.setString(2, dto.getName());

			cnt = ps.executeUpdate();
			System.out.println("cnt 값 : " + cnt);
			System.out.println("입력값 dto : " + dto);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (ps != null)
				ps.close();
			if (con != null)
				con.close();
		}

		return cnt;
	}// empDelete

	public int empEdit(EmpDTO dto) throws SQLException {
		int cnt = 0;

		try {
			System.out.println("empEdit() 실행");

			con = yong.db.YongDB.getConn();

			String sql = "update employee set name = ?, email = ?, dept = ? where empno = ?";

			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getName());
			ps.setString(2, dto.getEmail());
			ps.setString(3, dto.getDept());
			ps.setInt(4, dto.getEmpno());

			cnt = ps.executeUpdate();
			System.out.println("cnt 값 : " + cnt);
			System.out.println("dto 값 : " + dto);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (ps != null)
				ps.close();
			if (con != null)
				con.close();
		}

		return cnt;
	}// empEdit
}
