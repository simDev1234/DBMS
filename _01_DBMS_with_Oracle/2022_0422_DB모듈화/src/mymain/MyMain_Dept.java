package mymain;

import java.util.List;

import dao.DeptDao;
import vo.DeptVo;

public class MyMain_Dept {

	public static void main(String[] args) {
		
		//�μ���� ��������
		List<DeptVo> list = DeptDao.getInstance().selectList();
		
		System.out.println("----DeptDao�� �������� �μ� ���----");
		
		//���� ����
		for (DeptVo vo : list) {
			
			System.out.printf("[%d-%s-%s]\n",vo.getDeptno(), vo.getDname(), vo.getLoc());
			
		}
		
	}//end main

}
