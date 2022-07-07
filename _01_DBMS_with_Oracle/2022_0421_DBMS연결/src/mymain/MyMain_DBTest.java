package mymain;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
//import oracle.jdbc.driver.OracleDriver;

public class MyMain_DBTest {
	
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
		
		// 2. Statement 객체 얻어오기 : SQL 명령 처리 객체(DDL,DCL,DML)
		// 연결된 계정에서의 명령을 수행할 객체 생성
		Statement stmt = conn.createStatement();
	    // select (조회) => executeQuery(sql)
		// select 외의 명령 => executeUpdate(sql)
		
		//String sql = "create table ttt(no int)";
		    //CMD에서 계정 접속하고, select tname from tab; 해서 확인
		//String sql = "drop table ttt";
		//String sql = "INSERT INTO ttt VALUES(10)";
		//String sql = "update ttt set no=2 where no=1";
		//String sql = "DELETE FROM ttt";
		
		//stmt.executeUpdate(sql);
		
		// 3. 조회 > ResultSet 객체 얻어오기 : 결과행 처리 객체 
		String sql = "SELECT * FROM dept";
		//결과행 관리객체를 통해서 조회 결과로 받은 행을 받음
		ResultSet rs = stmt.executeQuery(sql);
		
		//rs -----Cursor(가리킨다) ----> 데이터가 있는 영역 
		//                            *BOF(begin of file) - 빈공간 ~ EOF(end of file) - 빈공간
		//                             처음에는 커서가 BOF를 가리킴 -----> 다음행으로 이동(.next())
		//********.next()  : iterator의 .next()처럼 커서를 이동시켜준다. 
		//******** 반환      : 테이블에 데이터가 있을 때 true, 아니면 false
		//****>>>>>>>>>>>>>> while문을 사용해서 next()를 사용 <단방향 forward커서>
		/// while(rs.next()){ /* 현재 위치의 필드값 구하기 */ }

		while(rs.next()) { //rs의 cursor의 위치가 data영역이면 처리하고 아니면 끝내기
			//rs의 위치 : 특정 레코드를 가리킨다. => 그 위치의 칼럼값을 얻어온다.
			//                       "헤 딩 명"
			int deptno   = rs.getInt("deptno"); //<= .getInt("칼럼헤딩명");
			String dname = rs.getString("dname");
			String loc   = rs.getString("loc"); // <<만약에 데이터타입이 숫자여도 문자열로 받을 순 있다(정석 방식은 아님)
			
			System.out.printf("[%d-%s-%s]\n",deptno,dname,loc);
		}
		
		
		// 4. 닫기 (열린 역순)
		rs.close();
		stmt.close();
		conn.close();
		
	}

}
