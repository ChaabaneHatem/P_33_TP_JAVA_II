package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import enitities.Employe;
import enitities.FonctionEmploye;
import enitities.Produit;
import manager.ManagerEmploye;
import manager.ManagerProduits;
import services.C;

public class ActionEmploye {

	
	public static void afficherAllEmploye(HttpServletRequest request) {
		ArrayList<Employe> lesEmployes = ManagerEmploye.getAllEmploye();
		request.setAttribute(C.listeEmploye, lesEmployes);
	}
	
	public static void afficherEmployeById(HttpServletRequest request, int idEmploye) {
		Produit unEmploye = ManagerProduits.getProduitById(idEmploye);
		request.setAttribute(C.employe, unEmploye);
	}
	
	public static void afficherAllFonctionEmploye(HttpServletRequest request) {
		ArrayList<FonctionEmploye> listeFonctionEmploye = ManagerEmploye.getAllFonctionEmploye();
		request.setAttribute(C.listeFonctionEmploye, listeFonctionEmploye);
	}
	
}
