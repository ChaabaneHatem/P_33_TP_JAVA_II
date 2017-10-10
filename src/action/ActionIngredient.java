package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import enitities.Produit;
import manager.ManagerIngredient;
import manager.ManagerProduits;
import services.C;

public class ActionIngredient {

	//les methodes statiques 
			public static void AddIngredient(String nomIngredient) {
				ManagerIngredient.AddIngredient(nomIngredient);
			}
			
			public static void DeleteIngredient(int idIngredient) {
				ManagerIngredient.DeleteIngredient(idIngredient);
			}
			
			
}
