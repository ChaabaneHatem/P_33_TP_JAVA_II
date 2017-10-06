package enitities;

public class Produit {
	private int id;
	private String nom;
	private double prix;
	private String desc;
	private String imgUrl;
	
	public Produit() {
		// TODO Auto-generated constructor stub
	}
	
	public Produit(int id,String nom,double prix,String desc,String imgUrl){
		super();
		this.id=id;
		this.nom=nom;
		this.prix=prix;
		this.desc=desc;
		this.imgUrl=imgUrl;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNom() {
		return nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	public double getPrix() {
		return prix;
	}

	public void setPrix(double prix) {
		this.prix = prix;
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}

	public String getImgUrl() {
		return imgUrl;
	}

	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}
	
}
