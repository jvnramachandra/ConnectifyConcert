package login.summit.registration;

import java.sql.*;
public class DAOImpl implements DAO {

	static Connection conn;
	static PreparedStatement ps;
	@Override
	public int insertDeveloper(Developer d) {
		int status = 0;
		
		try{
			conn = MyConnectionProvider.getCon();
			ps = conn.prepareStatement("Insert into DEVELOPER(DEV_NAME,DEV_EMAILID,DEV_PASSWORD,DEV_JOBPOS,DEV_EXP,DEV_PROJC,DEV_DOB,DEV_GEN) values(?,?,?,?,?,?,?,?)");
			ps.setString(1, d.getUsername());
			ps.setString(2, d.getEmail());
			ps.setString(3, d.getPassword());
			ps.setString(4, d.getJobpos());
			ps.setString(5, d.getExp());
			ps.setString(6, d.getProjc());
			ps.setString(7, d.getDob());
			ps.setString(8, d.getGen());
			
			status = ps.executeUpdate();
			conn.close();
		}
		catch(Exception e) {
			throw new RuntimeException(e);
			
		}
		return status;
	}
	

	@Override
	public Developer getDeveloper(String email, String pass) {
		Developer d = new Developer();
		
		try {
			conn = MyConnectionProvider.getCon();
			
			ps = conn.prepareStatement("Select * from DEVELOPER where DEV_EMAILID = ? and DEV_PASSWORD = ? ");
			ps.setString(1, email);
			ps.setString(2, pass);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				
				d.setEmail(rs.getString(1));
				d.setPassword(rs.getString(2));
			}
			
		}
		catch(Exception e) {
			throw new RuntimeException(e);
		}
		return d;
	}


	@Override
	public int insertprojectManager(ProjectManager m) {
		// TODO Auto-generated method stub
		int status = 0;
		
		try{
			conn = MyConnectionProvider.getCon();
			ps = conn.prepareStatement("Insert into PROJECTMANAGER(PROJ_NAME,PROJ_EMAILID,PROJ_PASSWORD,PROJ_JOBPOS,PROJ_EXP,PROJ_PROJC,PROJ_DOB,PROJ_GEN) values(?,?,?,?,?,?,?,?)");
			ps.setString(1, m.getUsername());
			ps.setString(2, m.getEmail());
			ps.setString(3, m.getPassword());
			ps.setString(4, m.getJobpos());
			ps.setString(5, m.getExp());
			ps.setString(6, m.getProjc());
			ps.setString(7, m.getDob());
			ps.setString(8, m.getGen());
			status = ps.executeUpdate();
			conn.close();
		}
		catch(Exception e) {
			throw new RuntimeException(e);
			
		}
		return status;
	}


	@Override
	public ProjectManager getprojectManager(String email, String pass) {
		ProjectManager m = new ProjectManager();
		
		try {
			conn = MyConnectionProvider.getCon();
			
			ps = conn.prepareStatement("Select * from PROJECTMANAGER where PROJ_EMAILID = ? and PROJ_PASSWORD = ? ");
			ps.setString(1, email);
			ps.setString(2, pass);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				
				m.setEmail(rs.getString(1));
				m.setPassword(rs.getString(2));
			}
			
		}
		catch(Exception e) {
			throw new RuntimeException(e);
		}
		return m;
	}


	@Override
	public int insertstakeHolder(StakeHolder s) {
		int status = 0;
		
		try{
			conn = MyConnectionProvider.getCon();
			ps = conn.prepareStatement("Insert into STAKEHOLDER(STAKE_NAME,STAKE_EMAILID,STAKE_PASSWORD,STAKE_CNAME) values(?,?,?,?)");
			ps.setString(1, s.getUsername());
			ps.setString(2, s.getEmail());
			ps.setString(3, s.getPassword());
			ps.setString(4, s.getCname());
			status = ps.executeUpdate();
			conn.close();
		}
		catch(Exception e) {
			throw new RuntimeException(e);
			
		}
		return status;
	}


	@Override
	public StakeHolder getstakeHolder(String email, String pass) {
		StakeHolder s = new StakeHolder();
		
		try {
			conn = MyConnectionProvider.getCon();
			
			ps = conn.prepareStatement("Select * from STAKEHOLDER where STAKE_EMAILID = ? and STAKE_PASSWORD = ? ");
			ps.setString(1, email);
			ps.setString(2, pass);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				
				s.setEmail(rs.getString(1));
				s.setPassword(rs.getString(2));
			}
			
		}
		catch(Exception e) {
			throw new RuntimeException(e);
		}
		return s;
	}
}
