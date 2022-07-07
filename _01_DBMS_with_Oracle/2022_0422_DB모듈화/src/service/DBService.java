package service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBService {
	
	//OracleDriver loading
	//ojdbc14.jar�� �ʼ������� �ۼ��ؾ��ϳ�,
	//ojdbc6.jar�� ����̹� �ε��� �ڵ����� �ö󰣴�.
	static {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			System.out.println("����̹��� ã�� �� �����ϴ�.");
		}
	}
	
	//single-ton : ��ü 1���� �����ؼ� ���
	static DBService single = null;

	public static DBService getInstance() {

		//�ν��Ͻ� ������ ���� ����
		if (single == null) {
			single = new DBService();
		}

		return single;

	}//getInstance()

	//�ܺο��� �ν��Ͻ� �����Ұ�
	private DBService() {

	}
	
	                                  //���� ������ �޼ҵ尡 ������.
	public Connection getConnection() throws SQLException{
		
		Connection conn = null;
		
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "test1";
		String pwd = "test1";
		
		conn = DriverManager.getConnection(url, user, pwd);
		
		return conn;
		
	}

}
