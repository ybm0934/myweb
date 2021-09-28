package yong.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class BoardDAO {

	ConnectionPoolMgr pool;
	Connection con;
	PreparedStatement ps;
	ResultSet rs;

	public BoardDAO() {
		pool = new ConnectionPoolMgr();
	}

	// 목록
	public List<BoardDTO> list(String category, String keyword) throws SQLException {
		List<BoardDTO> list = new ArrayList<BoardDTO>();

		try {
			System.out.println("list 실행\r\n");

			con = pool.getConnection();

			String sql = "select * from board";
			if (keyword != null && !keyword.isEmpty()) {
				sql += " where " + category + " like '%" + keyword + "%'";
			}
			sql += " order by no desc";

			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();

			while (rs.next()) {
				int no = rs.getInt("no");
				String title = rs.getString("title");
				String name = rs.getString("name");
				Timestamp regdate = rs.getTimestamp("regdate");
				int count = rs.getInt("count");

				BoardDTO boardDto = new BoardDTO();

				boardDto.setNo(no);
				boardDto.setTitle(title);
				boardDto.setName(name);
				boardDto.setRegdate(regdate);
				boardDto.setCount(count);

				list.add(boardDto);
			} // while

			System.out.println("글 목록 결과 list.size() = " + list.size());
			System.out.println("파라미터 category : " + category + ", keyword : " + keyword + "\r\n");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.dbClose(rs, ps, con);
		}

		return list;
	}// list

	// 글쓰기
	public int write(BoardDTO boardDto) throws SQLException {
		int cnt = 0;
		try {
			System.out.println("write 실행\r\n");

			con = pool.getConnection();

			String sql = "INSERT INTO board(NO, NAME, pwd, title, CONTENT, fileName, fileSize) VALUES(board_seq.nextval, ?, ?, ?, ?, ?, ?)";
			ps = con.prepareStatement(sql);
			ps.setString(1, boardDto.getName());
			ps.setString(2, boardDto.getPwd());
			ps.setString(3, boardDto.getTitle());
			ps.setString(4, boardDto.getContent());
			ps.setString(5, boardDto.getFileName());
			ps.setDouble(6, boardDto.getFileSize());

			cnt = ps.executeUpdate();
			System.out.println("글쓰기 결과 cnt = " + cnt);
			System.out.println("파라미터 boardDto = " + boardDto + "\r\n");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.dbClose(ps, con);
		}

		return cnt;
	}// write
	
	// 파일 업로드

	// 상세보기
	// 수정
	// 삭제

}
