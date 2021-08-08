/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import dao.DAO;
import entity.Category;
import entity.Product;
import entity.ShoppingCartItem;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Minh Hoang
 */
@WebServlet("/CartControl")
public class CartControl extends HttpServlet {
    
    public CartControl() {
        super();
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            displayCart(request, response);
        }else{
            if(action.equalsIgnoreCase("buy")){
                buyItem(request, response);
            }else if(action.equalsIgnoreCase("remove")){
                removeItem(request, response);
            }
        }
    }
    
    protected void displayCart(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("cart.jsp").forward(request, response);
    }
    
    protected void removeItem(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        List<ShoppingCartItem> cart = (List<ShoppingCartItem>) session.getAttribute("cart");
        int index = isExisting(request.getParameter("id"), cart);
        cart.remove(index);
        session.setAttribute("cart", cart);
        response.sendRedirect("CartControl");
    }

    protected void buyItem(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        DAO dao = new DAO();
        HttpSession session = request.getSession();
        if (session.getAttribute("cart") == null) {
            List<ShoppingCartItem> cart = new ArrayList<>();
            cart.add(new ShoppingCartItem(dao.find(request.getParameter("id")), 1));
            session.setAttribute("cart", cart);
        }else{
            List<ShoppingCartItem> cart = (List<ShoppingCartItem>) session.getAttribute("cart");
            int index= isExisting(request.getParameter("id"), cart);
            if(index==-1){
                cart.add(new ShoppingCartItem(dao.find(request.getParameter("id")), 1));
                
            }
            else{
                int quantity=cart.get(index).getQuantity()+1;
               cart.get(index).setQuantity(quantity);
            }
             session.setAttribute("cart", cart);
        }
        response.sendRedirect("CartControl");
    }

    protected int isExisting(String id, List<ShoppingCartItem> cart) {
        for (int i = 0; i < cart.size(); i++) {
            if (cart.get(i).getProduct().getIdProduct().equalsIgnoreCase(id)) {
                return i;
            }
        }
        return -1;
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
