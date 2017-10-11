package enitities;

public class LigneDeCommande {

	private int idlcd;
	private int qtyProduit;
	private int idProduit;

	public LigneDeCommande() {
		super();
	}
	
	

	public LigneDeCommande(int idlcd, int idProduit, int qtyProduit) {
		super();
		this.idlcd = idlcd;
		this.qtyProduit = qtyProduit;
		this.idProduit = idProduit;
	}



	public int getIdlcd() {
		return idlcd;
	}

	public void setIdlcd(int idlcd) {
		this.idlcd = idlcd;
	}

	public int getQtyProduit() {
		return qtyProduit;
	}

	public void setQtyProduit(int qtyProduit) {
		this.qtyProduit = qtyProduit;
	}

	public int getIdProduit() {
		return idProduit;
	}

	public void setIdProduit(int idProduit) {
		this.idProduit = idProduit;
	}

}
