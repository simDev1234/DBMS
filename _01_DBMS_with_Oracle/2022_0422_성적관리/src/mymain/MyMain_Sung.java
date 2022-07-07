package mymain;

import java.awt.BorderLayout;
import java.awt.Dimension;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.util.List;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.JTextField;
import javax.swing.table.AbstractTableModel;

import dao.SungDao;
import vo.SungVo;

public class MyMain_Sung extends JFrame {

	//��,����ʵ�
	JTextField  jtf_no,jtf_name,jtf_kor,jtf_eng,jtf_mat,jtf_tot,jtf_avg,jtf_rank;
	
	//�۾���ư
	JButton jbt_new,jbt_update,jbt_delete,jbt_prev,jbt_next;
	
	//��ȸ
	JTable  jtb_display;
	
	//�����͸� ������ ����Ʈ ���
	List<SungVo> sung_list = null;
	
	boolean bAdd=false;//�߰� or �����۾�����
	
	int current_pos = -1;//���� ��µǴ� ������ �ε���
	
	public MyMain_Sung() {
		// TODO Auto-generated constructor stub
		super("��������");//Ÿ��Ʋ

		
		//������ʵ� �� �۾���ư �ʱ�ȭ
		init_inputs();
		//��ȸâ �ʱ�ȭ
		init_display();
		
		//DB�κ��� ��� �����ͼ� JTable�� ��ġ
		display_sung_list();
		
		//ù��° ���ڵ��� ���� �ؽ�Ʈ�ʵ忡 �־��ֱ�
		if (sung_list.size() > 0) {
			current_pos = 0; //ù��° ������ ����
			
			//���� ��ġ�� �� �Է�â�� ���
			display_input_sung();
		}
		
		//��ư Ȱ�� ����
		enable_buttons();
		
		//��ġ �� ũ������
		//setBounds(200, 100, 400, 300);
		setLocation(300, 100);
		
		setResizable(false);
		
		
		pack();

		//�������
		setVisible(true);

		//����		
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
	}

	private void enable_buttons() {
		//ó���� �ƴϸ� Ȱ��ȭ + ���� ��Ϲ�ư ���õ��� �ʾ�����
		jbt_prev.setEnabled(current_pos > 0 && bAdd == false);
		
		//������÷�ں��� ������ Ȱ��ȭ + ���� ��� ��ư ���õ��� �ʾ�����
		jbt_next.setEnabled(current_pos < sung_list.size()-1 && bAdd == false);
		
		//������ư Ȱ�� ����
		jbt_delete.setEnabled((bAdd == false) && sung_list.size() > 0);
		
		//������ư Ȱ�� ����
		jbt_update.setEnabled(bAdd == true || sung_list.size() > 0);
	}

	private void display_input_sung() {
		//����ؾ��� sungVo ������ ������
		SungVo vo = sung_list.get(current_pos);
		
		jtf_name.setText(vo.getName());
		jtf_no.setText(vo.getIdx()+"");
		jtf_kor.setText(vo.getKor()+"");
		jtf_eng.setText(String.valueOf(vo.getEng()));
		jtf_mat.setText(String.valueOf(vo.getMat()));
		jtf_tot.setText(vo.getTot());
		jtf_avg.setText(vo.getAvg());
		jtf_rank.setText(vo.getRank());
		
		//JTable���� �� ���� ���
		jtb_display.setRowSelectionInterval(current_pos, current_pos);
		
		//��ư Ȱ�� ���� ����
		enable_buttons();
	}

	private void display_sung_list() {
		//1. DB��� ��������
		sung_list = SungDao.getInstance().selectList();
		
		//2. JTable�� ��ġ (JTable ��ġ �� �ʿ�)
		jtb_display.setModel(new SungTableModel());
	}

	private void init_inputs() {
		// TODO Auto-generated method stub
		JPanel p = new JPanel(new BorderLayout());
		//�Է�â
		JPanel p1 = new JPanel(new GridLayout(4, 2));
		
		p1.add(new JLabel("�̸�:"));
		p1.add(jtf_name=new JTextField());
		
		p1.add(new JLabel("��ȣ:"));
		p1.add(jtf_no=new JTextField());
		
		p1.add(new JLabel("����:"));
		p1.add(jtf_kor=new JTextField());
		
		p1.add(new JLabel("����:"));
		p1.add(jtf_tot=new JTextField());
		
		p1.add(new JLabel("����:"));
		p1.add(jtf_eng=new JTextField());
		
		p1.add(new JLabel("���:"));
		p1.add(jtf_avg=new JTextField());
		
		p1.add(new JLabel("����:"));
		p1.add(jtf_mat=new JTextField());
		
		p1.add(new JLabel("���:"));
		p1.add(jtf_rank=new JTextField());
		
		
		//��ȣ/����/���/��� �б�����
		jtf_no.setEditable(false);
		jtf_tot.setEditable(false);
		jtf_avg.setEditable(false);
		jtf_rank.setEditable(false);
		
		
		//���â
		JPanel p2 = new JPanel(new GridLayout(1, 5));
		p2.add(jbt_prev 	= new JButton("����"));
		p2.add(jbt_new 		= new JButton("�߰�"));
		p2.add(jbt_update 	= new JButton("����"));
		p2.add(jbt_delete 	= new JButton("����"));
		p2.add(jbt_next 	= new JButton("����"));
		
		
		p.add(p1,"Center");
		p.add(p2,"South");
		
		this.add(p,"Center");
		
		//��ư�̺�Ʈ �ʱ�ȭ
		init_button_event();
		
	}
	
