package mymain;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
//import oracle.jdbc.driver.OracleDriver;

public class MyMain_DBTest {
	
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
		
		// 2. Statement ��ü ������ : SQL ��� ó�� ��ü(DDL,DCL,DML)
		// ����� ���������� ����� ������ ��ü ����
		Statement stmt = conn.createStatement();
	    // select (��ȸ) => executeQuery(sql)
		// select ���� ��� => executeUpdate(sql)
		
		//String sql = "create table ttt(no int)";
		    //CMD���� ���� �����ϰ�, select tname from tab; �ؼ� Ȯ��
		//String sql = "drop table ttt";
		//String sql = "INSERT INTO ttt VALUES(10)";
		//String sql = "update ttt set no=2 where no=1";
		//String sql = "DELETE FROM ttt";
		
		//stmt.executeUpdate(sql);
		
		// 3. ��ȸ > ResultSet ��ü ������ : ����� ó�� ��ü 
		String sql = "SELECT * FROM dept";
		//����� ������ü�� ���ؼ� ��ȸ ����� ���� ���� ����
		ResultSet rs = stmt.executeQuery(sql);
		
		//rs -----Cursor(����Ų��) ----> �����Ͱ� �ִ� ���� 
		//                            *BOF(begin of file) - ����� ~ EOF(end of file) - �����
		//                             ó������ Ŀ���� BOF�� ����Ŵ -----> ���������� �̵�(.next())
		//********.next()  : iterator�� .next()ó�� Ŀ���� �̵������ش�. 
		//******** ��ȯ      : ���̺� �����Ͱ� ���� �� true, �ƴϸ� false
		//****>>>>>>>>>>>>>> while���� ����ؼ� next()�� ��� <�ܹ��� forwardĿ��>
		/// while(rs.next()){ /* ���� ��ġ�� �ʵ尪 ���ϱ� */ }

		while(rs.next()) { //rs�� cursor�� ��ġ�� data�����̸� ó���ϰ� �ƴϸ� ������
			//rs�� ��ġ : Ư�� ���ڵ带 ����Ų��. => �� ��ġ�� Į������ ���´�.
			//                       "�� �� ��"
			int deptno   = rs.getInt("deptno"); //<= .getInt("Į�������");
			String dname = rs.getString("dname");
			String loc   = rs.getString("loc"); // <<���࿡ ������Ÿ���� ���ڿ��� ���ڿ��� ���� �� �ִ�(���� ����� �ƴ�)
			
			System.out.printf("[%d-%s-%s]\n",deptno,dname,loc);
		}
		
		
		// 4. �ݱ� (���� ����)
		rs.close();
		stmt.close();
		conn.close();
		
	}

}
