package yong.file;

import java.io.*;

public class FileTest {

	public static void main(String[] args) {

		String path = "G:\\예병민\\IMG\\YBM_logo.png";
		File f = new File(path);
		double size = f.length() / 1024 / 1024;

		System.out.println("f야 너 있니? " + f.exists());
		System.out.println("f야 너 파일이니? " + f.isFile());
		System.out.println("f야 너 폴더니? " + f.isDirectory());
		System.out.println("f야 너는 이름이 뭐니? " + f.getName());
		System.out.println("f야 너는 어디에 있니? " + f.getPath());
		System.out.println("f야 너 용량이 얼마니? " + size + "MB");
		System.out.println();

		String path2 = "G:\\예병민";
		File f2 = new File(path2);

		System.out.println("f2야 너 있니? " + f2.exists());
		System.out.println("f2야 너 파일이니? " + f2.isFile());
		System.out.println("f2야 너 폴더니? " + f2.isDirectory());
		System.out.println("f2야 너는 이름이 뭐니? " + f2.getName());
		System.out.println("f2야 너는 어디에 있니? " + f2.getPath());
		System.out.println("f2야 너 용량이 얼마니? " + f2.length());
		System.out.println();

		File files[] = f2.listFiles();
		System.out.println("예병민 폴더의 목록 갯수 : " + files.length);

		for (int i = 0; i < files.length; i++) {
			double size_ = 0;
			String type = "";
			String result = "";
			if (files[i].isFile()) {
				type = "[FILE] ";
				size = (files[i].length()) / 1024.0;
				result = type + files[i].getName() + "(" + size + "KB)";
			} else {
				type = "[DIR] ";
				result = type + files[i].getName();
			}

			System.out.println(result);
		} // for

	}// main

}
