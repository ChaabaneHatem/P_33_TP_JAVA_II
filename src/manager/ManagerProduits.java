package manager;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import enitities.CategorieProduit;
import enitities.Ingredient;
import enitities.Produit;
import enitities.Recette;
import services.ConnectionBDD;

public class ManagerProduits {

	private static String queryProduitGetAll = "SELECT * FROM mamie_clafoutie.`table produit` as pro inner join `table recette` as re on re.id_recette = pro.`table recette_id_recette`\r\n"
			+ "													 inner join categorie as cat on cat.id_categorie = pro.categorie_id_categorie";

	private static String queryProduitGetbyId = "SELECT * FROM mamie_clafoutie.`table produit` as pro inner join `table recette` as re on re.id_recette = pro.`table recette_id_recette`\r\n"
			+ "																	 inner join categorie as cat on cat.id_categorie = pro.categorie_id_categorie where pro.id_produit = ?";

	private static String queryCategorieByID = "SELECT type FROM mamie_clafoutie.categorie where id_categorie = ?";

	private static String queryRecetteByProduitId = "select re.id_recette as idRecette, re.description as nomRecette, ing.id_ingredient as idIng , ing.description as nomIngredient, co.quantite, pro.nom as nomProduit from mamie_clafoutie.`table compose` as co inner join mamie_clafoutie.`table ingredient` as ing on co.`table ingredient_id_ingredient`= ing.id_ingredient\r\n"
			+ "																																inner join `table recette` as re on co.`table recette_id_recette` = re.id_recette\r\n"
			+ "                                                                                                                                inner join `table produit` as pro on pro.`table recette_id_recette` = re.id_recette where pro.id_produit = ?";

	private static String queryGetAllCategorieProduit = "SELECT type FROM mamie_clafoutie.categorie";

	private static String queryGetAllIngredient = "SELECT description FROM mamie_clafoutie.`table ingredient`";
	
	private static String queryGetAllRecette = "SELECT description FROM mamie_clafoutie.`table recette`";

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
					CategorieProduit categorie = new CategorieProduit();
					categorie.setIdCategorie(result.getInt(6));
					categorie.setNomCategorie(result.getString(11));
					p.setCategorieProduit((categorie));
					p.setSaRecette(getRecetteByIdProduit(result.getInt("id_produit")));
					retour.add(p);
				}
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		// ConnexionBDD.close();

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
				CategorieProduit categorie = new CategorieProduit();
				categorie.setIdCategorie(result.getInt(6));
				categorie.setNomCategorie(result.getString(11));
				retour.setCategorieProduit((categorie));
				retour.setSaRecette(getRecetteByIdProduit(result.getInt("id_produit")));

			}

		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		return retour;
	}

	public static String getNomCategorie(int idCategorie) {
		String retour = null;
		try {
			ConnectionBDD.getConnection();
			PreparedStatement pstatment = ConnectionBDD.getPs(queryCategorieByID);
			pstatment.setInt(1, idCategorie);

			ResultSet result = pstatment.executeQuery();

			if (result.next()) {

				retour = result.getString("type");
			}

		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		return retour;
	}

	public static Recette getRecetteByIdProduit(int idProduit) {
		Recette laRecette = null;

		try {
			ConnectionBDD.getConnection();
			PreparedStatement pstatment = ConnectionBDD.getPs(queryRecetteByProduitId);
			pstatment.setInt(1, idProduit);
			ResultSet result = pstatment.executeQuery();

			if (result.isBeforeFirst()) {
				laRecette = new Recette();
				ArrayList<Ingredient> lesingredients = new ArrayList<>();
				while (result.next()) {
					laRecette.setIdRecette(result.getInt(1));
					laRecette.setNomRecette(result.getString(2));
					Ingredient ing = new Ingredient();
					ing.setIdIngredient(result.getInt(3));
					ing.setNomIngredient(result.getString(4));
					ing.setQuantite(result.getInt(5));
					lesingredients.add(ing);
				}
				laRecette.setLesIngredient(lesingredients);
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		return laRecette;
	}

	public static ArrayList<String> getAllCategorieProduit() {
		ArrayList<String> listeDesCategories = null;

		try {
			ConnectionBDD.getConnection();
			PreparedStatement pstatment = ConnectionBDD.getPs(queryGetAllCategorieProduit);
			ResultSet result = pstatment.executeQuery();

			if (result.isBeforeFirst()) {
				listeDesCategories = new ArrayList<>();
				while (result.next()) {
					String categorie = result.getString("type");
					listeDesCategories.add(categorie);
				}

			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		return listeDesCategories;
	}

	public static ArrayList<String> getAllIngredient() {
		ArrayList<String> listeIngredient = null;

		try {
			ConnectionBDD.getConnection();
			PreparedStatement pstatment = ConnectionBDD.getPs(queryGetAllIngredient);
			ResultSet result = pstatment.executeQuery();

			if (result.isBeforeFirst()) {
				listeIngredient = new ArrayList<>();
				while (result.next()) {
					String ingredient = result.getString("description");
					listeIngredient.add(ingredient);
				}

			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		return listeIngredient;
	}

	public static ArrayList<String> getAllRecette() {

		ArrayList<String> listeRecette = null;

		try {
			ConnectionBDD.getConnection();
			PreparedStatement pstatment = ConnectionBDD.getPs(queryGetAllRecette);
			ResultSet result = pstatment.executeQuery();

			if (result.isBeforeFirst()) {
				listeRecette = new ArrayList<>();
				while (result.next()) {
					String Recette = result.getString("description");
					listeRecette.add(Recette);
				}

			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		return listeRecette;
	}

}
