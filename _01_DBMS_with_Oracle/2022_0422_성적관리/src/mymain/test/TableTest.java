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
   
   //����Ŭ���� : JTable�� ��ġ ���� ����
   class MyTableModel extends AbstractTableModel
   {
	    
	    //Ÿ��Ʋ �迭
	    String[] title = new String[] {"��ȣ","�̸�","����","����","����","����","���","���"};
	    
	    //Ÿ��Ʋ�� ���� 
	    @Override
		public String getColumnName(int column) {
			return title[column];
		}

		//���� ���� ����
		@Override
		public int getColumnCount() {  //Į���� ���� ��������
			return title.length;
		}
		
		//���� ���� ����
		@Override
		public int getRowCount() {  //���� ���� ��������
			return list.size();
		}
	
		//JTable�� cell(��ĭ)�� ������ ä���
		@Override
		public Object getValueAt(int rowIndex, int columnIndex) { //Ư�� ��, ������ �� ��������
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
      super("JTable ����");
      
      //DB���� ������ ��������
      list = SungDao.getInstance().selectList();
      
      //�߾ӿ� ��ġ
      jtb_display = new JTable();
      JScrollPane jsp = new JScrollPane(jtb_display);
      this.add(jsp);
      
      //��ġ ���� ����
      jtb_display.setModel(new MyTableModel());

      //��ġ       x    y 
      this.setLocation(200, 100);

      //ũ��
      this.setSize(400, 400);

      //�����ֱ�
      this.setVisible(true);

      //����
      this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

   }

   public static void main(String[] args) {
      // TODO Auto-generated method stub
      new TableTest();
   }

}
