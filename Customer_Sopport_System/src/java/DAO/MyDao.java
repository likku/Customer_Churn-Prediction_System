/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

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
public class MyDao {

    /* public static String registerEmployee(String email,String name, String password,String tofemp,String gender,String dob,String design,String quali,String mobile,String location,String address,String status,String orgheademail,int deptid) 
    {
    
    emp.EmployeeData edata=new emp.EmployeeData(email, name, password, tofemp, gender, dob, design,quali, mobile, location, address, status, orgheademail, deptid) ;
    
    
    SessionFactory sf = null;
    Session session = null;
    try {
    sf = HibernateUtil.getSessionFactory();
    session = sf.openSession();
    Transaction t = session.beginTransaction();
    session.save(edata);
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
    
    public static boolean checkEmpavailability(String email) {
    
    java.util.ArrayList al = new ArrayList();
    SessionFactory sf = null;
    Session session = null;
    //try {
    sf = HibernateUtil.getSessionFactory();
    session = sf.openSession();
    Transaction t = session.beginTransaction();
    
    org.hibernate.Query q = session.createQuery("from emp.EmployeeData where empemail=:email");// where email='" + email + "'");
    // java.util.ArrayList al=new java.util.ArrayList();
    q.setParameter("email", email);
    al = (ArrayList) q.list();
    if (al.size() > 0) {
    return true;
    } else {
    return false;
    }
    
    }
     */
    private static SessionFactory factory;
    //method for checking which type of user and his email

    public static String tofuLoginbycheckingemail(String email, String tou) {
        try {
            factory = new Configuration() {
            }.configure().buildSessionFactory();

        } catch (Exception ex) {

            return "" + ex;

        }

        java.util.ArrayList al = new ArrayList();

        Session session = null;
        try {

            session = factory.openSession();
            Transaction t = session.beginTransaction();
            Query query = null;

            if (tou.equals("serviceprovider")) {

                query = session.createQuery("from emp.ServiceproviderData where spemail=:email");


            } else if (tou.equals("companyhead")) {
                //System.out.println("Organization head");
                query = session.createQuery("from emp.CompanyheadData where heademail=:email");

            } else if (tou.equals("employee")) {
                //System.out.println("Department head");
                query = session.createQuery("from emp.EmployeeData where empemail=:email");

            } else if (tou.equals("customer")) {
                //System.out.println("Employee");

                query = session.createQuery("from emp.CustomerData where custemail=:email");

            }

            query.setParameter("email", email);
            // exicute and convert into List 
            al = (ArrayList) query.list();

            if (al.size() > 0) {
                return "" + al.size();
            } else {
                return "0";
            }
        } catch (Exception e) {
            return e.getMessage();
        } finally {
            session.close();
        }


        //return "ok";  
    }

