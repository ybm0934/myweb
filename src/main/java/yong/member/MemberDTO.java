package yong.member;

import java.sql.Timestamp;

public class MemberDTO {

	private int idx;
	private String id;
	private String password;
	private String password_ok;
	private String name;
	private String birthday;
	private String gender;
	private String email;
	private String tel;
	private String zipcode;
	private String address1;
	private String address2;
	private Timestamp regdate;

	public int getIdx() {
		return this.idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPassword_ok() {
		return password_ok;
	}

	public void setPassword_ok(String password_ok) {
		this.password_ok = password_ok;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public String getAddress1() {
		return address1;
	}

	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	@Override
	public String toString() {
		return "MemberDTO [idx=" + idx + ", id=" + id + ", password=" + password + ", password_ok=" + password_ok
				+ ", name=" + name + ", birthday=" + birthday + ", gender=" + gender + ", email=" + email + ", tel="
				+ tel + ", zipcode=" + zipcode + ", address1=" + address1 + ", address2=" + address2 + ", regdate="
				+ regdate + "]";
	}

}
