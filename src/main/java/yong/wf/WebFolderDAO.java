package yong.wf;

import java.io.File;
import java.util.*;

public class WebFolderDAO {

	public static final String USERS_HOME = "G:\\예병민\\jspstudy\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\myweb\\webFolder\\upload";

	private String userid;
	private String crpath;
	private String type;
	private long totalSize, usedSize, freeSize; // 총 용량, 사용 용량, 남은 용량

	public WebFolderDAO() {
		System.out.println("WebFolderDAO 객체 생성 됨");
		usedSize = 0;
		freeSize = 0;
		totalSize = 1024 * 1024 * 10; // 10MB
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getCrpath() {
		return crpath;
	}

	public void setCrpath(String crpath) {
		this.crpath = crpath;
	}

	public long getTotalSize() {
		return totalSize;
	}

	public void setTotalSize(long totalSize) {
		this.totalSize = totalSize;
	}

	public long getUsedSize() {
		return usedSize;
	}

	public void setUsedSize(long usedSize) {
		this.usedSize = usedSize;
	}

	public long getFreeSize() {
		return freeSize;
	}

	public void setFreeSize(long freeSize) {
		this.freeSize = freeSize;
	}

	public static String getUsersHome() {
		return USERS_HOME;
	}

	// 사용자 공간의 존재 유무, 없으면 폴더 만듦
	public void userFolderExist() {
		// 폴더 식별자 : userid
		File f = new File(USERS_HOME + "\\" + userid);
		if (!f.exists() && userid != null) {
			f.mkdir();
		}

		usedSize = 0;
		settingUsedSize(f);
		freeSize = totalSize - usedSize;
	}// userFolderExist

	// 실제 용량 구하는 메서드
	public void settingUsedSize(File f) {
		File files[] = f.listFiles();

		for (int i = 0; i < files.length; i++) {
			if (files[i].isFile()) {
				usedSize += files[i].length();
			} else {
				settingUsedSize(files[i]); // 재귀함수 호출
			}
		} // for
	}// settingUsedSize

	// 탐색기 메서드
	public Map<Integer, String> seeker(String path) {
		String root = USERS_HOME + "\\" + userid;
		if (path != null)
			root += "\\" + path;
		File f = new File(root);

		Map<Integer, String> map = new HashMap<Integer, String>();

		if (f.exists()) {
			File files[] = f.listFiles();
			System.out.println("files[] length = " + files.length);
			for (int i = 0; i < files.length; i++) {
				String type = files[i].isDirectory() ? "[폴더]" : "[파일]";
				map.put(i, type + "$" + root + "\\" + files[i].getName());
			} // for
		} // if

		return map;
	}// seeker
	
	public void download(String name) {
		System.out.println("다운로드 실행");
	}
	
	public void upload() {
		
	}

}
