package mymain;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
//import oracle.jdbc.driver.OracleDriver;

public class MyMain_DBTest2 {
	
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
		
		Statement stmt = conn.createStatement();
		
		// 3. ��ȸ > ResultSet ��ü ������ : ����� ó�� ��ü 
		String sql = "SELECT deptno �μ���ȣ FROM dept";
		ResultSet rs = stmt.executeQuery(sql);

		while(rs.next()) { 
			//Į���� ��ġ ���� �̿��Ͽ� Į�� ��ҵ��� ���´�.
			//                         ����� < ��ȸ �� �ο��Ǵ� �ӽ� �ʵ��
			int deptno   = rs.getInt("deptno"); // ����! ������ ������� �ٲپ��� ������ deptno�� �ν����� ���Ѵ�.
			String dname = rs.getString(2);// � �����͸� �������� �� �� ����
			String loc   = rs.getString(3); 
			
			System.out.printf("[%d-%s-%s]\n",deptno,dname,loc);
		}
		
		
		// 4. �ݱ� (���� ����)
		rs.close();
		stmt.close();
		conn.close();
		
	}

}
