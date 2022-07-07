package mymain;

import java.util.List;

import dao.SungDao;
import vo.SungVo;

public class MyMain_TestSung {

	public static void main(String[] args) {
		
		List<SungVo> list = SungDao.getInstance().selectList();
		
		System.out.println("[ȫ�浿]-[KOR]-[ENG]-[MAT]");
		System.out.println("-----------------------------");
		
		for (SungVo tmp : list) {
			System.out.printf("[%s]-[%d]-[%d]-[%d]\n",tmp.getName(),tmp.getKor(),tmp.getEng(),tmp.getMat());
		}
		
	}

}
