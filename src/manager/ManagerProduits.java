package manager;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import enitities.Produit;
import services.ConnectionBDD;


public class ManagerProduits {

	private static String queryProduitGetAll = "SELECT * FROM `table produit`";
	private static String queryProduitGetbyId = "SELECT * FROM `table produit` where id_produit = ?";
	
	public static ArrayList<Produit> getAllProduit() {
		ArrayList<Produit> retour = null;
		
		
		try {
			ConnectionBDD.getConnection();
			PreparedStatement pstatment = ConnectionBDD.getPs(queryProduitGetAll);
			ResultSet result = pstatment.executeQuery();

			if (result.isBeforeFirst()) {
				retour = new ArrayList<>();

				while (result.next()) {
					Produit p = new Produit();
					p.setId(result.getInt("id_produit"));
					p.setNom(result.getString("nom"));
					p.setPrix(result.getDouble("prix"));
					p.setDesc(result.getString("description"));
					p.setImgUrl(result.getString("image"));
					p.setIdCategorie(result.getInt("categorie_id_categorie"));
					p.setIdRecette(result.getInt("table recette_id_recette"));
					retour.add(p);
				}
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

//		ConnexionBDD.close();
		
		return retour;
	}
	
	public static Produit getProduitById(int idProduit) {
		Produit retour = null;
		
		try {
			ConnectionBDD.getConnection();
			PreparedStatement pstatment = ConnectionBDD.getPs(queryProduitGetbyId);
			pstatment.setInt(1, idProduit);

			ResultSet result = pstatment.executeQuery();

			if (result.next()) {
				retour = new Produit();
				retour.setId(result.getInt("id_produit"));
				retour.setNom(result.getString("nom"));
				retour.setPrix(result.getDouble("prix"));
				retour.setDesc(result.getString("description"));
				retour.setImgUrl(result.getString("image"));
				retour.setIdCategorie(result.getInt("categorie_id_categorie"));
				retour.setIdRecette(result.getInt("table recette_id_recette"));
			}

		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		
		
		
		
		return retour;
	}
}
