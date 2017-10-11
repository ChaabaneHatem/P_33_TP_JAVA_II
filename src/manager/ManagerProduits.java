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

	private static String queryGetAllCategorieProduit = "SELECT * FROM mamie_clafoutie.categorie";

	private static String queryGetAllIngredient = "SELECT * FROM mamie_clafoutie.`table ingredient`";

	private static String queryGetAllRecette = "SELECT * FROM mamie_clafoutie.`table recette`";

	private static String queryGetRecetteById = "SELECT re.id_recette, re.description, ing.id_ingredient, ing.description, co.quantite FROM mamie_clafoutie.`table recette` as re inner join `table compose` co on co.`table recette_id_recette` = re.id_recette\r\n" + 
			"																																									  inner join `table ingredient`  ing on co.`table ingredient_id_ingredient` = ing.id_ingredient\r\n" + 
			"																																										where id_recette = ?";
	private static String queryDeleteVente = "Delete from `table vente` where `table produit_id_produit`= ?";
	
	
	private static String queryDeleteProduit = "Delete from `table produit` where id_produit = ?";
	
	
	private static String queryGetProduitByIdCategorie = "SELECT * FROM mamie_clafoutie.`table produit` as pro inner join categorie as ca on pro.categorie_id_categorie = ca.id_categorie where pro.categorie_id_categorie = ?";

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
	
	
	
	public static ArrayList<Produit> getProduitByCategorie(int idCategorie) {
		ArrayList<Produit> retour = null;

		try {
			ConnectionBDD.getConnection();
			PreparedStatement pstatment = ConnectionBDD.getPs(queryGetProduitByIdCategorie);
			pstatment.setInt(1, idCategorie);
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
					categorie.setNomCategorie(result.getString(9));
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
	
	
	
	
	
	public static boolean DeleteProduit(int idProduit) {
		int nbLigne = 0;

		try {
			ConnectionBDD.getConnection();
			PreparedStatement pstatment = ConnectionBDD.getPs(queryDeleteVente);
			pstatment.setInt(1, idProduit);
			nbLigne = pstatment.executeUpdate();
			PreparedStatement pstatment1 = ConnectionBDD.getPs(queryDeleteProduit);
			pstatment1.setInt(1, idProduit);
			nbLigne = pstatment1.executeUpdate();

		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}


		return nbLigne > 0;
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

	public static ArrayList<CategorieProduit> getAllCategorieProduit() {
		ArrayList<CategorieProduit> listeDesCategories = null;

		try {
			ConnectionBDD.getConnection();
			PreparedStatement pstatment = ConnectionBDD.getPs(queryGetAllCategorieProduit);
			ResultSet result = pstatment.executeQuery();

			if (result.isBeforeFirst()) {
				listeDesCategories = new ArrayList<>();
				while (result.next()) {
					CategorieProduit categorie = new CategorieProduit();
					categorie.setIdCategorie(result.getInt(1));
					categorie.setNomCategorie(result.getString(2));
					listeDesCategories.add(categorie);
				}

			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		return listeDesCategories;
	}

	public static ArrayList<Ingredient> getAllIngredient() {
		ArrayList<Ingredient> listeIngredient = null;

		try {
			ConnectionBDD.getConnection();
			PreparedStatement pstatment = ConnectionBDD.getPs(queryGetAllIngredient);
			ResultSet result = pstatment.executeQuery();

			if (result.isBeforeFirst()) {
				listeIngredient = new ArrayList<>();
				while (result.next()) {
					Ingredient ingredient = new Ingredient();
					ingredient.setIdIngredient(result.getInt(1));
					ingredient.setNomIngredient(result.getString(2));
					listeIngredient.add(ingredient);
				}

			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		return listeIngredient;
	}

	public static ArrayList<Recette> getAllRecette() {

		ArrayList<Recette> listeRecette = null;

		try {
			ConnectionBDD.getConnection();
			PreparedStatement pstatment = ConnectionBDD.getPs(queryGetAllRecette);
			ResultSet result = pstatment.executeQuery();

			if (result.isBeforeFirst()) {
				listeRecette = new ArrayList<>();
				while (result.next()) {
					Recette Recette = new Recette();
					Recette.setIdRecette(result.getInt(1));
					Recette.setNomRecette(result.getString(2));
					listeRecette.add(Recette);
				}

			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		return listeRecette;
	}

	public static Recette getRecetteById(int idRecette) {

		Recette recette = null;
		ArrayList<Ingredient> lesingredients;
		try {
			ConnectionBDD.getConnection();
			PreparedStatement pstatment = ConnectionBDD.getPs(queryGetRecetteById);
			pstatment.setInt(1, idRecette);
			ResultSet result = pstatment.executeQuery();

			if (result.isBeforeFirst()) {
				recette = new Recette();
				lesingredients = new ArrayList<>();
				while (result.next()) {
					recette.setIdRecette(idRecette);
					recette.setNomRecette(result.getString(2));
					Ingredient ing = new Ingredient();
					ing.setIdIngredient(result.getInt(3));
					ing.setNomIngredient(result.getString(4));
					ing.setQuantite(result.getInt(5));
					lesingredients.add(ing);
				}
				recette.setLesIngredient(lesingredients);
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		return recette;
	}

}
