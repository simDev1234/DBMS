package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import service.DBService;
import vo.SungVo;

public class SungDao {

	static SungDao single = null;
	
	public static SungDao getInstance() {
		
		if (single == null) {
			
			single = new SungDao();
			
		}

		return single;
		
	}
	
	//전체조회
	public List<SungVo> selectList() {

		List<SungVo> list = new ArrayList<SungVo>();

		Connection conn = null; //null을 일부로 초기값으로 설정
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM sungtb_view";

		try {

			//1. Connection 얻어오기
			conn = DBService.getInstance().getConnection();

			//2. PreparedStatment 얻어오기
			pstmt = conn.prepareStatement(sql);

			//3. ResultSet 얻어오기
			rs = pstmt.executeQuery();

			//4. 포장 (record -> Vo -> list)
			while (rs.next()) {

				//Vo로 포장
				SungVo vo = new SungVo();
				
				vo.setIdx(rs.getInt("idx"));
				vo.setName(rs.getString("name"));
				vo.setKor(rs.getInt("kor"));
				vo.setEng(rs.getInt("eng"));
				vo.setMat(rs.getInt("mat"));
				
				//DB 컬럼타입과 무관하게 String형으로 읽어올 수 있다.
				vo.setTot(rs.getString("tot"));
				vo.setAvg(rs.getString("avg"));
				vo.setRank(rs.getString("rank"));

				//list에 추가
				list.add(vo);

			}

		} catch (Exception e) {

			e.printStackTrace();

		} finally {

			try {
				//연결(생성)되어 있을 시, close  --why? 다음 명령 위해 연결 해제
				if (rs != null)
					rs.close();

				if (pstmt != null)
					pstmt.close();

				if (conn != null)
					conn.close();

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}

		return list;

	}

	public int insert(SungVo vo) {
		int res = 0; 
		
		Connection        conn  = null;
		PreparedStatement pstmt = null;                                   //         1  2  3  4  -- parameter index
		String            sql   = "INSERT INTO sungtb VALUES(seq_sungtb_idx.nextVal, ?, ?, ?, ?)";
		
		try {
			//1. Connection 얻어오기
			conn = DBService.getInstance().getConnection();
			
			//2. PreparedStatment 얻어오기
			pstmt = conn.prepareStatement(sql);
			
			//3. parameter 세팅 [[ 데이터 타입에 맞추어 세팅해야함 ]]
			pstmt.setString(1, vo.getName());
			pstmt.setInt(2, vo.getKor());
			pstmt.setInt(3, vo.getEng());
			pstmt.setInt(4, vo.getMat());
			
			//3. insert : res <- 처리된 행수를 반환
			res = pstmt.executeUpdate();

		} catch (Exception e) {
			
			e.printStackTrace();
			
		} finally {
			
			//닫기 (열린 역순으로)
			try {
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			} catch (SQLException e2) {
				e2.printStackTrace();
			}
			
		}
		
		return res;
		
	}//end insert()
	
	public int delete(int idx) {
		int res = 0; 
		
		Connection        conn  = null;
		PreparedStatement pstmt = null;                                  
		String            sql   = "DELETE FROM sungtb WHERE idx = ?";
		
		try {
			//1. Connection 얻어오기
			conn = DBService.getInstance().getConnection();
			
			//2. PreparedStatment 얻어오기
			pstmt = conn.prepareStatement(sql);
			
			//3. parameter 세팅 [[ 데이터 타입에 맞추어 세팅해야함 ]]
			pstmt.setInt(1, idx);
			
			//3. DML(insert/update/delete) : res <- 처리된 행수를 반환
			res = pstmt.executeUpdate();
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
		} finally {
			
			//닫기 (열린 역순으로)
			try {
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			} catch (SQLException e2) {
				e2.printStackTrace();
			}
			
		}
		
		return res;
		
	}//end delete()
	
	public int update(SungVo vo) {
		int res = 0; 
		
		Connection        conn  = null;
		PreparedStatement pstmt = null;                                  
		String            sql   = "UPDATE sungtb SET name = ?, kor = ?, eng = ?, mat = ? WHERE idx = ?";
		
		try {
			//1. Connection 얻어오기
			conn = DBService.getInstance().getConnection();
			
			//2. PreparedStatment 얻어오기
			pstmt = conn.prepareStatement(sql);
			
			//3. parameter 세팅 [[ 데이터 타입에 맞추어 세팅해야함 ]]
			pstmt.setString(1, vo.getName());
			pstmt.setInt(2, vo.getKor());
			pstmt.setInt(3, vo.getEng());
			pstmt.setInt(4, vo.getMat());
			pstmt.setInt(5, vo.getIdx());
			
			//3. DML(insert/update/delete) : res <- 처리된 행수를 반환
			res = pstmt.executeUpdate();
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
		} finally {
			
			//닫기 (열린 역순으로)
			try {
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			} catch (SQLException e2) {
				e2.printStackTrace();
			}
			
		}
		
		return res;
		
	}//end insert()
	
}
