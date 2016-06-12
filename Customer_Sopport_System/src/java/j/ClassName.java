/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package j;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Date;

/**
 *
 * @author Sarala Balina
 */
public class ClassName {

    public static Connection con = null;
    public static Statement st = null;
    public static ResultSet rs = null;
    public static int i = 0;

    public static String get_compid(String uid) throws Exception {
        con = j.DB.DBConnection();
        String q = null, query = "";

        query = "SELECT `companyheademail` FROM `pm_details` WHERE `pm_userid`='" + uid + "'";


        st = con.createStatement();
        rs = st.executeQuery(query);

        if (rs.next()) {
            q = rs.getString(1);
        }

        return q;
    }

    public static ResultSet get_TOTAL_CUSTOMERS(String uid) throws Exception {
        con = j.DB.DBConnection();
        String q = "";
        String query = "";

        query = "SELECT * FROM `answersdata` WHERE `compid`='" + uid + "' GROUP BY `toid`";

        int co = 0;
        st = con.createStatement();
        rs = st.executeQuery(query);



        return rs;
    }

    public static int get_TOTAL_CUSTOMERS1(String uid, String toid) throws Exception {
        con = j.DB.DBConnection();
        int q = 0;
        String query = "";

        query = "SELECT count(*) FROM `answersdata` WHERE `compid`='" + uid + "' and `toid`='" + toid + "'";


        st = con.createStatement();
        rs = st.executeQuery(query);

        if (rs.next()) {
            q = rs.getInt(1);
        }

        return q;
    }

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
}
