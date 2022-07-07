package mymain.test;

import java.util.List;

import javax.swing.JFrame;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.table.AbstractTableModel;

import dao.SungDao;
import vo.SungVo;

public class TableTest extends JFrame {
	
   JTable jtb_display;
   
   List<SungVo> list = null;
   
   //내부클래스 : JTable에 배치 모델을 설계
   class MyTableModel extends AbstractTableModel
   {
	    
	    //타이틀 배열
	    String[] title = new String[] {"번호","이름","국어","영어","수학","총점","평균","등수"};
	    
	    //타이틀명 설정 
	    @Override
		public String getColumnName(int column) {
			return title[column];
		}

		//열의 갯수 결정
		@Override
		public int getColumnCount() {  //칼럼의 갯수 가져오기
			return title.length;
		}
		
		//행의 갯수 결정
		@Override
		public int getRowCount() {  //행의 갯수 가져오기
			return list.size();
		}
	
		//JTable의 cell(한칸)에 데이터 채우기
		@Override
		public Object getValueAt(int rowIndex, int columnIndex) { //특정 행, 열에서 값 가져오기
			SungVo vo = list.get(rowIndex);
			
			if (columnIndex == 0) {
				return vo.getIdx();
			}else if (columnIndex == 1) {
				return vo.getName();
			}else if (columnIndex == 2) {
				return vo.getKor();
			}else if (columnIndex == 3) {
				return vo.getEng();
			}else if (columnIndex == 4) {
				return vo.getMat();
			}else if (columnIndex == 5) {
				return vo.getTot();
			}else if (columnIndex == 6) {
				return vo.getAvg();
			}else {
				return vo.getRank();
			}
		}//end getValueAt();
	   
   }//end MyTableModel
   

   public TableTest() {
      // TODO Auto-generated constructor stub
      super("JTable 연습");
      
      //DB에서 데이터 가져오기
      list = SungDao.getInstance().selectList();
      
      //중앙에 배치
      jtb_display = new JTable();
      JScrollPane jsp = new JScrollPane(jtb_display);
      this.add(jsp);
      
      //배치 모델을 적용
      jtb_display.setModel(new MyTableModel());

      //위치       x    y 
      this.setLocation(200, 100);

      //크기
      this.setSize(400, 400);

      //보여주기
      this.setVisible(true);

      //종료
      this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

   }

   public static void main(String[] args) {
      // TODO Auto-generated method stub
      new TableTest();
   }

}
