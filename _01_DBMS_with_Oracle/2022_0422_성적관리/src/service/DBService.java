package service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBService {
	
	//OracleDriver loading
	//ojdbc14.jar은 필수적으로 작성해야하나,
	//ojdbc6.jar은 드라이버 로딩이 자동으로 올라간다.
	static {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버를 찾을 수 없습니다.");
		}
	}
	
	//single-ton : 객체 1개만 생성해서 사용
	static DBService single = null;

	public static DBService getInstance() {

		//인스턴스 없으면 새로 생성
		if (single == null) {
			single = new DBService();
		}

		return single;

	}//getInstance()

	//외부에서 인스턴스 생성불가
	private DBService() {

	}
	
	                                  //연결 오류를 메소드가 던진다.
	public Connection getConnection() throws SQLException{
		
		Connection conn = null;
		
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "test1";
		String pwd = "test1";
		
		conn = DriverManager.getConnection(url, user, pwd);
		
		return conn;
		
	}

}
