package yong.member;

import java.sql.SQLException;

public class MemberService {

	private MemberDAO memberDao;

	public MemberService() {
		memberDao = new MemberDAO();
	}

	public static final int LOGIN_OK = 1;
	public static final int ID_NONE = 2;
	public static final int PWD_DISCORD = 3;

	// 회원 추가
	public int insertMember(MemberDTO dto) throws SQLException {
		int cnt = memberDao.insertMember(dto);
		return cnt;
	}// insertMember

	// 아이디 중복 체크
	public boolean idCheck(String id) throws SQLException {
		return memberDao.idCheck(id);
	}// idCheck

	// 로그인 체크
	public int loginCheck(String id, String pwd) throws Exception {
		return memberDao.loginCheck(id, pwd);
	}// loginCheck

	// 회원 정보 가져오기
	public MemberDTO selectMember(String userid) throws Exception {
		return memberDao.selectMember(userid);
	}// selectMember

}
