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
public class Product {
    private String idProduct;
    private String nameProduct;
    private String categoryid;
    private float price;
    private String imageUrl;

    public Product() {
    }

    public Product(String idProduct, String nameProduct, String categoryid, float price, String imageUrl) {
        this.idProduct = idProduct;
        this.nameProduct = nameProduct;
        this.categoryid = categoryid;
        this.price = price;
        this.imageUrl = imageUrl;
    }

    public Product(String string, String string0, String string1, int aInt, String string2) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public Product(String string, String string0, String string1, int aInt, int aInt0) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public String getIdProduct() {
        return idProduct;
    }

    public void setIdProduct(String idProduct) {
        this.idProduct = idProduct;
    }

    public String getNameProduct() {
        return nameProduct;
    }

    public void setNameProduct(String nameProduct) {
        this.nameProduct = nameProduct;
    }

    public String getCategoryid() {
        return categoryid;
    }

    public void setCategoryid(String categoryid) {
        this.categoryid = categoryid;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    @Override
    public String toString() {
        return "Product{" + "idProduct=" + idProduct + ", nameProduct=" + nameProduct + ", categoryid=" + categoryid + ", price=" + price + ", imageUrl=" + imageUrl + '}';
    }
    
    
}
