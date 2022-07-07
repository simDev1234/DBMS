package mymain;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class 로그인 {
	static {
		//1.DB Driver Loading
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
    public static void main(String[] args) throws Exception{
		//서버 정보
    	String url = "jdbc:oracle:thin:@localhost:1521:xe";
    	String user = "test1";
    	String pwd = "test1";
    	
    	//2.연결
    	Connection conn = DriverManager.getConnection(url, user, pwd);
    	
    	//3.명령 관리 객체 >>> 조회
    	Statement stmt = conn.createStatement();
    	
    	String id = "one";
    	String psswd = "1234";
    	
    	//30번 부서만 조회
    	String sql = String.format("SELECT * FROM test_member WHERE id = %s and pwd = %s",id,psswd);
    	
    	//조회 한 테이블 데이터를 담을 ResultSet
    	ResultSet rs = stmt.executeQuery(sql);
    	
    	//테이블 커서로 하나씩 돌리기
    	while (rs.next()) {
    		String saname = rs.getString("saname");
    		String sahire = rs.getString("sahire");
    		
    		//System.out.printf("%s님 게시글 등록 : %s\n",saname, sahire);
    		if(sahire == null) continue;
    		System.out.printf("%s님 게시글 등록 : %s\n",saname, sahire.substring(0,16));
    	}
    	
    	//4. 닫기
    	rs.close();
    	stmt.close();
    	conn.close();
	}
}
