package mymain;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;


public class MyMain_DBTest4_SQL_Injection {
	
	static {
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
		
		//String sql = "select * from test_member where id = 'one' and pwd = '1234'";
		//String sql = "select * from test_member where id = 'one' and pwd = '0000'"; //비번 틀리면 안 나옴
		String sql = "select * from test_member where id = 'one' and pwd = '0000'" + "or 1 = 1"; //해커가 주입한 코드
		
		ResultSet rs = stmt.executeQuery(sql);

		while(rs.next()) { 	
			
			int idx = rs.getInt("idx");
			String id = rs.getString("id");
			String password = rs.getString("pwd");
			String name = rs.getString("name");
			
			System.out.printf("[%d]-[%s]-[%s]-[%s]\n",idx,id,password,name);
			
		}
		
		
		// 4. 닫기 (열린 역순)
		rs.close();
		stmt.close();
		conn.close();
		
	}

}
