/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cmphead;

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
public class Mycompany {
    private static SessionFactory factory;
    
    public static String registerCompanyHead(String heademail, String companyname, String companylogo, String location, String companyheadname, String password, String gender, String dob, String dateofregistration, int pid) 
    {
        try{
            factory=new Configuration()
                    
                    {
                        
                    }.configure().buildSessionFactory();
            
        } catch (Exception ex) {
            
            return ""+ex;
            
        }
        
        
        
 fs.CompanyheadData cd=new fs.CompanyheadData(heademail, companyname, companylogo, location, companyheadname, password, gender, dob, dateofregistration, pid);
  
   
    
        Session session = null;
        try {
            session = factory.openSession();
        Transaction t = session.beginTransaction();
            session.save(cd);
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
