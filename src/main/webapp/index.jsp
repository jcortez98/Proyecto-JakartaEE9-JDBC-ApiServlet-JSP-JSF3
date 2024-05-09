<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Productos</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    </head>
    <body>
        <nav class="navbar bg-dark border-bottom border-body" data-bs-theme="dark">
            <div class="container-fluid">
                <a class="navbar-brand">App de ventas</a>
            </div>
        </nav>
        <div class="container" style="padding: 30px 0 20px 10px">
            <h1>Form de productos</h1>
        </div>
        <div class="container">
            <%
                List<String> errores = (List)request.getAttribute("errores");
            if(errores != null && errores.size()>0){
                for(String error:errores){%>
                <ul>
                    <li><%=error%></li>
                </ul>
            <%}
                }%>
        </div>
        <div class="container">
            <form action="/webapp/producto-form/" method="post" enctype="multipart/form-data">
                <div class="row">
                    <div class="col">
                        <div class="form-floating mb-3 ">
                            <input type="text" class="form-control"  name="nombre" id="nombre" placeholder="nombre" value="${param.nombre}">
                            <label for="nombre">Nombre</label>
                        </div>
                    </div>
                    <div class="col">
                        <div class="form-floating mb-3">
                            <input type="number" class="form-control" name="stock" id="stock" placeholder="stock" value="${param.stock}">
                            <label for="stock">Cantidad en stock</label>
                        </div>
                    </div>
                </div> 
                <div class="form-floating mb-3">
                    <textarea name="descripcion" class="form-control" id="descripcion" rows="5" placeholder="descripcion" value="${param.descripcion}"></textarea>
                    <label for="descripcion">Descripcion</label>
                </div>
                <div class="row">
                    <div class="col-auto">
                        <label style="padding-top: 15px">Q</label>
                    </div>
                    <div class="col">
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" name="precio" id="precio" placeholder="precio" value="${param.precio}">
                            <label for="precio">Precio</label>
                        </div>
                    </div>
                    <div class="col">
                        <div class="row mb-3">
                            <label for="imagen">Imagen de producto</label>
                            <input type="file" class="form-control" name="imagen" id="imagen" placeholder="imagen">
                        </div>
                    </div>
                </div>
                <div><input class="btn btn-outline-success" type="submit" value="Agregar"></div>
            </form>
        </div>
    </body>
</html>
