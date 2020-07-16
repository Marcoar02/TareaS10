

<%@page import="java.sql.*" %>
<%@page import="bd.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Datos Libro</title>
        <%!
            String consulta;
            Connection cn;
            PreparedStatement pst;
            ResultSet rs;
            String s_accion;
            String s_titulo;
            String s_cantidad;
            String s_año;
            String s_precio;
            String s_estado;
        %>
    </head>
    <body>
        <form name="AgregarEstudianteForm" action="datosestudiante.jsp" method="GET">
            <table border="0" align="center">
                <thead>
                    <tr>
                        <th colspan="2">Agregar Estudiante</th>
                        
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Nombre: </td>
                        <td><input type="text" name="f_nombre" value="" maxlength="30" size="20" /></td>
                    </tr>
                    <tr>
                        <td>Apellido: </td>
                        <td><input type="text" name="f_apellidos" value="" maxlength="40" size="20" /></td>
                    </tr>
                    <tr>
                        <td>DNI: </td>
                        <td><input type="text" name="f_dni" value="" maxlength="8" size="8"/></td>
                    </tr>
                    <tr>
                        <td>Código</td>
                        <td><input type="text" name="f_codigo" value="" maxlength="12" size="11"/></td>
                    </tr>
                    <tr>
                        <td>Estado: </td>
                        <td><input type="text" name="f_estado" value="" maxlength="1" size="2"/></td>
                    </tr>
                    <tr align="center">
                        <td colspan="2">
                            <input type="submit" value="Agregar" name="f_agregar" />
                            <input type="hidden" name="f_accion" value="C" />
                        </td>
                    </tr>
                </tbody>
            </table>

        </form>
        <h1 align="center">DATOS LIBRO</h1>
        <table border="1" cellspacing="1" cellpadding="1" align="center">
            <thead>
                <tr>
                    <th>Nro</th>
                    <th>Autor</th>
                    <th>Título</th>
                    <th>Cantidad</th>
                    <th>Año</th>
                    <th>Editorial</th>
                    <th>Pais</th>
                    <th>Precio</th>
                    <th>Estado</th>
                </tr>
            </thead>
            <tbody>
                
                <%
                  try {
                        ConectaBd bd = new ConectaBd();
                        cn = bd.getConnection();
                        consulta = "select  a.nombre, l.titulo, l.cantidad, l.año,e.nombre, p.nombre, l.precio, l.estado"
                                + " from autor a,libro l, editorial e, pais p "
                                + " where l.idautor= a.idautor and l.ideditorial = e.ideditorial and l.idpais = p.idpais"
                                + " order by a.nombre , p.nombre , e.nombre";
                        
                        pst = cn.prepareStatement(consulta);
                        rs = pst.executeQuery();
                         int index = 1;
                        while(rs.next()){
                           
                        %>
                        <tr>
                            <td><% out.print(index); %></td>
                            <td><% out.print(rs.getString(1)); %></td>
                            <td><% out.print(rs.getString(2)); %></td>
                            <td><% out.print(rs.getString(3)); %></td>
                            <td><% out.print(rs.getString(4)); %></td>
                            <td><% out.print(rs.getString(5)); %></td>
                            <td><% out.print(rs.getString(6)); %></td>
                            <td><% out.print(rs.getString(7)); %></td>
                            <td><% out.print(rs.getString(8)); %></td>
                            
                        </tr>
                        <%
                            index++;
                        }
                        rs.close();
                        pst.close();
                        cn.close();
                      
                  }  catch(Exception e){
                      out.print("Error SQL");
                  }
                %>
                
                
                
            </tbody>
        </table><br><div align="center">
                    <a href="menu.jsp">Menu</a> <br>
                    <a href="Login.jsp">Salir</a>
                </div>

    </body>
</html>
