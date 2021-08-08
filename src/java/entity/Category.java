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
public class Category {
    private String categoryid;
    private String categoryName;

    public Category() {
    }

    public Category(String categoryid, String categoryName) {
        this.categoryid = categoryid;
        this.categoryName = categoryName;
    }

    public String getCategoryid() {
        return categoryid;
    }

    public void setCategoryid(String categoryid) {
        this.categoryid = categoryid;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    @Override
    public String toString() {
        return "Category{" + "categoryid=" + categoryid + ", categoryName=" + categoryName + '}';
    }
    
}