    public static String getPassword(String email, String tou, String password) {


        try {
            factory = new Configuration() {
            }.configure().buildSessionFactory();

        } catch (Exception ex) {

            return "" + ex;

        }

        java.util.ArrayList al = new ArrayList();

        Session session = null;
        try {
            session = factory.openSession();

            Transaction t = session.beginTransaction();
            Query query = null;

            if (tou.equals("serviceprovider")) {

                query = session.createQuery("from emp.ServiceproviderData where spemail=:email and password= :password");


            } else if (tou.equals("companyhead")) {
                //System.out.println("Organization head");
                query = session.createQuery("from emp.CompanyheadData where heademail=:email and password= :password");

            } else if (tou.equals("employee")) {
                //System.out.println("Department head");
                query = session.createQuery("from emp.EmployeeData where empemail=:email and password= :password");

            } else if (tou.equals("customer")) {
                //System.out.println("Employee");

                query = session.createQuery("from emp.CustomerData where custemail=:email and password= :password");

            }

            query.setParameter("email", email);
            query.setParameter("password", password);

            al = (ArrayList) query.list();

            if (al.size() > 0) {
                return "" + al.size();
            } else {
                return "0";
            }



        } catch (Exception e) {

            return e.getMessage();
        } finally {
            session.close();
        }

    }
    /*
    public static String createPackage(String planname, int noofcustomers, int noofemployees, int amount, String duration, String description, String dateofplanadd, String status) 
    {
    try{
    factory=new Configuration()
    
    {
    
    }.configure().buildSessionFactory();
    
    } catch (Exception ex) {
    
    return ""+ex;
    
    }
    
    emp.PackagesData pdata=new emp.PackagesData(planname, noofcustomers, noofemployees, amount, duration, description, dateofplanadd, status);
    
    
    Session session = null;
    try {
    session = factory.openSession();
    Transaction t = session.beginTransaction();
    session.save(pdata);
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
    
    
    public static java.util.ArrayList viewPlans() {
    
    
    try{
    factory=new Configuration()
    
    {
    
    }.configure().buildSessionFactory();
    
    } catch (Exception ex) {
    
    //return ""+ex;
    
    }
    java.util.ArrayList al = new ArrayList();
    
    Session session = null;
    try {
    
    session = factory.openSession();
    Transaction t = session.beginTransaction();
    
    //where doctoremail=:planid
    org.hibernate.Query q = session.createQuery("from emp.PackagesData");// where email='" + email + "'");
    // java.util.ArrayList al=new java.util.ArrayList();
    //q.setParameter("pemail", pemail);
    al = (ArrayList) q.list();
    
    return al;   
    
    }catch(Exception e){
    System.out.println(e.getMessage());
    }  
    finally {
    session.close();
    }
    
    return al;   
    
    }
     */

