/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package pm;



import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author Anand
 */
public class Login {

    private static SessionFactory factory;

    
      public static ArrayList get_pm_Data(String emailid) throws Exception {
        try {

            factory = new Configuration() {
            }.configure().buildSessionFactory();

        } catch (Throwable ex) {

           // return "Failed to create sessionFactory object." + ex;

        }

        Session session = factory.openSession();
        Transaction tx = null;
  List data = null;
        try {
          
            tx = (Transaction) session.beginTransaction();

            // create Query 

            Query query = session.createQuery("from fs.PmDetails where pmUserid = :emailid");
            query.setParameter("emailid", emailid);
            // exicute and convert into List 

            data = query.list();

            return (ArrayList) data;
            

        } catch (HibernateException e) {


            if (tx != null) {
                tx.rollback();
            }
           // return e.toString();
        } finally {
            session.close();
        }
return  (ArrayList) data;

    }
    
    
    
    
   public static String getEmailAvailable(String emailid, String tou) throws Exception {
        try {

            factory = new Configuration() {
            }.configure().buildSessionFactory();

        } catch (Throwable ex) {

            return "Failed to create sessionFactory object." + ex;

        }

        Session session = factory.openSession();
        Transaction tx = null;

        try {
            List data;
            tx = session.beginTransaction();

            // create Query 
            
            
            
            
            
            Query query = session.createQuery("from fs.PmDetails where pmUserid = :emailid and typeofuser=:tou");
            query.setParameter("emailid", emailid);
            query.setParameter("tou", tou);
            // exicute and convert into List 

            data = query.list();

            if (data.size() > 0) {
                return "ok";
            } else {
                return "not ok";
            }

        } catch (HibernateException e) {


            if (tx != null) {
                tx.rollback();
            }
            return e.toString();
        } finally {
            session.close();
        }


    }

    public static String getPasswordAvailable(String loginid, String password, String tou) throws Exception {
        try {

            factory = new Configuration() {
            }.configure().buildSessionFactory();

        } catch (Throwable ex) {

            return "Failed to create sessionFactory object." + ex;

        }

        Session session = factory.openSession();
        Transaction tx = null;

        try {
            List data;
            tx = (Transaction) session.beginTransaction();

            // create Query 

            Query query = session.createQuery("from fs.PmDetails where pmUserid= :loginid and password= :password and typeofuser=:tou");
            query.setParameter("loginid", loginid);
            query.setParameter("password", password);
            query.setParameter("tou", tou);
            // exicute and convert into List 

            data = query.list();

            if (data.size() > 0) {
                return "ok";
            } else {
                return "not ok";
            }

        } catch (HibernateException e) {


            if (tx != null) {
                tx.rollback();
            }
            return e.toString();
        } finally {
            session.close();
        }


    }

    public static String addPMDetails(String pmUserid, String pmName, String phno, String address, String password, String typeofuser, String companyheademail) {
// insetStudentDetails is a method

        try {

            factory = new Configuration().configure().buildSessionFactory();

        } catch (Throwable ex) {

            return "Failed to create sessionFactory object." + ex;

        }
        Session session = factory.openSession();
        Transaction tx = null;
        try {

            tx = session.beginTransaction();
            Calendar lCDateTime = Calendar.getInstance();
            String lDateTime = "" + lCDateTime.getTimeInMillis();

            fs.PmDetails fsu = new fs.PmDetails(pmUserid, pmName, phno, address, password, typeofuser, companyheademail);

            session.save(fsu);
            // here the values stored in database
            tx.commit();
        } catch (HibernateException e) {


            if (tx != null) {
                tx.rollback();
            }
            return e.toString();
        } finally {
            session.close();
        }

        return "ok";


    }
}
