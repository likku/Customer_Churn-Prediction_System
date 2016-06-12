/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package pack;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.Date;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author SARALA
 */
public class Packages {

    public static SessionFactory factory;

    public static void sendsms(String msg, String phno) {
        try {
            Date mydate = new Date(System.currentTimeMillis());

            URL url = new URL("http://control.msg91.com/sendhttp.php?user=sattvaq&password=195845&mobiles=" + phno + "&message=" + msg + "&sender=SatvaQ");
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");
            conn.setDoOutput(true);
            conn.setDoInput(true);
            conn.setUseCaches(false);
            conn.connect();
            BufferedReader rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String line;
            StringBuilder buffer = new StringBuilder();
            while ((line = rd.readLine()) != null) {
                buffer.append(line).append("\n");
            }
            System.out.println("ok");
            rd.close();
            conn.disconnect();
        } catch (Exception e) {
            e.getStackTrace();
        }
    }

    public static boolean addPackageDetails(String name, int noOfEmployees, int noOfTasks, int cost, int duration) {

        try {

            factory = new Configuration() {
            }.configure().buildSessionFactory();

        } catch (Throwable ex) {
            // return "Failed to create sessionFactory object." + ex;
        }
        Session session = factory.openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            // do some work

            fs.PackagesData sp = new fs.PackagesData(name, noOfEmployees, noOfTasks, cost, duration);

            session.save(sp);

            tx.commit();

        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
        } finally {
            session.close();
        }




