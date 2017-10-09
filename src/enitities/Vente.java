package enitities;

import java.util.Date;

public class Vente {

	private int id;
	private int quantiteTotal;
	private int quantiteRestante;
	//private Date date;
	private String science;
	
	public Vente() {
		// TODO Auto-generated constructor stub
	}
	
	
	
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getQuantiteTotal() {
		return quantiteTotal;
	}

	public void setQuantiteTotal(int quantiteTotal) {
		this.quantiteTotal = quantiteTotal;
	}

	public int getQuantiteRestante() {
		return quantiteRestante;
	}

	public void setQuantiteRestante(int quantiteRestante) {
		this.quantiteRestante = quantiteRestante;
	}

/*	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}
*/
	public String getScience() {
		return science;
	}

	public void setScience(String science) {
		this.science = science;
	}
	
}
