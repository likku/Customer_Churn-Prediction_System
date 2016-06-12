/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package pro;

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
 * @author SattvaQ
 */
public class Products {

    private static SessionFactory factory;

    public static String add_Product_Details(String proName, String image, String details, int cost, String dateTime, String uploadby) {

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

            fs.ProductDetails fsu = new fs.ProductDetails(proName, image, details, cost, dateTime, uploadby);

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

    public static ArrayList get_AnswerData(int qid) throws Exception {
        try {

            factory = new Configuration() {
            }.configure().buildSessionFactory();

        } catch (Throwable ex) {
            // return "Failed to create sessionFactory object." + ex;
        }

        Session session = factory.openSession();
        Transaction tx = null;
        ArrayList data = null;

        try {

            tx = session.beginTransaction();

            // create Query 
//fs.Answersdata
            Query query = session.createQuery("from fs.Answersdata where questionid = '" + qid + "'");

            // exicute and convert into List 
            data = (ArrayList) query.list();
            return data;


        } catch (HibernateException e) {


            if (tx != null) {
                tx.rollback();
            }
            //return e.toString();
        } finally {
            session.close();
        }

        return data;
    }

    public static ArrayList get_PM_Products(String emailid) throws Exception {
        try {

            factory = new Configuration() {
            }.configure().buildSessionFactory();

        } catch (Throwable ex) {
            // return "Failed to create sessionFactory object." + ex;
        }

        Session session = factory.openSession();
        Transaction tx = null;
        ArrayList data = null;

        try {

            tx = session.beginTransaction();

            // create Query 

            Query query = session.createQuery("from fs.ProductDetails where uploadby = :emailid");
            query.setParameter("emailid", emailid);
            // exicute and convert into List 
            data = (ArrayList) query.list();
            return data;


        } catch (HibernateException e) {


            if (tx != null) {
                tx.rollback();
            }
            //return e.toString();
        } finally {
            session.close();
        }

        return data;
    }

    public static ArrayList get_Products(int start, int maxRows) throws Exception {
        try {

            factory = new Configuration() {
            }.configure().buildSessionFactory();

        } catch (Throwable ex) {
            // return "Failed to create sessionFactory object." + ex;
        }

        Session session = factory.openSession();
        Transaction tx = null;
        ArrayList data = null;

        try {

            tx = session.beginTransaction();

            // create Query 

            Query query = session.createQuery("from fs.ProductDetails");// where uploadby = :emailid");
            query.setFirstResult(start);
            query.setMaxResults(maxRows);
            //query.setParameter("emailid", emailid);
            // exicute and convert into List 
            data = (ArrayList) query.list();
            return data;


        } catch (HibernateException e) {


            if (tx != null) {
                tx.rollback();
            }
            //return e.toString();
        } finally {
            session.close();
        }

        return data;
    }

    public static int get_count_Products() throws Exception {
        try {

            factory = new Configuration() {
            }.configure().buildSessionFactory();

        } catch (Throwable ex) {
            // return "Failed to create sessionFactory object." + ex;
        }

        Session session = factory.openSession();
        Transaction tx = null;
        ArrayList data = null;

        try {

            tx = session.beginTransaction();

            // create Query 

            Query query = session.createQuery("from fs.ProductDetails");// where uploadby = :emailid");

            // exicute and convert into List 
            data = (ArrayList) query.list();

            return data.size();


        } catch (HibernateException e) {


            if (tx != null) {
                tx.rollback();
            }
            //return e.toString();
        } finally {
            session.close();
        }
        return data.size();

    }

    public static ArrayList get_Products_by_where(String sear, int start, int maxRows) throws Exception {
        try {

            factory = new Configuration() {
            }.configure().buildSessionFactory();

        } catch (Throwable ex) {
            // return "Failed to create sessionFactory object." + ex;
        }

        Session session = factory.openSession();
        Transaction tx = null;
        ArrayList data = null;

        try {

            tx = session.beginTransaction();

            // create Query 

            Query query = session.createQuery("from fs.ProductDetails where proName like '%" + sear + "%'");// where uploadby = :emailid");

            // query.setFirstResult(start);
            //  query.setMaxResults(maxRows);

            data = (ArrayList) query.list();
            return data;


        } catch (HibernateException e) {


            if (tx != null) {
                tx.rollback();
            }
            //return e.toString();
        } finally {
            session.close();
        }

        return data;
    }

    public static int get_count_Products_by_where(String sear) throws Exception {
        try {

            factory = new Configuration() {
            }.configure().buildSessionFactory();

        } catch (Throwable ex) {
            // return "Failed to create sessionFactory object." + ex;
        }

        Session session = factory.openSession();
        Transaction tx = null;
        ArrayList data = null;

        try {

            tx = session.beginTransaction();

            // create Query 

            Query query = session.createQuery("from fs.ProductDetails where proName like '%" + sear + "%'");// where uploadby = :emailid");
            //query.setParameter("emailid", emailid);
            // exicute and convert into List 
            data = (ArrayList) query.list();
            return data.size();


        } catch (HibernateException e) {


            if (tx != null) {
                tx.rollback();
            }
            //return e.toString();
        } finally {
            session.close();
        }

        return data.size();
    }

    public static ArrayList get_Products_by_product_id(int product_id) throws Exception {
        try {

            factory = new Configuration() {
            }.configure().buildSessionFactory();

        } catch (Throwable ex) {
            // return "Failed to create sessionFactory object." + ex;
        }

        Session session = factory.openSession();
        Transaction tx = null;
        ArrayList data = null;

        try {

            tx = session.beginTransaction();

            // create Query 

            Query query = session.createQuery("from fs.ProductDetails where productId=:product_id");// where uploadby = :emailid");

            query.setParameter("product_id", product_id);

            data = (ArrayList) query.list();
            return data;
        } catch (HibernateException e) {


            if (tx != null) {
                tx.rollback();
            }
            //return e.toString();
        } finally {
            session.close();
        }

        return data;
    }

    public static ArrayList get_Product_fb_data_by_product_id(int product_id, String givenby) throws Exception {
        try {

            factory = new Configuration() {
            }.configure().buildSessionFactory();

        } catch (Throwable ex) {
            // return "Failed to create sessionFactory object." + ex;
        }

        Session session = factory.openSession();
        Transaction tx = null;
        ArrayList data = null;
        Query query;
        try {

            tx = session.beginTransaction();

            // create Query 
            if (givenby.equals("")) {
                query = session.createQuery("from fs.FeedbackData where prodictId=:product_id");// where uploadby = :emailid");

                query.setParameter("product_id", product_id);
            } else {
                query = session.createQuery("from fs.FeedbackData where prodictId=:product_id and givenby=:givenby");// where uploadby = :emailid");

                query.setParameter("product_id", product_id);
                query.setParameter("givenby", givenby);
            }
            data = (ArrayList) query.list();
            return data;
        } catch (HibernateException e) {


            if (tx != null) {
                tx.rollback();
            }
            //return e.toString();
        } finally {
            session.close();
        }

        return data;
    }

    public static String add_Answer_Details_by_employee(String productid, String questionid, String imgurl, String videourl, String answerdesc, String givenby, String toid, String status, String compid) {

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



            fs.Answersdata fsu = new fs.Answersdata(productid, questionid, imgurl, videourl, answerdesc, givenby, toid, status, compid);

            session.save(fsu);
            // here the values stored in database
            tx.commit();

            return "ok";
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
