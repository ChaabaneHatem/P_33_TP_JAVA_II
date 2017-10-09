package manager;

import java.sql.PreparedStatement;
import java.sql.SQLException;

import enitities.Vente;
import services.ConnectionBDD;

public class ManagerInventaire {

	private static String queryAjouQty=  "INSERT INTO table vente"+ "(id_ord, quantite_total, quantite_restante,date,science,id_employe,id_produit) VALUES"+"(?,?,?,?,?,?,?)";
	
	public static void ajoutProduit(Vente venteAjout){
	try {
		
		PreparedStatement pstatment = ConnectionBDD.getPs(queryAjouQty);
		//PreparedStatement pstatment = ConnectionBDD.getConnection().prepareStatement(queryAjouQty);

		pstatment.setInt(1,venteAjout.getId());
		pstatment.setInt(2,venteAjout.getQuantiteTotal());
		pstatment.setInt(3,venteAjout.getQuantiteRestante());
		//pstatment.setDate(4,(Date) venteAjout.getDate());
		pstatment.setString(5,venteAjout.getScience());

		pstatment.executeUpdate();

	} catch (SQLException e) {

		e.printStackTrace();

	}
	}
}

