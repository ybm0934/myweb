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

			String sql = "SELECT * FROM board";
			if (keyword != null && !keyword.isEmpty()) {
				sql += " WHERE " + category + " LIKE '%" + keyword + "%'";
			}
			sql += " ORDER BY groupno DESC, sortno ASC";

			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();

			while (rs.next()) {
				int no = rs.getInt("no");
				String title = rs.getString("title");
				String name = rs.getString("name");
				Timestamp regdate = rs.getTimestamp("regdate");
				int count = rs.getInt("count");
				int step = rs.getInt("step");

				BoardDTO boardDto = new BoardDTO();

				boardDto.setNo(no);
				boardDto.setTitle(title);
				boardDto.setName(name);
				boardDto.setRegdate(regdate);
				boardDto.setCount(count);
				boardDto.setStep(step);

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

			String sql = "INSERT INTO board(NO, NAME, pwd, title, CONTENT, fileName, fileSize, groupno) VALUES(board_seq.nextval, ?, ?, ?, ?, ?, ?, board_seq.nextval)";
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
	public BoardDTO detail(int no) throws SQLException {
		BoardDTO boardDto = new BoardDTO();

		try {
			System.out.println("detail 실행\r\n");

			con = pool.getConnection();

			String sql = "SELECT * FROM board WHERE no = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, no);
			rs = ps.executeQuery();
			int cnt = 0;
			if (rs.next()) {
				String name = rs.getString("name");
				String title = rs.getString("title");
				String content = rs.getString("content");
				int count = rs.getInt("count");
				Timestamp regdate = rs.getTimestamp("regdate");
				String fileName = rs.getString("fileName");
				double fileSize = rs.getDouble("fileSize");
				int downCount = rs.getInt("downCount");
				int groupno = rs.getInt("groupno");
				int step = rs.getInt("step");
				int sortno = rs.getInt("sortno");
				
				// 조회 수 증가
				sql = "update board set count = count + 1 where no = ?";
				ps = con.prepareStatement(sql);
				ps.setInt(1, no);
				cnt = ps.executeUpdate();

				boardDto.setName(name);
				boardDto.setTitle(title);
				boardDto.setContent(content);
				boardDto.setCount(count);
				boardDto.setRegdate(regdate);
				boardDto.setFileName(fileName);
				boardDto.setFileSize(fileSize);
				boardDto.setDownCount(downCount);
				boardDto.setGroupno(groupno);
				boardDto.setStep(step);
				boardDto.setSortno(sortno);
			}

			System.out.println("detail 파라미터 no : " + no);
			System.out.println("조회수 증가 결과 cnt : " + cnt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.dbClose(rs, ps, con);
		}

		return boardDto;
	}// detail

	// 수정
	// 삭제

	// 답글
	public int reply(BoardDTO boardDto) throws SQLException {
		int cnt = 0;

		try {
			System.out.println("reply 실행\r\n");

			con = pool.getConnection();

			// sortno 자리 확보
			String sql = "update board set sortno = sortno + 1 where groupno = ? and sortno > ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, boardDto.getGroupno());
			ps.setInt(2, boardDto.getSortno());
			cnt = ps.executeUpdate();
			System.out.println("답글 cnt1 : " + cnt);
			System.out.println("파라미터 boardDto : " + boardDto + "\r\n");

			// insert 진행
			sql = "INSERT INTO board(NO, NAME, pwd, title, CONTENT, groupno, step, sortno) VALUES(board_seq.nextval, ?, ?, ?, ?, ?, ?, ?)";
			ps = con.prepareStatement(sql);
			ps.setString(1, boardDto.getName());
			ps.setString(2, boardDto.getPwd());
			ps.setString(3, boardDto.getTitle());
			ps.setString(4, boardDto.getContent());
			ps.setInt(5, boardDto.getGroupno());
			ps.setInt(6, boardDto.getStep() + 1);
			ps.setInt(7, boardDto.getSortno() + 1);

			cnt = ps.executeUpdate();
			System.out.println("답글 cnt2 : " + cnt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.dbClose(ps, con);
		}

		return cnt;
	}//

	// 댓글
	public void comment() {
		
	}

}
