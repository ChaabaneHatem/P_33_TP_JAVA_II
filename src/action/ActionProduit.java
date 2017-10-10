package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import enitities.CategorieProduit;
import enitities.Ingredient;
import enitities.Produit;
import enitities.Recette;
import manager.ManagerProduits;
import services.C;
public class ActionProduit {

	//les methodes statiques 
		public static void afficherAllProduit(HttpServletRequest request) {
			ArrayList<Produit> lesProduits = ManagerProduits.getAllProduit();
			request.setAttribute(C.listeProduits, lesProduits);
		}
		
		public static void afficherbyProduitID(HttpServletRequest request, int idProduit) {
			Produit unProduit = ManagerProduits.getProduitById(idProduit);
			request.setAttribute(C.produit, unProduit);
		}
		
		public static void deleteProduitById (int idProduit) {
			ManagerProduits.DeleteProduit(idProduit);
		}
		
		public static void afficherAllCategorie(HttpServletRequest request) {
			ArrayList<CategorieProduit> listeCategorie = ManagerProduits.getAllCategorieProduit();
			request.setAttribute(C.listeCategorieProduit, listeCategorie);
		}
		
		public static void afficherAllIngredient(HttpServletRequest request) {
			ArrayList<Ingredient> listeIngredient = ManagerProduits.getAllIngredient();
			request.setAttribute(C.listeIngredients, listeIngredient);
		}
		
		public static void afficherAllRecette (HttpServletRequest request) {
			ArrayList<Recette> listeRecette= ManagerProduits.getAllRecette();
			request.setAttribute(C.listeRecette, listeRecette);
		}
		
		public static void afficherRecetteById (HttpServletRequest request, int idRecette) {
			Recette recette= ManagerProduits.getRecetteById(idRecette);
			request.setAttribute(C.recette, recette);
		}
}
