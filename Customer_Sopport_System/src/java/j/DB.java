/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package j;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author Sarala Balina
 */
public class DB {
   public static java.sql.Connection DBConnection()throws Exception
    {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/feedbacksystemonproducts1","root","");
        return con;
    }
}
