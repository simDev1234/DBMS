package vo;

//3위 일체
//DB column명 == Vo의 property(속성)명 == Parameter명(html입력폼)

public class DeptVo {
	
	int    deptno;
	String dname;
	String loc;
	
	public int getDeptno() {
		return deptno;
	}
	public void setDeptno(int deptno) {
		this.deptno = deptno;
	}
	public String getDname() {
		return dname;
	}
	public void setDname(String dname) {
		this.dname = dname;
	}
	public String getLoc() {
		return loc;
	}
	public void setLoc(String loc) {
		this.loc = loc;
	}
	
}
