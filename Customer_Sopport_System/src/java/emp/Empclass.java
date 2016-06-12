/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package emp;


import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
//import doubleguard.Userdata;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author Bharath
 */
public class Empclass {
    
    private static SessionFactory factory;
    
    
    
    
    
    
    
    
    
     public static String registerEmployee(String empemail, String name, String password, String designition, String companyheademail, String gender, String dob, String mobile, String address, String status) 
    {
        try{
            factory=new Configuration()
                    
                    {
                        
                    }.configure().buildSessionFactory();
            
        } catch (Exception ex) {
            
            return ""+ex;
            
        }
        
  fs.EmployeeData ed=new fs.EmployeeData(empemail, name, password, designition, companyheademail, gender, dob, mobile, address, status);
  
   
    
        Session session = null;
        try {
            session = factory.openSession();
        Transaction t = session.beginTransaction();
            session.save(ed);
            t.commit();
            return "ok";
            
        } catch (Exception ex) {
            //System.out.println(ex.getMessage());
           // return false;
            return ex.getMessage();
        } finally {
            session.close();
        }
    }
    
    
    
    
    
    
    
}
