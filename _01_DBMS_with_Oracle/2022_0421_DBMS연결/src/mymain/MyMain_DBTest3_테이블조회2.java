package mymain;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
//import oracle.jdbc.driver.OracleDriver;

public class MyMain_DBTest3_테이블조회2 {
	
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
		String url = "jdbc:oracle:thin:@localhost:1521:xe"; 
		String user = "test1";
		String pwd  = "test1";
		
		Connection conn = DriverManager.getConnection(url, user, pwd);
		System.out.println("---------Success Connection-------");
		
		Statement stmt = conn.createStatement();
		
		String sql = "SELECT \r\n"
				+ "  v2.*,\r\n"
				+ "  TO_NUMBER(SUBSTR(GOJUMIN,3,2)) as birth_month,\r\n"
				+ "  TO_NUMBER(SUBSTR(GOJUMIN,5,2)) as birth_day\r\n"
				+ "FROM gogek_view v2";
		ResultSet rs = stmt.executeQuery(sql);

		while(rs.next()) { 
//			int gobun = rs.getInt("gobun");
//			String goname   = rs.getString("goname"); // 에러! 위에서 헤딩명을 바꾸었기 때문에 deptno를 인식하지 못한다.
//			String gojumin = rs.getString("gojumin");// 어떤 데이터를 가져올지 알 수 없음
//			String goaddr   = rs.getString("goaddr"); 
//			
			
//			System.out.printf("[%02d-%-3s-%s-%s]\n",gobun,goname,gojumin,goaddr);
			
			
			String goname = rs.getString("goname");
			int birth_month = rs.getInt("birth_month");
			int birth_day = rs.getInt("birth_day");	
			int samgr = rs.getInt("samgr");
			
			
			System.out.printf("사랑하는 [%s] 고객님, 오늘은 %2d월 %2d일 고객님의 생일입니다.\n",goname,birth_month,birth_day);
		}
		
		
		// 4. 닫기 (열린 역순)
		rs.close();
		stmt.close();
		conn.close();
		
	}

}
