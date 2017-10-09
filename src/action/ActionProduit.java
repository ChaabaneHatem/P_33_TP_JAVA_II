package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import enitities.Produit;
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
		public static void afficherAllCategorie(HttpServletRequest request) {
			ArrayList<String> listeCategorie = ManagerProduits.getAllCategorieProduit();
			request.setAttribute(C.listeCategorieProduit, listeCategorie);
		}
		
		public static void afficherAllIngredient(HttpServletRequest request) {
			ArrayList<String> listeIngredient = ManagerProduits.getAllIngredient();
			request.setAttribute(C.listeIngredients, listeIngredient);
		}
		
		public static void afficherAllRecette (HttpServletRequest request) {
			ArrayList<String> listeRecette= ManagerProduits.getAllRecette();
			request.setAttribute(C.listeRecette, listeRecette);
		}
}
