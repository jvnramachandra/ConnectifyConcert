package login.summit.registration;

public interface DAO {
	
	public int insertDeveloper(Developer d);
	public Developer getDeveloper(String email,String pass);
	
	public int insertprojectManager(ProjectManager m);
	public ProjectManager getprojectManager(String email,String pass);
	
	public int insertstakeHolder(StakeHolder s);
	public StakeHolder getstakeHolder(String email,String pass);
	
}
