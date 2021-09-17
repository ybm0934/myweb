package yong.wf;

import java.io.File;
import java.util.*;

public class WebFolderDAO {

	public static final String USERS_HOME = "G:\\예병민\\jspstudy\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\myweb\\webFolder\\upload";

	private String userid;
	private String crpath;
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

	// 폴더 생성 메서드
	public boolean userFolderMk(String fName) {
		System.out.println("userFolderMk() 실행");
		System.out.println("매개변수 fName : " + fName);

		File f = new File(USERS_HOME + "\\" + crpath + "\\" + fName);

		boolean access = false;
		if (!f.exists() && fName != null) {
			access = true;
			f.mkdir();
		}

		return access;
	}// userFolderMk

	// 폴더 삭제 메서드
	public boolean userFolderDel(String fName) {
		System.out.println("userFolderDel() 실행");

		File f = new File(USERS_HOME + "\\" + crpath + "\\" + fName);
		System.out.println("현재 경로 : " + USERS_HOME + "\\" + crpath + "\\" + fName);

		boolean access = false;
		if (f.exists() && fName != null) {
			File[] files = f.listFiles();

			if (files != null) {
				System.out.println("files 크기 : " + files.length);

				for (int i = 0; i < files.length; i++) {
					if (files[i].isFile()) {
						files[i].delete();
						System.out.println("파일 삭제 완료");
					} else {
						userFolderDel(fName + "\\" + files[i].getName());
						System.out.println("폴더 삭제 완료");
					}
					files[i].delete();

				} // for
				f.delete();

				access = true;
			} // if
		} // if

		return access;
	}// userFolderDel

}
