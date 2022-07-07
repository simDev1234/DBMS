package mymain;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
//import oracle.jdbc.driver.OracleDriver;

public class MyMain_DBTest3_���̺���ȸ {
	
	//DB Driver Loading
	//���� �޼ҵ尡 ���۵Ǳ� ���� ���� 0������ ���۾�.
	static {
		// 0. ��ü�� ���� �Ǳ� ������ Ŭ������ �޸𸮿� ���� 
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
//			String goname   = rs.getString("goname"); // ����! ������ ������� �ٲپ��� ������ deptno�� �ν����� ���Ѵ�.
//			String gojumin = rs.getString("gojumin");// � �����͸� �������� �� �� ����
//			String goaddr   = rs.getString("goaddr"); 
//			
			
//			System.out.printf("[%02d-%-3s-%s-%s]\n",gobun,goname,gojumin,goaddr);
			
			
			String goname = rs.getString("goname");
			int birth_month = rs.getInt("birth_month");
			int birth_day = rs.getInt("birth_day");		
			String gojumin = rs.getString("gojumin");
			
			
			System.out.printf("����ϴ� [%3s] ����, ������ %2d�� %2d�� ������ �����Դϴ�.\n",goname,birth_month,birth_day);
			System.out.println(gojumin.substring(0,6));
		}
		
		
		// 4. �ݱ� (���� ����)
		rs.close();
		stmt.close();
		conn.close();
		
	}

}
