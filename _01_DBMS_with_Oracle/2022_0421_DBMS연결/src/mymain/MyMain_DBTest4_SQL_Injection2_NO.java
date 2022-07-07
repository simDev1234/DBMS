package mymain;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class MyMain_DBTest4_SQL_Injection2_NO {
	
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
		
		//PreparedStatement�� ?�� ���
		//��Ŀ�� "or 1 = 1"�� ���δٰ� �ص� ��ɾ ������� �ʴ´�.
		//                                             1         2        <- parameter index
		String sql = "select * from test_member where id =? and pwd =?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql); //�̸� sql���� �����صд�.
		
		//parameter ������ ����
		//            index  id
		pstmt.setString(1, "one");
		pstmt.setString(2, "1234");  
		
		ResultSet rs = pstmt.executeQuery();

		while(rs.next()) { 	
			
			int idx = rs.getInt("idx");
			String id = rs.getString("id");
			String password = rs.getString("pwd");
			String name = rs.getString("name");
			
			System.out.printf("[%d]-[%s]-[%s]-[%s]\n",idx,id,password,name);
			
		}
		
		
		// 4. �ݱ� (���� ����)
		rs.close();
		pstmt.close();
		conn.close();
		
	}

}
