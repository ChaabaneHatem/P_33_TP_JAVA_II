package action;

import manager.ManagerUser;

public class ActionUser {
	public static void AddAUser(String nom, String prenom, String phone, String adresse, String username,
			String password, String email,int idCategorie) {
		ManagerUser.AddUser(nom,prenom,phone,adresse,username,password,email,idCategorie);
	}
}