    public static String add_Package_after_Head_subscribe(int packId, String organizationId, Date selectDate, Date startDate, Date endDate, String status) {
        try {
            factory = new Configuration() {
            }.configure().buildSessionFactory();

        } catch (Exception ex) {

            return "" + ex;

        }


        fs.OrgPackages fd = new fs.OrgPackages(packId, organizationId, selectDate, startDate, endDate, status);



        //emp.CompanyheadData cd=new emp.CompanyheadData(heademail, companyname, companylogo, location, companyheadname, password, gender, dob, dateofregistration, pid);



        Session session = null;
        try {
            session = factory.openSession();
            Transaction t = session.beginTransaction();
            session.save(fd);
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

    public static String registerCompanyHead(String heademail, String companyname, String companylogo, String location, String companyheadname, String password, String gender, String dob, String dateofregistration, int pid) {
        try {
            factory = new Configuration() {
            }.configure().buildSessionFactory();

        } catch (Exception ex) {

            return "" + ex;

        }


        fs.CompanyheadData cd = new fs.CompanyheadData(heademail, companyname, companylogo, location, companyheadname, password, gender, dob, dateofregistration, pid);

        //fs.CompanyheadData

        //emp.CompanyheadData cd=new emp.CompanyheadData(heademail, companyname, companylogo, location, companyheadname, password, gender, dob, dateofregistration, pid);



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

    /*
    
    public static String registerEmployee(String empemail, String name, String password, String designition, String companyheademail, String gender, String dob, String mobile, String address, String status) 
    {
    try{
    factory=new Configuration()
    
    {
    
    }.configure().buildSessionFactory();
    
    } catch (Exception ex) {
    
    return ""+ex;
    
    }
    
    emp.EmployeeData ed=new emp.EmployeeData(empemail, name, password, designition, companyheademail, gender, dob, mobile, address, status);
    
    
    
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
    
    
    public static String addProducts(String productname, String productdescription, int cost, String feedback, String custemail, String dateofproductadd, String productavailabilyty, String companyheademail, String empemail) 
    {
    try{
    factory=new Configuration()
    
    {
    
    }.configure().buildSessionFactory();
    
    } catch (Exception ex) {
    
    return ""+ex;
    
    }
    
    //emp.EmployeeData ed=new emp.EmployeeData(empemail, name, password, designition, companyheademail, gender, dob, mobile, address, status);
    
    emp.ProductData pd=new emp.ProductData(productname, productdescription, cost, feedback, custemail, dateofproductadd, productavailabilyty, companyheademail, empemail);
    
    Session session = null;
    try {
    session = factory.openSession();
    Transaction t = session.beginTransaction();
    session.save(pd);
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
    
    
    public static java.util.ArrayList viewEmployee() {
    
    
    try{
    factory=new Configuration()
    
    {
    
    }.configure().buildSessionFactory();
    
    } catch (Exception ex) {
    
    //return ""+ex;
    
    }
    java.util.ArrayList al = new ArrayList();
    
    Session session = null;
    try {
    
    session = factory.openSession();
    Transaction t = session.beginTransaction();
    
    //where doctoremail=:planid
    org.hibernate.Query q = session.createQuery("from emp.PackagesData");// where email='" + email + "'");
    // java.util.ArrayList al=new java.util.ArrayList();
    //q.setParameter("pemail", pemail);
    al = (ArrayList) q.list();
    
    return al;   
    
    }catch(Exception e){
    System.out.println(e.getMessage());
    }  
    finally {
    session.close();
    }
    
    return al;   
    
    }
    
    
    
    
    public static String regCustomer(String custemail, String custname, String password, String gender, String dob, String mobile, String address, String location) 
    {
    try{
    factory=new Configuration()
    
    {
    
    }.configure().buildSessionFactory();
    
    } catch (Exception ex) {
    
    return ""+ex;
    
    }
    
    //emp.EmployeeData ed=new emp.EmployeeData(empemail, name, password, designition, companyheademail, gender, dob, mobile, address, status);
    
    emp.CustomerData cd=new emp.CustomerData(custemail, custname, password, gender, dob, mobile, address, location);
    
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
    
    
    
    public static java.util.ArrayList viewProducts() {
    
    
    try{
    factory=new Configuration()
    
    {
    
    }.configure().buildSessionFactory();
    
    } catch (Exception ex) {
    
    //return ""+ex;
    
    }
    java.util.ArrayList al = new ArrayList();
    
    Session session = null;
    try {
    
    session = factory.openSession();
    Transaction t = session.beginTransaction();
    
    //where doctoremail=:planid
    org.hibernate.Query q = session.createQuery("from emp.ProductData");// where email='" + email + "'");
    // java.util.ArrayList al=new java.util.ArrayList();
    //q.setParameter("pemail", pemail);
    al = (ArrayList) q.list();
    
    return al;   
    
    }catch(Exception e){
    System.out.println(e.getMessage());
    }  
    finally {
    session.close();
    }
    
    return al;   
    
    }
    
     */
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

    public static String updateProducts(String pname, String description, int cost, String avail, int pid) {

        try {
            factory = new Configuration() {
            }.configure().buildSessionFactory();

        } catch (Exception ex) {

            return "" + ex;

        }
        Session session = null;

        Query query = null;


        try {

            session = factory.openSession();
            Transaction t = session.beginTransaction();

            query = session.createQuery("update emp.ProductData set productname=:pname, productdescription=:description, cost=:cost,productavailabilyty=:avail where productid=:pid");

            query.setParameter("pid", pid);
            query.setParameter("pname", pname);
            query.setParameter("description", description);
            query.setParameter("cost", cost);
            query.setParameter("avail", avail);
            query.executeUpdate();
            t.commit();
            return "ok";


        } catch (Exception ex) {
            return ex.getMessage();

        }



    }

    public static java.util.ArrayList view_answer_by_Question(int question_id) {


        try {
            factory = new Configuration() {
            }.configure().buildSessionFactory();

        } catch (Exception ex) {
            //return ""+ex;
        }
        java.util.ArrayList al = new ArrayList();

        Session session = null;
        try {

            session = factory.openSession();
            Transaction t = session.beginTransaction();

            //where doctoremail=:planid
            org.hibernate.Query q = session.createQuery("from fs.Answersdata where questionid=" + question_id + "");// where email='" + email + "'");
            // java.util.ArrayList al=new java.util.ArrayList();
            //q.setParameter("question_id", question_id);
            al = (ArrayList) q.list();

            return al;

        } catch (Exception e) {
            System.out.println(e.getMessage());
        } finally {
            session.close();
        }

        return al;

    }
}
