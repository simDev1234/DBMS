package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import service.DBService;
import vo.DeptVo;

public class DeptDao {

	//single-ton : ��ü 1���� �����ؼ� ���
	static DeptDao single = null;

	public static DeptDao getInstance() {

		//�ν��Ͻ� ������ ���� ����
		if (single == null) {
			single = new DeptDao();
		}

		return single;

	}//getInstance()

	//�ܺο��� �ν��Ͻ� �����Ұ�
	private DeptDao() {

	}
	
	//��ü��ȸ
	public List<DeptVo> selectList(){
		
		List<DeptVo> list = new ArrayList<DeptVo>();
		
		Connection        conn  = null; //null�� �Ϻη� �ʱⰪ���� ����
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		String            sql   = "SELECT * FROM dept";
		
		try {
			
			//1. Connection ������
			conn = DBService.getInstance().getConnection();
			
			//2. PreparedStatment ������
			pstmt = conn.prepareStatement(sql);
			
			//3. ResultSet ������
			rs = pstmt.executeQuery();
			
			//4. ���� (record -> Vo -> list)
			while (rs.next()) {
				
				//rs�� ����Ű�� ���ڵ�(��)�� ���� �о����
				int     deptno  = rs.getInt("deptno");
				String  dname   = rs.getString("dname");
				String  loc     = rs.getString("loc");
				
				//Vo�� ����
				DeptVo vo = new DeptVo();
				vo.setDeptno(deptno);
				vo.setDname(dname);
				vo.setLoc(loc);
				
				//list�� �߰�
				list.add(vo);
				
			}
			
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
		} finally{
			
			
			try {
				//����(����)�Ǿ� ���� ��, close  --why? ���� ��� ���� ���� ����
				if (rs != null) rs.close();
				
				if (pstmt != null) pstmt.close();
				
				if (conn != null) conn.close();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
				
			
		}
		
		return list;
		
	}

}
