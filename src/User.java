public class User 
{
	private int id;
	private String nom;
	private String prenom;
	private String role;
	
	public User(int id, String nom, String prenom, String role) 
	{
		this.id = id;
		this.nom = nom;
		this.prenom = prenom;
		this.role = role;
	}
	
	public User(int id,String nom,String prenom)
	{
		this.id = id;
		this.nom = nom;
		this.prenom = prenom;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNom() {
		return nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	public String getPrenom() {
		return prenom;
	}

	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}
	
	public String toString()
	{
		return getId() + "|" + getNom() + " | " + getPrenom() + "|" + getRole();
	}
}
