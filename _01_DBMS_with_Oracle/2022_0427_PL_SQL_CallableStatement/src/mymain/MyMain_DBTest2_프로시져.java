package mymain;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;

public class MyMain_DBTest2_���ν��� {
	
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
		// 1. Connection�� ������
		//(1) ������, ��������� ��������
		//            jdbc:oracle:����̹�����:@IP�ּ�:��Ʈ:db���̵�   <<- JavaEE���� Data Source Explorer > Properties�� URL����
		String url = "jdbc:oracle:thin:@localhost:1521:xe"; 
		String user = "test1";
		String pwd  = "test1";
		
		//(2) Connection �ν��Ͻ��� �̱��� ������� �����´�.
		Connection conn = DriverManager.getConnection(url, user, pwd);
		System.out.println("---------Success Connection-------");
		
		//2. Procedure����� ��ü
		String sql = "call book_insert(?, ?)";
		CallableStatement cstmt = conn.prepareCall(sql);
		
		//3. Parameter
		cstmt.setString(1, "And");
		cstmt.setInt(2, 22000);
		
		//4. ����
		cstmt.executeUpdate();
		
		//5. �ݱ� (���� ����)
		cstmt.close();
		conn.close();
		
	}

}
