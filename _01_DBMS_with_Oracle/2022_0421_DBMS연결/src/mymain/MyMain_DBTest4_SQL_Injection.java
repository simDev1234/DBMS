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
		//String sql = "select * from test_member where id = 'one' and pwd = '0000'"; //��� Ʋ���� �� ����
		String sql = "select * from test_member where id = 'one' and pwd = '0000'" + "or 1 = 1"; //��Ŀ�� ������ �ڵ�
		
		ResultSet rs = stmt.executeQuery(sql);

		while(rs.next()) { 	
			
			int idx = rs.getInt("idx");
			String id = rs.getString("id");
			String password = rs.getString("pwd");
			String name = rs.getString("name");
			
			System.out.printf("[%d]-[%s]-[%s]-[%s]\n",idx,id,password,name);
			
		}
		
		
		// 4. �ݱ� (���� ����)
		rs.close();
		stmt.close();
		conn.close();
		
	}

}
