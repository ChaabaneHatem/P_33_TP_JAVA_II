package manager;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import enitities.Employe;
import enitities.FonctionEmploye;
import services.ConnectionBDD;

public class ManagerEmploye {

	private static String queryGetAllEmploye = "SELECT * FROM mamie_clafoutie.`table employe` as em inner join `table fonction employe` as FE on FE.id_fonc = em.`table fonction employe_id_fonc`";
	
	
	private static String queryGetEmployeById = "SELECT * FROM mamie_clafoutie.`table employe` as em inner join `table fonction employe` as FE on FE.id_fonc = em.`table fonction employe_id_fonc`  where em.id_emp = ?";
	
	
	private static String queryGetAllFonctionEmploye = "SELECT * FROM mamie_clafoutie.`table fonction employe`";
	
	
	
	public static ArrayList<Employe> getAllEmploye() {
		ArrayList<Employe> retour = null;

		try {
			ConnectionBDD.getConnection();
			PreparedStatement pstatment = ConnectionBDD.getPs(queryGetAllEmploye);
			ResultSet result = pstatment.executeQuery();

			if (result.isBeforeFirst()) {
				retour = new ArrayList<>();

				while (result.next()) {
					Employe emp  =  new Employe();
					emp.setIdEmploye(result.getInt(1));
					emp.setNom(result.getString(2));
					emp.setPrenom(result.getString(3));
					emp.setPhone(result.getString(4));
					emp.setAdress(result.getString(5));
					FonctionEmploye fonction = new FonctionEmploye();
					fonction.setIdFonction(result.getInt(6));
					fonction.setDescription(result.getString(12));
					fonction.setType(result.getString(13));
					emp.setFonction(fonction);
					emp.setUsername(result.getString(7));
					emp.setPassword(result.getString(8));
					emp.setEmail(result.getString(9));
					emp.setValide(result.getBoolean(10));
					retour.add(emp);
				}
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		// ConnexionBDD.close();

		return retour;
	}
	
	
	public static Employe getEmployeById(int idEmploye) {
		Employe emp = null;

		try {
			ConnectionBDD.getConnection();
			PreparedStatement pstatment = ConnectionBDD.getPs(queryGetEmployeById);
			pstatment.setInt(1, idEmploye);
			ResultSet result = pstatment.executeQuery();

			if (result.isBeforeFirst()) {
				emp  =  new Employe();

				while (result.next()) {
					
					emp.setIdEmploye(result.getInt(1));
					emp.setNom(result.getString(2));
					emp.setPrenom(result.getString(3));
					emp.setPhone(result.getString(4));
					emp.setAdress(result.getString(5));
					FonctionEmploye fonction = new FonctionEmploye();
					fonction.setIdFonction(result.getInt(6));
					fonction.setDescription(result.getString(12));
					fonction.setType(result.getString(13));
					emp.setFonction(fonction);
					emp.setUsername(result.getString(7));
					emp.setPassword(result.getString(8));
					emp.setEmail(result.getString(9));
					emp.setValide(result.getBoolean(10));
				}
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		// ConnexionBDD.close();

		return emp;
	}
	
	
	public static ArrayList<FonctionEmploye> getAllFonctionEmploye() {
		ArrayList<FonctionEmploye> retour = null;

		try {
			ConnectionBDD.getConnection();
			PreparedStatement pstatment = ConnectionBDD.getPs(queryGetAllFonctionEmploye);
			ResultSet result = pstatment.executeQuery();

			if (result.isBeforeFirst()) {
				retour = new ArrayList<>();

				while (result.next()) {
					FonctionEmploye fe  =  new FonctionEmploye();
					fe.setIdFonction(result.getInt(1));
					fe.setDescription(result.getString(2));
					fe.setType(result.getString(3));
					retour.add(fe);
				}
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		// ConnexionBDD.close();

		return retour;
	}
	
	
	
	
}
