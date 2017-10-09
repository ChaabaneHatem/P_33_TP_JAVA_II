package action;

import javax.servlet.http.HttpServletRequest;

import enitities.Vente;
import manager.ManagerInventaire;

public class ActionVente {

	
	public static void inventaireVente(HttpServletRequest request, Vente venteAjout) {
		ManagerInventaire.ajoutProduit(venteAjout);
	}
}
