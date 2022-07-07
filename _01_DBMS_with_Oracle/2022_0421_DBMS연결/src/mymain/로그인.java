package mymain;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class �α��� {
	static {
		//1.DB Driver Loading
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
    public static void main(String[] args) throws Exception{
		//���� ����
    	String url = "jdbc:oracle:thin:@localhost:1521:xe";
    	String user = "test1";
    	String pwd = "test1";
    	
    	//2.����
    	Connection conn = DriverManager.getConnection(url, user, pwd);
    	
    	//3.��� ���� ��ü >>> ��ȸ
    	Statement stmt = conn.createStatement();
    	
    	String id = "one";
    	String psswd = "1234";
    	
    	//30�� �μ��� ��ȸ
    	String sql = String.format("SELECT * FROM test_member WHERE id = %s and pwd = %s",id,psswd);
    	
    	//��ȸ �� ���̺� �����͸� ���� ResultSet
    	ResultSet rs = stmt.executeQuery(sql);
    	
    	//���̺� Ŀ���� �ϳ��� ������
    	while (rs.next()) {
    		String saname = rs.getString("saname");
    		String sahire = rs.getString("sahire");
    		
    		//System.out.printf("%s�� �Խñ� ��� : %s\n",saname, sahire);
    		if(sahire == null) continue;
    		System.out.printf("%s�� �Խñ� ��� : %s\n",saname, sahire.substring(0,16));
    	}
    	
    	//4. �ݱ�
    	rs.close();
    	stmt.close();
    	conn.close();
	}
}
