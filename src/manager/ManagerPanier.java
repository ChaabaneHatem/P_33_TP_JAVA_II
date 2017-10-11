package manager;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;

import enitities.LigneDeCommande;
import enitities.Produit;
import services.C;

public class ManagerPanier {

	public static void addToPanier(HttpServletRequest request, int idProduitajouterPanier, int qtyProduit) {
		LigneDeCommande ldc = new LigneDeCommande(1, idProduitajouterPanier, qtyProduit);
		HashMap<Integer, LigneDeCommande> panier = (HashMap<Integer, LigneDeCommande>) ManagerSession.get(request,
				"panier");

		if (panier == null) {
			panier = new HashMap<>();
		}

		if (!panier.containsKey(ldc.getIdProduit())) {
			panier.put(ldc.getIdProduit(), ldc);
		} else {
			LigneDeCommande newLdc = panier.get(ldc.getIdProduit());
			newLdc.setQtyProduit(newLdc.getQtyProduit() + ldc.getQtyProduit());
			panier.replace(ldc.getIdProduit(), newLdc);
		}

		ManagerSession.add(request, "panier", panier);
	}

	public static void removeFromPanier(HttpServletRequest request, int idProduitToRemove, int qtyToRemove) {

		LigneDeCommande ldc = new LigneDeCommande(1, idProduitToRemove, qtyToRemove);
		HashMap<Integer, LigneDeCommande> panier = (HashMap<Integer, LigneDeCommande>) ManagerSession.get(request,
				"panier");

		if (panier != null) {
			if (!panier.containsKey(ldc.getIdProduit())) {
				LigneDeCommande newldc = panier.get(ldc.getIdProduit());
				// if la qty a retirer est egale a zero je set la qty de ceproduit a zero

				newldc.setQtyProduit(ldc.getQtyProduit() - ldc.getQtyProduit());
				if (newldc.getQtyProduit() > 0) {
					panier.replace(ldc.getIdProduit(), newldc);
				} else {
					panier.remove(ldc.getIdProduit());
				}

			}

			ManagerSession.add(request, "panier", panier);

		}

	}

	public static int getNbArticle(HttpServletRequest request) {
		int nbArticle = 0;

		HashMap<Integer, LigneDeCommande> panier = (HashMap<Integer, LigneDeCommande>) ManagerSession.get(request,
				"panier");

		if (panier != null) {
			for (Entry<Integer, LigneDeCommande> commande : panier.entrySet()) {

				nbArticle += commande.getValue().getQtyProduit();

			}

		}

		return nbArticle;

	}

	public static void afficherPanierConsole(HttpServletRequest request) {

		HashMap<Integer, LigneDeCommande> panier = (HashMap<Integer, LigneDeCommande>) ManagerSession.get(request,
				"panier");

		if (panier != null) {
			for (Entry<Integer, LigneDeCommande> commande : panier.entrySet()) {

				System.out.println(
						"produit" + commande.getKey() + "      sa qty :" + commande.getValue().getQtyProduit());

			}

		}

	}

	public static ArrayList<Produit> getAllProduitPanier(HttpServletRequest request) {
		ArrayList<Produit> listeProduitPanier = null;
		HashMap<Integer, LigneDeCommande> panier = (HashMap<Integer, LigneDeCommande>) ManagerSession.get(request,
				"panier");

		if (panier != null) {
			listeProduitPanier = new ArrayList<>();

			for (Entry<Integer, LigneDeCommande> commande : panier.entrySet()) {
				int idProduitdansPanier = commande.getKey();
				Produit produitDansPanier = ManagerProduits.getProduitById(idProduitdansPanier);
				if (produitDansPanier.getNom() != null) {
					listeProduitPanier.add(produitDansPanier);
				}

			}

			request.setAttribute(C.listeProduitPanier, listeProduitPanier);

		}

		return listeProduitPanier;
	}
	

}
