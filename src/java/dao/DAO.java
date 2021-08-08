    /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import context.DBContext;
import entity.Category;
import entity.Product;
import entity.Users;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Minh Hoang
 */
public class DAO {

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    private List<Product> products;

    public DAO() {
        try {
            this.products = getAllProduct();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<Product> findAll() {
        return this.products;
    }

    public Product find(String id) {
        for (Product product : this.products) {
            if (product.getIdProduct().equalsIgnoreCase(id)) {
                return product;
            }
        }
        return null;
    }

    public List<Product> getAllProduct() {
        List<Product> list = new ArrayList<>();
        String query = "select * from product";
        try {
            con = new DBContext().getConnection();//mo ket noi voi sql
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getFloat(4),
                        rs.getString(5)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Category> getAllCategory() {
        List<Category> list = new ArrayList<>();
        String query = "select * from Category";
        try {
            con = new DBContext().getConnection();//mo ket noi voi sql
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Category(rs.getString(1),
                        rs.getString(2)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public Users checkLoginUsers(String user, String pass) {
        String query = "SELECT * FROM Users\n"
                + "WHERE userID=?\n"
                + "AND password=?";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);
            ps.setString(1, user);
            ps.setString(2, pass);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Users(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getInt(5));
            }

        } catch (Exception e) {
        }
        return null;
    }

    public ArrayList<Product> getProductByCID(String cid) {
        ArrayList<Product> list = new ArrayList<>();
        String query = "select * from product\n"
                + "where categoryid = ?";
        try {
            con = new DBContext().getConnection();//mo ket noi voi sql
            ps = con.prepareStatement(query);
            ps.setString(1, cid);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getFloat(4),
                        rs.getString(5)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public Product getProductByID(String id) {
        Product p = new Product();
        String query = "select * from product\n"
                + "where idProduct = ?";
        try {
            con = new DBContext().getConnection();//mo ket noi voi sql
            ps = con.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Product(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getFloat(4),
                        rs.getString(5));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public List<Product> searchByName(String txtSearch) {
        List<Product> list = new ArrayList<>();
        String query = "select * from product\n"
                + "where [nameProduct] like ?";
        try {
            con = new DBContext().getConnection();//mo ket noi voi sql
            ps = con.prepareStatement(query);
            ps.setString(1, "%" + txtSearch + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getFloat(4),
                        rs.getString(5)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public Users checkUserExist(String user) {
        String query = "select * from Users\n"
                + "where [userID] = ?\n";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);
            ps.setString(1, user);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Users(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getInt(5));
            }

        } catch (Exception e) {
        }
        return null;
    }

    public void singup(String user, String pass, String name) {
        String query = "insert into Users\n"
                + "values(?,?,?,1,0)";
        try {
            con = new DBContext().getConnection();//mo ket noi voi sql
            ps = con.prepareStatement(query);
            ps.setString(1, user);
            ps.setString(2, name);
            ps.setString(3, pass);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void deleteProduct(String pid) {
        String query = "delete from Product\n"
                + "where idProduct = ?";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);
            ps.setString(1, pid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void insertProduct(String id, String name, String image, String price,
            String idcategory) {
        String query = "INSERT [dbo].[Product]([idProduct],[nameProduct], [categoryid], [price],[imageUrl]) VALUES(?,?,?,?,?)";

        try {
            con = new DBContext().getConnection();//mo ket noi voi sql
            ps = con.prepareStatement(query);
            ps.setString(1, id);
            ps.setString(2, name);
            ps.setString(3, idcategory);
            ps.setFloat(4, Float.parseFloat(price));
            ps.setString(5, image);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void editProduct(String name, String idcategory, String price,
             String image, String pid) {
        String query = "update product\n"
                + "set nameProduct = ?,\n"
                + "categoryid = ?,\n"
                + "price = ?,\n"
                + "imageUrl = ?\n"
                + "where idProduct = ?";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(query);

            ps.setString(1, name);
            ps.setString(2, idcategory);
            ps.setFloat(3, Float.parseFloat(price));
            ps.setString(4, image);
            ps.setString(5, pid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
}