	private void init_button_event() {
		// TODO Auto-generated method stub
		ActionListener listener = new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				// TODO Auto-generated method stub
				//�̺�Ʈ�� �߻���Ų ��ư
				Object evt_src = e.getSource();
				
				if(evt_src ==  jbt_new) on_new();
				else if(evt_src ==  jbt_update) on_update();
				else if(evt_src ==  jbt_delete) on_delete();
				else if(evt_src ==  jbt_prev) on_prev();
				else if(evt_src ==  jbt_next) on_next();
				
			}
		};
		
		jbt_new.addActionListener(listener);
		jbt_update.addActionListener(listener);
		jbt_delete.addActionListener(listener);
		jbt_prev.addActionListener(listener);
		jbt_next.addActionListener(listener);
		
		
	}




	protected void on_next() {
		current_pos++;
		
//		if (current_pos >= sung_list.size()) {
//			current_pos--;
//			JOptionPane.showMessageDialog(this, "�������Դϴ�.");
//			return;
//		}
		
		display_input_sung();
	}




	protected void on_prev() {
		current_pos--;
		
//		if (current_pos < 0) {
//			current_pos = 0;
//			JOptionPane.showMessageDialog(this, "ó���Դϴ�.");
//			return;
//		}
		
		display_input_sung();
	}




	protected void on_delete() {
		//���� �����Ͻðڽ��ϱ�? (Ȯ�� - YES_OPTION, ��� - )
		int result = JOptionPane.showConfirmDialog(this, "���� �����Ͻðڽ��ϱ�?", "[����]", JOptionPane.YES_NO_OPTION);
		
		//[��]�� �ƴϸ� ������
		if (result != JOptionPane.YES_OPTION) {
			return;
		}
		
		//�ε���
		int idx = Integer.parseInt(jtf_no.getText());
		
		//1. DB ����
		int res = SungDao.getInstance().delete(idx);
		
		//2. ��ü ������ ��������
		display_sung_list();
		
		//2-1. �����Ͱ� �ϳ��� ���� ���, �ؽ�Ʈ�ʵ� ����
		if (sung_list.size() == 0) {
			clear_input();
			enable_buttons();
			return;
		}
		
		//2-2. ���� ������ �����Ͱ� ������ �������� ���, current_pos 
		       // <<- ��� �ÿ� current_pos�� ������ ������ �����߱� ����
		if (current_pos == sung_list.size()-1) {
			current_pos--; //��ĭ ����
		}
		
		//�ؽ�Ʈ�ʵ� ����
		display_input_sung();

	}




	protected void on_update() {
		
		//�̸�, ����, ����, ���� �Է»��� üũ
		String name = jtf_name.getText().trim();
		
		//�̸�
		if (name.isEmpty()) {
			JOptionPane.showMessageDialog(this, "�̸��� �Է��ϼ���.");
			jtf_name.setText(""); 
			jtf_name.requestFocus(); //������â ��Ÿ���� ��Ŀ�� Ǯ���� �ٽ� �߰�
			return;
		}
		
		//����~���� �Է°��� �������� Ȯ�� �ʿ�
		int kor = 0, eng = 0, mat = 0;
		
		//����
		String str_kor = jtf_kor.getText().trim();
		
		try {
			kor = Integer.parseInt(str_kor); //���ھƴ� ���̸� ���� ex. "aa"
			
			//���� üũ -- �ȵǴ� ����
			if (kor < 0 || kor > 100) {
				throw new Exception();
			}
				
		} catch (Exception e) {
			JOptionPane.showMessageDialog(this, "���������� 0~100 ������ ������ �Է��ϼ���.");
			jtf_kor.setText("");
			jtf_name.requestFocus(); //������â ��Ÿ���� ��Ŀ�� Ǯ���� �ٽ� �߰�
			return;
		}
		
		//����
		String str_eng = jtf_eng.getText().trim();
		
		try {
			eng = Integer.parseInt(str_eng); //���ھƴ� ���̸� ���� ex. "aa"
			
			//���� üũ -- �ȵǴ� ����
			if (eng < 0 || eng > 100) {
				throw new Exception();
			}
				
		} catch (Exception e) {
			JOptionPane.showMessageDialog(this, "���������� 0~100 ������ ������ �Է��ϼ���.");
			jtf_eng.setText("");
			jtf_name.requestFocus(); //������â ��Ÿ���� ��Ŀ�� Ǯ���� �ٽ� �߰�
			return;
		}
		
		//����
		String str_mat = jtf_mat.getText().trim();
		
		try {
			mat = Integer.parseInt(str_mat); //���ھƴ� ���̸� ���� ex. "aa"
			
			//���� üũ -- �ȵǴ� ����
			if (mat < 0 || mat > 100) {
				throw new Exception();
			}
				
		} catch (Exception e) {
			JOptionPane.showMessageDialog(this, "���������� 0~100 ������ ������ �Է��ϼ���.");
			jtf_mat.setText("");
			jtf_name.requestFocus(); //������â ��Ÿ���� ��Ŀ�� Ǯ���� �ٽ� �߰�
			return;
		}

		
		if (bAdd) { //���
			//�߰��� �����͸� ����
			SungVo vo = new SungVo();
			vo.setName(name);
			vo.setKor(kor);
			vo.setEng(eng);
			vo.setMat(mat);
			
			//insert
			int res = SungDao.getInstance().insert(vo);
			
			//��ü ������ ����
			display_sung_list();
			
			//���� �Էµ� �����Ͱ� �������� �ִ�.
			current_pos = sung_list.size() - 1;
			
			//�Է�â�� ���� �Է������� ���
			display_input_sung();
			
			//�Է»��� �ʱ�ȭ
			bAdd = false;
			jbt_new.setText("�߰�");
			jbt_update.setText("����");
			
		}else { //����
			//���� �����Ͻðڽ��ϱ�? (Ȯ�� - YES_OPTION, ��� - )
			int result = JOptionPane.showConfirmDialog(this, "���� �����Ͻðڽ��ϱ�?", "[����]", JOptionPane.YES_NO_OPTION);
			
			//[��]�� �ƴϸ� ������
			if (result != JOptionPane.YES_OPTION) {
				//���� �� ��������
				display_input_sung();
				
				return;
			}
			
			//�����ϱ�
			int idx = Integer.parseInt(jtf_no.getText());
			
			//1. ���� �����͸� ����(SungVo) - name, kor, eng, mat, idx
			SungVo vo = new SungVo();
			vo.setName(name);
			vo.setKor(kor);
			vo.setEng(eng);
			vo.setMat(mat);
			vo.setIdx(idx);
			
			//2. DB�� ������Ʈ
			int res = SungDao.getInstance().update(vo);
			
			//3. ��ü������ ��������
			display_sung_list();
			
			//4. �ؽ�Ʈ�ʵ忡 ���� ���� ������ ����
			display_input_sung();
			
		}
	}//end on_update()




	protected void on_new() {
		bAdd = !bAdd;
		
		if (bAdd == true) {
			//�ű� ��� �غ�
			clear_input();
		}else {
			//���
			if (sung_list.size() > 0) {
				display_input_sung(); //������� ��������
			}
		}
		
		//��ư ĸ�� ����
		jbt_new.setText(bAdd? "���" : "�߰�");
		jbt_update.setText(bAdd? "���" : "����");
		
		//��ư Ȱ�� ���� üũ
		enable_buttons();
		
	}//end on_new()




	private void clear_input() {
		//��� �Է� ��Ʈ�� �����
		jtf_no.setText("");
		jtf_name.setText("");
		jtf_kor.setText("");
		jtf_eng.setText("");
		jtf_mat.setText("");
		jtf_tot.setText("");
		jtf_avg.setText("");
		jtf_rank.setText("");
		
		//�̸��� ��Ŀ��
		jtf_name.requestFocus();
	}

	private void init_display() {
		// TODO Auto-generated method stub
		jtb_display = new JTable();
		JScrollPane  jsp = new JScrollPane(jtb_display);
		
		jsp.setPreferredSize(new Dimension(400, 200));
		
		this.add(jsp,"South");
		
		//���콺 �̺�Ʈ (JTable���� ���콺�� Ŭ���Ǹ�)
		jtb_display.addMouseListener(new MouseAdapter() {
			@Override
			public void mousePressed(MouseEvent e) {
				//���õ� �࿡ ���� ���� ���ϱ�
				current_pos = jtb_display.getSelectedRow();
				
				display_input_sung();
			}
		});
	}

	//����Ŭ���� : ���̺� ��ġ ��
	class SungTableModel extends AbstractTableModel
	{
		
		//Ÿ��Ʋ �迭
		String[] title = new String[] {"��ȣ","�̸�","����","����","����","����","���","���"};

		@Override
		public int getRowCount() {
			// TODO Auto-generated method stub
			return sung_list.size();
		}

		@Override
		public int getColumnCount() {
			// TODO Auto-generated method stub
			return title.length;
		}

		@Override
		public Object getValueAt(int rowIndex, int columnIndex) {
			SungVo vo = sung_list.get(rowIndex);
			
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
		}//end getValueAt()

		@Override
		public String getColumnName(int column) {
			return title[column];
		}
		
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		new MyMain_Sung();
	}//end main()

}