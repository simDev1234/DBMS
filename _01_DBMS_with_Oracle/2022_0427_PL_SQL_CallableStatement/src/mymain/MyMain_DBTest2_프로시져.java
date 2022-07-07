package mymain;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;

public class MyMain_DBTest2_프로시져 {
	
	//DB Driver Loading
	//메인 메소드가 시작되기 전에 먼저 0순위로 선작업.
	static {
		// 0. 객체가 생성 되기 이전에 클래스를 메모리에 적재 
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	public static void main(String[] args) throws Exception{
		// 1. Connection을 얻어오기
		//(1) 연결경로, 사용자정보 가져오기
		//            jdbc:oracle:드라이버종류:@IP주소:포트:db아이디   <<- JavaEE에서 Data Source Explorer > Properties의 URL복사
		String url = "jdbc:oracle:thin:@localhost:1521:xe"; 
		String user = "test1";
		String pwd  = "test1";
		
		//(2) Connection 인스턴스를 싱글톤 방식으로 가져온다.
		Connection conn = DriverManager.getConnection(url, user, pwd);
		System.out.println("---------Success Connection-------");
		
		//2. Procedure사용할 객체
		String sql = "call book_insert(?, ?)";
		CallableStatement cstmt = conn.prepareCall(sql);
		
		//3. Parameter
		cstmt.setString(1, "And");
		cstmt.setInt(2, 22000);
		
		//4. 실행
		cstmt.executeUpdate();
		
		//5. 닫기 (열린 역순)
		cstmt.close();
		conn.close();
		
	}

}
