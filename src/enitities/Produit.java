package enitities;

import manager.ManagerProduits;

public class Produit {
	private int id;
	private String nom;
	private double prix;
	private String desc;
	private String imgUrl;
	private CategorieProduit categorieProduit;
	private Recette saRecette;
	
	
	public Produit() {
		// TODO Auto-generated constructor stub
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



	public CategorieProduit getCategorieProduit() {
		return categorieProduit;
	}




	public void setCategorieProduit(CategorieProduit categorieProduit) {
		this.categorieProduit = categorieProduit;
	}




	public Recette getSaRecette() {
		return saRecette;
	}




	public void setSaRecette(Recette saRecette) {
		this.saRecette = saRecette;
	}
	
}
