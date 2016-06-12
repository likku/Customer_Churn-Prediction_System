/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package fb;

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
public class FeedBack {

    private static SessionFactory factory;
    public static String add_feedback_details(int prodictId, String dateTime, String feedbackData, int rating,String givenby){
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

            fs.FeedbackData fsu=new fs.FeedbackData(prodictId, dateTime, feedbackData, rating,givenby);

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
