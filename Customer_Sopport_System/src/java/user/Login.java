/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package user;

import pm.*;
import admin.*;
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
  public static ArrayList get_user_Data(String emailid) throws Exception {
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

            Query query = session.createQuery("from fs.UserDetails where UEmailid = :emailid");
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

            Query query = session.createQuery("from fs.UserDetails where UEmailid = :emailid");
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

            Query query = session.createQuery("from fs.UserDetails where UEmailid= :loginid and password= :password");
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

    public static String addUserDetails(String name, String emailid, String password, String phno, String address) {
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

            fs.UserDetails fsu = new fs.UserDetails(emailid, name, password, phno, address);

            session.save(fsu);
            // here the values stored in database
            
            tx.commit();
                   
            return "ok";
        } catch (Exception e) {


           
            return e.toString();
        } finally {
            session.close();
        }

      


    }
    
    
 //  public static java.util.ArrayList view_answer_user()
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
