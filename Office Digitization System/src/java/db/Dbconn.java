package db;

import java.sql.Connection;
import java.sql.DriverManager;


/**
 *
 * @author manas
 */
public class Dbconn {
    static Connection connection ;

    public static Connection connect() throws Exception {
        
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/hirarchy","root", "");            
            return connection;
        } catch (Exception e) {
            System.out.println("Ex : " + e.toString());
        }
        return null;
    }
}