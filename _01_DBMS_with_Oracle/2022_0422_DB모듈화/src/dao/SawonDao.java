package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import service.DBService;
import vo.SawonVo;

public class SawonDao {

	//single-ton : ��ü 1���� �����ؼ� ���
	static SawonDao single = null;

	public static SawonDao getInstance() {

		//�ν��Ͻ� ������ ���� ����
		if (single == null) {
			single = new SawonDao();
		}

		return single;

	}//getInstance()

	//�ܺο��� �ν��Ͻ� �����Ұ�
	private SawonDao() {

	}

	public List<SawonVo> selectList(){
		
		Connection conn = null;
		String sql = "SELECT * FROM sawon";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<SawonVo> list = new ArrayList<SawonVo>();
		
		try {
			
			conn = DBService.getInstance().getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				
				SawonVo vo = new SawonVo();
				
				vo.setDeptno(rs.getInt("deptno"));
				vo.setSabun(rs.getInt("sabun"));
				vo.setSahire(rs.getString("sahire")); //��¥���� ���ڷ� ������ �� �ֳ�?
				vo.setSajob(rs.getString("sajob"));
				vo.setSamgr(rs.getInt("samgr"));
				vo.setSaname(rs.getString("saname"));
				vo.setSapay(rs.getInt("sapay"));
				vo.setSasex(rs.getString("sasex"));
				
				list.add(vo);
				
			}
			
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
		} finally {
			
			try {
				
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
				
			} catch (Exception e2) {
				
				System.out.println("���� ����");
				
			}
			
		}
		
		return list;
		
	}
	
}
