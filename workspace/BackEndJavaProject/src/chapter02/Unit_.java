package chapter02;

class Unit_ {

	private int mm;
	private int cm;
	private int m;
	private double in;
	private double ft;
	
	
	
	public Unit_(int mm, int cm, int m, double in, double ft) {
		this.mm = mm;
		this.cm = cm;
		this.m = m;
		this.in = in;
		this.ft = ft;
	}

	public int getMm() {
		return mm;
	}
	
	public void setMm(int mm) {
		this.mm = mm;
	}

	public int getCm() {
		return cm;
	}

	public void setCm(int cm) {
		this.cm = cm;
	}

	public int getM() {
		return m;
	}

	public void setM(int m) {
		this.m = m;
	}

	public double getIn() {
		return in;
	}

	public void setIn(double in) {
		this.in = in;
	}

	public double getFt() {
		return ft;
	}

	public void setFt(double ft) {
		this.ft = ft;
	}
}
