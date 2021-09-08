package yong.emp;

import java.sql.Timestamp;

public class EmpDTO {
	
	private int empno;
	private String name;
	private String email;
	private String dept;
	private Timestamp regdate;
	
	public EmpDTO() {
		System.out.println("empDto 생성자 호출됨");
	}

	public EmpDTO(int empno, String name, String email, String dept, Timestamp regdate) {
		this.empno = empno;
		this.name = name;
		this.email = email;
		this.dept = dept;
		this.regdate = regdate;
	}

	public int getEmpno() {
		return empno;
	}

	public void setEmpno(int empno) {
		this.empno = empno;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getDept() {
		return dept;
	}

	public void setDept(String dept) {
		this.dept = dept;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	@Override
	public String toString() {
		return "EmpDTO [empno=" + empno + ", name=" + name + ", email=" + email + ", dept=" + dept + ", regdate="
				+ regdate + "]";
	}
	
}
