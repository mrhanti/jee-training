import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.ResultSet;
import com.mysql.jdbc.Statement;

 public class Controleur extends javax.servlet.http.HttpServlet implements javax.servlet.Servlet {
   static final long serialVersionUID = 1L;
   
   private String login,password,role;
   private int index = 0,idFiliere;
   int idResponsable;
   
   @SuppressWarnings("unchecked")
   private Hashtable<String, String> users = new Hashtable();
   final String authentificationPage = "/WEB-INF/views/authentification.jsp";
   final String errorPage = "/WEB-INF/views/errorPage.jsp";
   final String mainChef = "/WEB-INF/views/chef/mainChef.jsp";
   final String profiles = "/WEB-INF/views/chef/profiles.jsp";
   
   final String mainResponsable = "/WEB-INF/views/responsable/mainResponsable.jsp";
   
   final String formulaire_inscription = "/WEB-INF/views/responsable/formulaire_inscription.jsp";
   final String iPersonnelles = "/WEB-INF/views/responsable/informations_personnelles.jsp";
   final String iInternes = "/WEB-INF/views/responsable/informations_internes.jsp";
   final String iComplementaires = "/WEB-INF/views/responsable/informations_complementaires.jsp";
   
   final String changin_password = "/WEB-INF/views/responsable/mot_de_passe.jsp";
   
   final String etat = "/WEB-INF/views/etat.jsp";
   final String searchPage = "/WEB-INF/views/responsable/recherche.jsp";
   final String editPage = "/WEB-INF/views/edit.jsp";
   final String messages = "/WEB-INF/views/messages.jsp";
   
   private String num=null,cne=null,cin=null,nom=null,prenom=null,date=null,lieu=null,serie=null,academie=null,province=null,filiere=null,status=null,mode=null,ordre=null,hebergement=null,telephone=null,email=null,adresse=null,sexe=null;
   
   @SuppressWarnings("unchecked")
   private List<String> errors = new ArrayList<String>();
   private ArrayList<User> responsables = new ArrayList<User>();
   Connection connection = null;
   Statement statement = null;
   
   	public void init()
   	{
   		
   	try {
			Class.forName("com.mysql.jdbc.Driver");
			try {
				connection = (Connection) DriverManager.getConnection("jdbc:mysql://localhost/ServScolariteDb","root","me4ever+");
				statement = (Statement) connection.createStatement();
				ResultSet result = (ResultSet) statement.executeQuery("select username,password,intitule from Users u, Roles r where u.idRole = r.idRole");
				while(result.next())
				{
					login = result.getString(1);
					password = result.getString(2);
					role = result.getString(3);
					
					users.put(login + ":" + password, "allowed:" + role);
				}
				
			} catch (SQLException e) {e.printStackTrace();}
   		
   		} catch (ClassNotFoundException e) {}
   	}
   	
	@SuppressWarnings({ "deprecation", "deprecation" })
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
	{	
		String action = req.getPathInfo();
		String method = req.getMethod().toLowerCase();
		
		if(action.equals("/formulaire") && method.equals("get")) doInit(req, res);
		if(action.equals("/authentification") && method.equals("post")) try {doAuthentification(req, res);} catch (SQLException e) {}
		if(action.equals("/edit") && method.equals("get")) doEdit(req,res);
		
		
		// Responsable 
		if(action.equals("/mainResponsable") && method.equals("get")) getServletContext().getRequestDispatcher(mainResponsable).forward(req, res);
		if(action.equals("/inscriptions") && method.equals("get")) getServletContext().getRequestDispatcher(formulaire_inscription).forward(req, res);
		if(action.equals("/submit") && method.equals("post")) doSubmitSignin(req,res);
		if(action.equals("/annuler") && method.equals("get")) doAnnuler(req,res);
		if(action.equals("/confirm") && method.equals("post")) doConfirm(req,res);
		if(action.equals("/logout") && method.equals("get")) logout(req, res);
		if(action.equals("/recherche") && method.equals("get")) getServletContext().getRequestDispatcher(searchPage).forward(req, res);
		if(action.equals("/recherche") && method.equals("post")) doSearch(req,res);
		if(action.equals("/modify") && method.equals("post")) doModify(req,res);
		if(action.equals("/certScolarite") && method.equals("get")) ImprCertificat(req,res,"certificat_de_scolarite.jrxml");
		if(action.equals("/attInscription") && method.equals("get")) ImprCertificat(req,res,"attestation_inscription.jrxml");
		if(action.equals("/attPresence") && method.equals("get")) ImprCertificat(req,res,"attestation_presence.jrxml");
		if(action.equals("/motdepasse") && method.equals("get")) getServletContext().getRequestDispatcher(changin_password).forward(req, res);
		if(action.equals("/changePassword") && method.equals("post")) changePassword(req, res);
			
		// Chef
		if(action.equals("/showProfiles") && method.equals("get")) doShowProfiles(req,res);
	}
	
	public void doInit(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		req.setAttribute("username", "");
		req.setAttribute("password", "");
		
		getServletContext().getRequestDispatcher(authentificationPage).forward(req, res);
	}
	
	public void doAuthentification(final HttpServletRequest req,final HttpServletResponse res) throws IOException, ServletException, SQLException
	{	
		String role = null;
		
		errors.clear();
		
		try {
			String username = req.getParameter("username");
			String password = req.getParameter("password");
			
			if(username.equals("") || (password.equals(""))) errors.add("V<HTML>&eacute;</HTML>rifiez que tous les champs sont remplis");
			else {
				role = allowed(username,toMD5(password));
				if(role.equals("notExists")) errors.add("Login ou mot de passe incorrecte..."); 
			}
			
			if(errors.size() != 0)
			{
				req.setAttribute("errors", errors);
				req.setAttribute("lien", "formulaire");
				getServletContext().getRequestDispatcher(errorPage).forward(req, res);
			} else 
				if(role.equals("chef")) {
					HttpSession session = req.getSession(true);
					session.setAttribute("username", username);
					
					getServletContext().getRequestDispatcher(mainChef).forward(req, res);
				}
				else 
				  if(role.equals("responsable"))
				  {
					  HttpSession session = req.getSession(true);
					  ResultSet result = (ResultSet) statement.executeQuery("select idFiliere,nomFiliere from Filieres f,Responsables r where f.idResponsable=r.idResponsable and r.idResponsable=(select idResponsable from Responsables r,Users u where r.id_User=u.id_User and u.username='" + username + "')");
					  
					  while(result.next()) 
					  {
						  idFiliere = Integer.parseInt(result.getString(1));
						  filiere = result.getString(2);
					  }
					  
					  session.setAttribute("username", username);
					  session.setAttribute("opassword", password);
					  session.setAttribute("filiere", filiere);
					  
					  getServletContext().getRequestDispatcher(mainResponsable).forward(req, res);
				  }
			
		} catch (NoSuchAlgorithmException e) {}
	}
	
	public void doShowProfiles(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		responsables.clear();
		HttpSession session = req.getSession(true);
		
		
		int id;
		String nom,prenom;
		
		try {
			ResultSet result = (ResultSet) statement.executeQuery("select idResponsable, nomResponsable, prenomResponsable from Responsables r");
			
			while(result.next())
			{
				id = Integer.parseInt(result.getString(1));
				nom = result.getString(2);
				prenom = result.getString(3);
				
				responsables.add(new User(id,nom,prenom));
			}
		
			session.setAttribute("responsables", responsables);
			getServletContext().getRequestDispatcher(profiles).forward(req,	res);
		} catch (SQLException e) {}
		
		
	}
	
	public void doSubmitSignin(HttpServletRequest req , HttpServletResponse res) throws ServletException, IOException
	{
		HttpSession session = req.getSession(true);
		
		if(index == 0)
		{
			num = req.getParameter("num").toUpperCase();
			cne = req.getParameter("cne").toUpperCase();
			cin = req.getParameter("cin").toUpperCase();
			ordre = req.getParameter("ordre").toUpperCase();
			
			session.setAttribute("num", num);
			session.setAttribute("cne", cne);
			session.setAttribute("cin", cin);
			session.setAttribute("ordre", ordre);
			
			index = 1;
			getServletContext().getRequestDispatcher(iPersonnelles).forward(req, res);
		} else
			if(index == 1)
			{
				nom = req.getParameter("nom").toUpperCase();
				prenom = req.getParameter("prenom").toUpperCase();
				date = req.getParameter("date").toUpperCase();
				lieu = req.getParameter("lieu").toUpperCase();
				sexe = req.getParameter("sexe").toUpperCase();
				serie = req.getParameter("serie").toUpperCase(); 
				academie = req.getParameter("academie").toUpperCase();
				province = req.getParameter("province").toUpperCase();
				
				session.setAttribute("nom", nom);
				session.setAttribute("prenom", prenom);
				session.setAttribute("date", date);
				session.setAttribute("lieu", lieu);
				session.setAttribute("sexe", sexe);
				session.setAttribute("serie", serie);
				session.setAttribute("academie", academie);
				session.setAttribute("province", province);
				
				index = 2;
				getServletContext().getRequestDispatcher(iInternes).forward(req, res);
			} else
				if(index == 2)
				{
					status = req.getParameter("status").toUpperCase();
					mode = req.getParameter("mode").toUpperCase();
					hebergement = req.getParameter("hebergement").toUpperCase();
					
					session.setAttribute("status", status);
					session.setAttribute("mode", mode);
					session.setAttribute("hebergement", hebergement);
					index = 3;
					getServletContext().getRequestDispatcher(iComplementaires).forward(req, res);
				} else
					if(index == 3) 
					{
						telephone = req.getParameter("telephone").toUpperCase();
						email = req.getParameter("email").toUpperCase();
						adresse = req.getParameter("adresse").toUpperCase();
						
						session.setAttribute("telephone", telephone);
						session.setAttribute("email", email);
						session.setAttribute("adresse", adresse);
						session.setAttribute("action", "inscription");
						
						index = 0;
						getServletContext().getRequestDispatcher(etat).forward(req, res);
					}
	}
	
	public void doAnnuler(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		HttpSession session = req.getSession(true);
		clearSession(session);
		getServletContext().getRequestDispatcher(mainResponsable).forward(req, res);
	}
	
	public void doConfirm(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		int count = 0;
		HttpSession session = req.getSession(true);
		
		boolean done = false;
		
		if(!done)
		{
			try {
				statement.executeUpdate("insert into Etudiants values('" + count + "','" + num + "','" + cne + "','" + cin + "','" + ordre + "','" + nom + "','" + prenom + "','" + date + "','" + lieu + "','" + sexe + "','" + serie + "','" + academie + "','" + province + "','" + idFiliere + "','" + status + "','" + mode + "','" + hebergement + "','" + telephone + "','" + email + "','" + adresse + "')");
			} catch (SQLException e) {e.printStackTrace();}
			done = true;
		}
		
		if(done && !session.isNew()) 
		{
			clearSession(session);
			session.setAttribute("message", "Ajout effectué avec succès...\nVeuillez patienter, vous serez redirigé vers le \"Menu Principal\" dans quelques instants");
			res.setHeader("Refresh", "5; URL=./mainResponsable");
			getServletContext().getRequestDispatcher(messages).forward(req, res);
		}
		
	}
	
	public void doEdit(HttpServletRequest req , HttpServletResponse res) throws ServletException, IOException
	{
		HttpSession session = req.getSession(true);
		String action = req.getParameter("action");
		if(action.equals("responsable"))
		{
			idResponsable = Integer.parseInt(req.getParameter("id"));
			
			User u = responsables.get(idResponsable-1);
			
			session.setAttribute("nom", u.getNom());
			session.setAttribute("prenom", u.getPrenom());
		}
		session.setAttribute("action", req.getParameter("action"));
		getServletContext().getRequestDispatcher(editPage).forward(req, res);
	}
	
	public void doModify(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		HttpSession session = req.getSession(true);
		
		String action = (String) session.getAttribute("action");
		
		if(action.equals("etudiant"))
		{
			boolean done = false;
			
			String cne = (String) session.getAttribute("cne");
			String cin = req.getParameter("cin").toUpperCase();
			String nom = req.getParameter("nom").toUpperCase();
			String prenom = req.getParameter("prenom").toUpperCase();
			String date = req.getParameter("date").toUpperCase();
			String province = req.getParameter("province").toUpperCase();
			String status = req.getParameter("status").toUpperCase();
			String mode = req.getParameter("mode").toUpperCase();
			String hebergement = req.getParameter("hebergement").toUpperCase();
			String telephone = req.getParameter("telephone").toUpperCase();
			String email = req.getParameter("email").toUpperCase();
			String adresse = req.getParameter("adresse").toUpperCase();
			
			if(!done)
			{	
				try {
					statement.executeUpdate("update Etudiants set cin='" + cin + "' , nom='" + nom + "' , prenom='" + prenom + "' , date='" + date + "' , province='" + province + "' , status='" + status + "' , mode='" + mode + "' , hebergement='" + hebergement + "' , telephone='" + telephone + "' , email='" + email + "' , adresse='" + adresse + "' where cne='" + cne + "'");
				} catch (SQLException e) {e.printStackTrace();}
				done = true;
			}
		} else {
		
			String nom = req.getParameter("nom");
			String prenom = req.getParameter("prenom");
			
				try {
					statement.executeUpdate("update Responsables set nomResponsable='" + nom + "', prenomResponsable='"+ prenom+"' where idResponsable=" + idResponsable);
				} catch (SQLException e) {e.printStackTrace();}
		}
		
		session.setAttribute("message", "Mise à jour effectuée...\nVeuillez patienter, vous serez redirigé vers le \"Menu Principal\" dans quelques instants");
		res.setHeader("Refresh", "5; URL=./mainResponsable");
		getServletContext().getRequestDispatcher(messages).forward(req, res);
	}
	
	public void doSearch(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		errors.clear();
		String cne = req.getParameter("recherche");
		
		try {
			ResultSet result = (ResultSet) statement.executeQuery("select * from Etudiants where cne='" + cne + "'");
			
			
			HttpSession session = req.getSession(true);
			clearSession(session);
			String num = null,cin = null,nom = null,prenom = null,email = null,date = null,lieu = null,serie = null, academie = null,province = null,status = null,mode = null,ordre = null,hebergement = null,telephone = null,adresse = null,sexe = null;
			
			while(result.next())
			{
				num = result.getString(2);
				cne = result.getString(3);
				cin = result.getString(4);
				ordre = result.getString(5);
				nom = result.getString(6);
				prenom = result.getString(7);
				date = result.getString(8);
				lieu = result.getString(9);
				sexe = result.getString(10);
				serie = result.getString(11);
				academie = result.getString(12);
				province = result.getString(13);
				status = result.getString(15);
				mode = result.getString(16);
				hebergement = result.getString(17);
				telephone = result.getString(18);
				email = result.getString(19);
				adresse = result.getString(20);
			}
			
			if(num != null)
			{
				session.setAttribute("num", num);
				session.setAttribute("cne", cne);
				session.setAttribute("cin", cin);
				session.setAttribute("nom", nom);
				session.setAttribute("prenom", prenom);
				session.setAttribute("date", date);
				session.setAttribute("lieu", lieu);
				session.setAttribute("serie", serie);
				session.setAttribute("academie", academie);
				session.setAttribute("province", province);
				session.setAttribute("status", status);
				session.setAttribute("mode", mode);
				session.setAttribute("ordre", ordre);
				session.setAttribute("hebergement", hebergement);
				session.setAttribute("telephone", telephone);
				session.setAttribute("email", email);
				session.setAttribute("adresse", adresse);
				session.setAttribute("sexe", sexe);
				session.setAttribute("action", "recherche");
			} else {
				errors.add("Aucune entrée ayant ce CNE, veuillez vérifiez que le CNE que vous avez spécifié est valide...");
				req.setAttribute("errors", errors);
				req.setAttribute("lien", "recherche");
			}	
			
			if(errors.size() != 0) getServletContext().getRequestDispatcher(errorPage).forward(req, res);
			else getServletContext().getRequestDispatcher(etat).forward(req, res); 
			
		} catch (SQLException e) {e.printStackTrace();}
	}
	
	public void changePassword(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
	{
		String apassword = req.getParameter("apassword");
		String opassword = (String) req.getSession().getAttribute("opassword");
		
		
		if(apassword.equals(opassword)) {
			String nPassword = req.getParameter("npassword");
			String cnPassword = req.getParameter("cnpassword");
			
			if(nPassword.equals(cnPassword))
			{
				try {
					statement.executeUpdate("UPDATE Users SET password=md5('" + nPassword + "') WHERE id_User=" + this.getUserID((String)  req.getSession().getAttribute("username")));
				} catch (SQLException e) {}
			} else System.out.println("Deuxième");
		
		} else System.out.println("Premier");
		
		getServletContext().getRequestDispatcher(mainResponsable).forward(req, res);
	}
	
	public void ImprCertificat(HttpServletRequest req,HttpServletResponse res, String document) throws ServletException, IOException
	{
		HttpSession session = req.getSession(true);
		
		String cne = (String) session.getAttribute("cne");
		Map<String,Object> parameters = new HashMap<String,Object>();
		parameters.put("CNE", cne);
		
		String annee = new SimpleDateFormat("dd/MM/yyyy").format(new Date());
		annee = annee.substring(annee.length() - 4);
		String anneeScolaire = (Integer.parseInt(annee) - 1) + " - " + annee;
		parameters.put("anneeScolaire", anneeScolaire);
		
		final String filename = "/Service_Scolarite_FSSM/ireport/" + document;
		JasperReport jasperReport;
		try {
			jasperReport = JasperCompileManager.compileReport(filename);
			JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, parameters,connection);
			JasperExportManager.exportReportToPdfFile(jasperPrint,"/home/m-reda/Bureau/" + parameters.get("CNE") + ".pdf");
		} catch (JRException e) {e.printStackTrace();}
		
		session.setAttribute("message", "La pièce désirée a été génèrée...\nVeuillez patienter pendant la redirection vers le \"Menu Principal\" ");
		res.setHeader("Refresh", "5; URL=./mainResponsable");
		getServletContext().getRequestDispatcher(messages).forward(req, res);
	}
	
	public void logout(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		HttpSession session = req.getSession();
		
		if(!session.isNew()) 
		{
			session.invalidate();
			getServletContext().getRequestDispatcher(authentificationPage).forward(req, res);
		}
	}
	
	public void clearSession(HttpSession session)
	{
		String[] attributes = {"cne","cin","nom","prenom","date","lieu","pays","serie","academie","province","stat","mode","ordre","hebergement","telephone","email","adresse","sexe"};
		for(int i = 0 ; i < attributes.length ; i++) session.removeAttribute(attributes[i]);
	}
	
	public String toMD5(String input) throws NoSuchAlgorithmException
	{
		byte[] password = input.getBytes();
		byte[] hash = null;		
		
		hash = MessageDigest.getInstance("MD5").digest(password);
		
		StringBuilder hashString = new StringBuilder();
		
		for (int i = 0; i < hash.length; i++)
		{
		        String hex = Integer.toHexString(hash[i]);
		        if (hex.length() == 1)
		        {
		                hashString.append('0');
		                hashString.append(hex.charAt(hex.length() - 1));
		        }
		        else
		                hashString.append(hex.substring(hex.length() - 2));
		}
		return hashString.toString();	
	}

	public String allowed(String login,String pass)
	{
		String data = login + ":" + pass;
		
		if(users.containsKey(data) && users.get(data).startsWith("allowed")) return users.get(data).substring(8);
		else return "notExists";
		
	}
	
	public String getUserID(String username)
	{
		ResultSet result = null;
		String tmp = null;
		try {
			result = (ResultSet) statement.executeQuery("SELECT id_User FROM Users WHERE username='" + username + "' ");
			while(result.next()) tmp = result.getString(1); 
		} catch (SQLException e) {e.printStackTrace();}
		return tmp;
	}
	
	@SuppressWarnings({ "deprecation", "deprecation" })
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
	{
		doGet(req,res);
	}
	
	public void destroy()	
	{	
	
		try {
			connection.close();
		} catch (SQLException e) {e.printStackTrace();}
	}
}