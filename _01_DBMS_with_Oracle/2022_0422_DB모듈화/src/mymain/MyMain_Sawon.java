package mymain;

import java.util.List;

import dao.SawonDao;
import vo.SawonVo;

public class MyMain_Sawon {

	public static void main(String[] args) {
		
		List<SawonVo> list = SawonDao.getInstance().selectList();
		
		for (SawonVo tmp : list) {
			
			String saname = tmp.getSaname();
			String sajob = tmp.getSajob();
			int deptno = tmp.getDeptno();
			
			
			System.out.printf("[%s %s]���� �μ��� [%d]�Դϴ�.\n",saname,sajob,deptno);
			
		}
		
	}

}
