/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package org.carloscortez.webapp.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Carlos
 */
@WebServlet("/producto-form/")
@MultipartConfig
public class ProductoServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<String> errores = new ArrayList<>();
        
        resp.setContentType("text/html");
        
        PrintWriter out = resp.getWriter();
        
        String nombre = req.getParameter("nombre");
        String descripcion = req.getParameter("descripcion");
        int stock = Integer.parseInt(req.getParameter("stock"));
        String precio = req.getParameter("precio");
        Part imagen = req.getPart("imagen");
        
        if(nombre.isBlank()){
            errores.add("Debe ingresar el nombre del producto!");
        }if(descripcion.isBlank()){
            errores.add("Debe de ingresar una descripción para el producto");
        }if(precio.isBlank()){
            errores.add("Debe de ingresar un precio para el producto");
        }if(imagen == null){
            errores.add("Debe registrar una imagen de producto");
        }
                
        req.setAttribute("errores", errores);
        getServletContext().getRequestDispatcher("/index.jsp").forward(req, resp);
        
    }
    
    
}
