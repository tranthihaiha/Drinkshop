/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

/**
 *
 * @author Minh Hoang
 */
public class Users {
    private String userID;
    private String userName;
    private String password;
    private int isSell;
    private int isAdmin;

    public Users() {
        this.userID = "";
        this.userName = "";
        this.password = "";
        this.isSell = 0;
        this.isAdmin = 0;
    }

    public Users(String userID, String userName, String password, int isSell, int isAdmin) {
        this.userID = userID;
        this.userName = userName;
        this.password = password;
        this.isSell = isSell;
        this.isAdmin = isAdmin;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getIsSell() {
        return isSell;
    }

    public void setIsSell(int isSell) {
        this.isSell = isSell;
    }

    public int getIsAdmin() {
        return isAdmin;
    }

    public void setIsAdmin(int isAdmin) {
        this.isAdmin = isAdmin;
    }

    @Override
    public String toString() {
        return "Users{" + "userID=" + userID + ", userName=" + userName + ", password=" + password + ", isSell=" + isSell + ", isAdmin=" + isAdmin + '}';
    }
    
    
}
