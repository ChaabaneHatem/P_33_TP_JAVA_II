package enitities;

import java.util.ArrayList;

public class Recette {

	//
	private int idRecette;
	private String nomRecette;
	private ArrayList<Ingredient> lesIngredient; 

	//
	public Recette() {
		super();
	}

	public int getIdRecette() {
		return idRecette;
	}

	public void setIdRecette(int idRecette) {
		this.idRecette = idRecette;
	}

	public String getNomRecette() {
		return nomRecette;
	}

	public void setNomRecette(String nomRecette) {
		this.nomRecette = nomRecette;
	}

	public ArrayList<Ingredient> getLesIngredient() {
		return lesIngredient;
	}

	public void setLesIngredient(ArrayList<Ingredient> lesIngredient) {
		this.lesIngredient = lesIngredient;
	}

	
	
	
}