        return true;
    }

    public static ArrayList get_Companies_Data() {
        try {

            factory = new Configuration() {
            }.configure().buildSessionFactory();

        } catch (Throwable ex) {
            // return "Failed to create sessionFactory object." + ex;
        }
        ArrayList list = new ArrayList();
        Session session = factory.openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            // do some work
//fs.CompanyheadData
            Query q = session.createQuery("from fs.CompanyheadData");
            list = (ArrayList) q.list();
            tx.commit();

        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
        } finally {
            session.close();
        }
        return list;
    }

    public static ArrayList getPackagesData() {
        try {

            factory = new Configuration() {
            }.configure().buildSessionFactory();

        } catch (Throwable ex) {
            // return "Failed to create sessionFactory object." + ex;
        }
        ArrayList list = new ArrayList();
        Session session = factory.openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            // do some work

            Query q = session.createQuery("from fs.PackagesData");
            list = (ArrayList) q.list();
            tx.commit();

        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
        } finally {
            session.close();
        }
        return list;
    }

    public static ArrayList get_SINGLE_PackagesData(int packId) {
        try {

            factory = new Configuration() {
            }.configure().buildSessionFactory();

        } catch (Throwable ex) {
            // return "Failed to create sessionFactory object." + ex;
        }
        ArrayList list = new ArrayList();
        Session session = factory.openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            // do some work
//tl.PackagesData
            Query q = session.createQuery("from fs.PackagesData where packId=:packId");
            q.setParameter("packId", packId);
            list = (ArrayList) q.list();
            tx.commit();

        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
        } finally {
            session.close();
        }
        return list;
    }

    public static ArrayList get_SINGLE_Org_PackagesData_by_org_id(String orgid, String status) {
        try {

            factory = new Configuration() {
            }.configure().buildSessionFactory();

        } catch (Throwable ex) {
            // return "Failed to create sessionFactory object." + ex;
        }
        ArrayList list = new ArrayList();
        Session session = factory.openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            // do some work
//tl.OrgPackages
            Query q = session.createQuery("from tl.OrgPackages where organizationId=:orgid and status=:status");
            q.setParameter("orgid", orgid);
            q.setParameter("status", status);
            list = (ArrayList) q.list();
            tx.commit();
            return list;
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
        } finally {
            session.close();
        }
        return list;
    }

    public static String add_Org__Pack_Details(int packId, String organizationId, Date selectDate, Date startDate, Date endDate, String status) {
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

            fs.OrgPackages ss = new fs.OrgPackages(packId, organizationId, selectDate, startDate, endDate, status);
            session.save(ss);
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

    public static int count_Emp_TL(Date startdate, Date endDate, String orgHead) {
        try {

            factory = new Configuration().configure().buildSessionFactory();

        } catch (Throwable ex) {
            // return "Failed to create sessionFactory object." + ex;
        }
        Session session = factory.openSession();
        Transaction tx = null;
        try {

            tx = session.beginTransaction();
            // tl.TeamLeaderData 
            String hql = "FROM TeamLeaderData WHERE regDate>=:startdate and regDate<=:endDate and orgHead=:orgHead";

            Query q = session.createQuery(hql);

            q.setParameter("startdate", startdate);
            q.setParameter("endDate", endDate);
            q.setParameter("orgHead", orgHead);

            ArrayList ll = (ArrayList) q.list();
            return ll.size();


        } catch (HibernateException e) {


            if (tx != null) {
                tx.rollback();
            }
            // return e.toString();
        } finally {
            session.close();
        }
        return 0;
    }

    public static int count_Emp_Tasks(Date startdate, Date endDate, String orgHead) {
        try {

            factory = new Configuration().configure().buildSessionFactory();

        } catch (Throwable ex) {
            // return "Failed to create sessionFactory object." + ex;
        }
        Session session = factory.openSession();
        Transaction tx = null;
        try {

            tx = session.beginTransaction();
            // tl.TeamLeaderData 
            String hql = "FROM TasksData WHERE addingdate>=:startdate and addingdate<=:endDate and orghead=:orgHead";

            Query q = session.createQuery(hql);

            q.setParameter("startdate", startdate);
            q.setParameter("endDate", endDate);
            q.setParameter("orgHead", orgHead);

            ArrayList ll = (ArrayList) q.list();
            return ll.size();


        } catch (HibernateException e) {


            if (tx != null) {
                tx.rollback();
            }
            // return e.toString();
        } finally {
            session.close();
        }
        return 0;
    }

    public static int count_Emp_TM(Date startdate, Date endDate, String orgHead) {
        try {

            factory = new Configuration().configure().buildSessionFactory();

        } catch (Throwable ex) {
            // return "Failed to create sessionFactory object." + ex;
        }
        Session session = factory.openSession();
        Transaction tx = null;
        try {

            tx = session.beginTransaction();
            //tl.
            String hql = "FROM TeamMemberData WHERE regDate>=:startdate and regDate<=:endDate and orgHead=:orgHead";

            Query q = session.createQuery(hql);

            q.setParameter("startdate", startdate);
            q.setParameter("endDate", endDate);
            q.setParameter("orgHead", orgHead);

            ArrayList ll = (ArrayList) q.list();
            return ll.size();


        } catch (HibernateException e) {


            if (tx != null) {
                tx.rollback();
            }
            // return e.toString();
        } finally {
            session.close();
        }
        return 0;
    }

    public static int update_SINGLE_Org_PackagesData_by_org_id(int packId, String orgid, String status) {
        int list = 0;
        try {

            factory = new Configuration() {
            }.configure().buildSessionFactory();

        } catch (Throwable ex) {
            // return "Failed to create sessionFactory object." + ex;
        }
        Session session = factory.openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            // do some work
//tl.OrgPackages
            Query q = session.createQuery("update tl.OrgPackages set status=:status where packId=:packId and organizationId=:orgid");
            q.setParameter("packId", packId);
            q.setParameter("orgid", orgid);
            q.setParameter("status", status);
            list = q.executeUpdate();
            tx.commit();
            return list;
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
        } finally {
            session.close();
        }
        return list;
    }

    public static boolean checkDateailable(String orgid) {
        try {
            factory = new Configuration().configure().buildSessionFactory();
        } catch (Throwable ex) {
            //   return "Failed to create sessionFactory object." + ex;
        }
        Session session = factory.openSession();
        Transaction tx = null;
        try {
            Date totday = new Date();
            tx = session.beginTransaction();
            //tl.
            String hql = "FROM OrgPackages WHERE endDate<:totday and status='active' and organizationId=:orgid";

            Query q = session.createQuery(hql);

            q.setParameter("totday", totday);
            q.setParameter("orgid", orgid);


            ArrayList ll = (ArrayList) q.list();
            if (ll.size() > 0) {
                return true;
            } else {
                return false;
            }


        } catch (HibernateException e) {


            if (tx != null) {
                tx.rollback();
            }
            // return e.toString();
        } finally {
            session.close();
        }

        return true;
    }

    public static int update_Org_PackagesData_by_org_id(String orgid) {
        try {

            factory = new Configuration() {
            }.configure().buildSessionFactory();

        } catch (Throwable ex) {
            // return "Failed to create sessionFactory object." + ex;
        }
        int list = 0;
        Session session = factory.openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            // do some work
//tl.OrgPackages
            Query q = session.createQuery("update tl.OrgPackages set status='complete' where organizationId=:orgid and status='active'");

            q.setParameter("orgid", orgid);

            list = q.executeUpdate();
            tx.commit();
            return list;
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
        } finally {
            session.close();
        }
        return list;
    }
}
