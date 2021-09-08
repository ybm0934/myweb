package yong.bean;

public class BeanTest {

	private String name;
	private int age;
	private String tel;
	private String addr;

	public BeanTest() {
		System.out.println("BeanTest() 생성자 호출 됨");
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}
	
	public String getTel() {
		return tel;
	}
	
	public void setTel(String tel) {
		this.tel = tel;
	}
	
	public String getAddr() {
		return addr;
	}
	
	public void setAddr(String addr) {
		this.addr = addr;
	}
	
	
	

}
