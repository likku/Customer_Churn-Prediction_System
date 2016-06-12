/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package admin;

import java.util.ArrayList;
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

    public static String change_Password(String emailid, String password, String tou) {
        try {

            factory = new Configuration() {
            }.configure().buildSessionFactory();

        } catch (Throwable ex) {

            return "Failed to create sessionFactory object." + ex;

        }
        Session session = factory.openSession();
        Transaction tx = null;

        try {
            int data;
            tx = (Transaction) session.beginTransaction();

            // create Query 


            Query query = null;



            if (tou.equals("admin")) {

                query = session.createQuery("update fs.AdminData set password= :password where userId = :emailid");
            
            } else if (tou.equals("productmanager")) {

                query = session.createQuery("update fs.PmDetails set password= :password where pmUserid= :loginid");
            
            } else if (tou.equals("user")) {

                query = session.createQuery("update fs.UserDetails set password= :password where UEmailid= :loginid");
            }


            query.setParameter("loginid", emailid);
            query.setParameter("password", password);
            // exicute and convert into List 


            data = query.executeUpdate();
            tx.commit();
            if (data > 0) {
                return "" + data;
            } else {
                return "0";
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
   public static String getEmailAvailable_admin(String emailid) throws Exception {
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

            Query query = session.createQuery("from fs.AdminData where userId = :emailid");
            query.setParameter("emailid", emailid);
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
    
    
    
    
    public static String getEmailAvailable(String emailid) throws Exception {
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
//fs.CompanyheadData
            Query query = session.createQuery("from fs.CompanyheadData where heademail = :emailid");
            query.setParameter("emailid", emailid);
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

    public static ArrayList get_admin_Data(String emailid) throws Exception {
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

            Query query = session.createQuery("from fs.AdminData where userId = :emailid");
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
        return (ArrayList) data;

    }

  
      public static String getPasswordAvailable_admin(String loginid, String password) throws Exception {
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

            Query query = session.createQuery("from AdminData where userId= :loginid and password= :password");
            query.setParameter("loginid", loginid);
            query.setParameter("password", password);
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
    
    
    public static String getPasswordAvailable(String loginid, String password) throws Exception {
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

            Query query = session.createQuery("from fs.CompanyheadData where heademail= :loginid and password= :password");
            query.setParameter("loginid", loginid);
            query.setParameter("password", password);
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
}
