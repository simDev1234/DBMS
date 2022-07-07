package mymain;

import java.util.List;

import dao.DeptDao;
import vo.DeptVo;

public class MyMain_Dept {

	public static void main(String[] args) {
		
		//부서목록 가져오기
		List<DeptVo> list = DeptDao.getInstance().selectList();
		
		System.out.println("----DeptDao가 가져다준 부서 목록----");
		
		//개선 루프
		for (DeptVo vo : list) {
			
			System.out.printf("[%d-%s-%s]\n",vo.getDeptno(), vo.getDname(), vo.getLoc());
			
		}
		
	}//end main

}
