package fs;
// Generated 2 Apr, 2014 12:05:37 AM by Hibernate Tools 3.2.1.GA



/**
 * PackagesData generated by hbm2java
 */
public class PackagesData  implements java.io.Serializable {


     private Integer packId;
     private String name;
     private int noOfEmployees;
     private int noOfTasks;
     private int cost;
     private int duration;

    public PackagesData() {
    }

    public PackagesData(String name, int noOfEmployees, int noOfTasks, int cost, int duration) {
       this.name = name;
       this.noOfEmployees = noOfEmployees;
       this.noOfTasks = noOfTasks;
       this.cost = cost;
       this.duration = duration;
    }
   
    public Integer getPackId() {
        return this.packId;
    }
    
    public void setPackId(Integer packId) {
        this.packId = packId;
    }
    public String getName() {
        return this.name;
    }
    
    public void setName(String name) {
        this.name = name;
    }
    public int getNoOfEmployees() {
        return this.noOfEmployees;
    }
    
    public void setNoOfEmployees(int noOfEmployees) {
        this.noOfEmployees = noOfEmployees;
    }
    public int getNoOfTasks() {
        return this.noOfTasks;
    }
    
    public void setNoOfTasks(int noOfTasks) {
        this.noOfTasks = noOfTasks;
    }
    public int getCost() {
        return this.cost;
    }
    
    public void setCost(int cost) {
        this.cost = cost;
    }
    public int getDuration() {
        return this.duration;
    }
    
    public void setDuration(int duration) {
        this.duration = duration;
    }




}


