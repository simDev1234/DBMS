package mymain;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
//import oracle.jdbc.driver.OracleDriver;

public class MyMain_DBTest2 {
	
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
		
		Statement stmt = conn.createStatement();
		
		// 3. 조회 > ResultSet 객체 얻어오기 : 결과행 처리 객체 
		String sql = "SELECT deptno 부서번호 FROM dept";
		ResultSet rs = stmt.executeQuery(sql);

		while(rs.next()) { 
			//칼럼의 위치 값을 이용하여 칼럼 요소들을 얻어온다.
			//                         헤딩명 < 조회 시 부여되는 임시 필드명
			int deptno   = rs.getInt("deptno"); // 에러! 위에서 헤딩명을 바꾸었기 때문에 deptno를 인식하지 못한다.
			String dname = rs.getString(2);// 어떤 데이터를 가져올지 알 수 없음
			String loc   = rs.getString(3); 
			
			System.out.printf("[%d-%s-%s]\n",deptno,dname,loc);
		}
		
		
		// 4. 닫기 (열린 역순)
		rs.close();
		stmt.close();
		conn.close();
		
	}

}
