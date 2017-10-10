package utils;

import java.util.ArrayList;

import action.ActionEmploye;
import enitities.Employe;
import manager.ManagerEmploye;

public class Autentification {

	public static String Authentifiaction(String username, String password) {
		String roleEmploye = "-1";

		ArrayList<Employe> lesEmployes = ManagerEmploye.getAllEmploye();

		for (Employe unEmploye : lesEmployes) {

			if (username.equals(unEmploye.getUsername()) && password.equals(unEmploye.getPassword())) {
				roleEmploye = unEmploye.getFonction().getType();
			}

		}

		return roleEmploye;

	}
}
