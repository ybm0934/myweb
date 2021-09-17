package yong.scope;

public class ScopeTest {

	private int count;

	public ScopeTest() {
		System.out.println("ScopeTest 객체 생성됨");
		count = 0;
	}

	public int getCount() {
		System.out.println("count의 값 : " + count);
		return count;
	}

	public void setCount(int count) {
		this.count += count;
		System.out.println(count + "가 누적되어 " + this.count + "로 값이 변경됨");
	}

}
