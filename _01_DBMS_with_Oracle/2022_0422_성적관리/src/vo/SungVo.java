package vo;

public class SungVo {
	
	private int idx;
	
	private String name;
	
	private int kor;
	private int eng;
	private int mat;
	
	private String tot;
	private String avg;
	private String rank;
	
	public SungVo() {
		
	}
	
	public SungVo(String name, int kor, int eng, int mat) {
		this.name = name;
		this.kor = kor;
		this.eng = eng;
		this.mat = mat;
	}

	public SungVo(int idx, String name, int kor, int eng, int mat) {
		this(name, kor, eng, mat);
		this.idx = idx;
	}

	public int getIdx() {
		return idx;
	}
	
	public void setIdx(int idx) {
		this.idx = idx;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public int getKor() {
		return kor;
	}
	
	public void setKor(int kor) {
		this.kor = kor;
	}
	
	public int getEng() {
		return eng;
	}
	
	public void setEng(int eng) {
		this.eng = eng;
	}
	
	public int getMat() {
		return mat;
	}
	
	public void setMat(int mat) {
		this.mat = mat;
	}
	
	public String getTot() {
		return tot;
	}
	
	public void setTot(String tot) {
		this.tot = tot;
	}
	
	public String getAvg() {
		return avg;
	}
	
	public void setAvg(String avg) {
		this.avg = avg;
	}
	
	public String getRank() {
		return rank;
	}
	
	public void setRank(String rank) {
		this.rank = rank;
	}
	
	
	
}
