

<%@page import="java.sql.*" %>
<%@page import="bd.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Datos Pais</title>
        <%!
            String consulta;
            Connection cn;
            PreparedStatement pst;
            ResultSet rs;
            String s_accion;
            String s_idpais;
            String s_nombre;
            String s_estado;
        %>
    </head>
    <body>
        <form name="AgregarPaisForm" action="DatosPais.jsp" method="GET">
            <table border="0" align="center">
                <thead>
                    <tr>
                        <th colspan="2">Agregar Pais</th>
                        
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Nombre: </td>
                        <td><input type="text" name="f_nombre" value="" maxlength="30" size="20" /></td>
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
         <h1 align="center">DATOS PAIS</h1>
        <table border="1" cellspacing="1" cellpadding="1" align="center">
            <thead>
                <tr>
                    <th>N°</th>
                    <th>Nombre</th>
                    <th>Estado</th>
                    <th>Eliminar</th>
                </tr>
            </thead>
            <tbody>
                
                <%
                  try {
                        ConectaBd bd = new ConectaBd();
                        cn = bd.getConnection();
                        s_accion = request.getParameter("f_accion");
                        s_idpais = request.getParameter("f_idpais");
                        
                        if (s_accion!=null) {
                        if (s_accion.equals("E")) {
                        consulta =  "   delete from pais "
                                    + " where "
                                    + " idpais = " + s_idpais + "; ";
                        //out.print(consulta);
                        pst = cn.prepareStatement(consulta);
                        pst.executeUpdate();
                        }else if (s_accion.equals("C")) {
                        s_nombre = request.getParameter("f_nombre");
                        s_estado = request.getParameter("f_estado");
                        consulta =  "   insert into "
                                    + " pais(nombre,estado) "
                                    + " values ('"+ s_nombre +"','"+ s_estado +"')";
                        //out.print(consulta);
                        pst = cn.prepareStatement(consulta);
                        pst.executeUpdate();
                        }
                        }
                        
                        consulta = "select idpais, nombre, estado"
                                + " from pais order by nombre";
                        
                        pst = cn.prepareStatement(consulta);
                        rs = pst.executeQuery();
                        int num = 0;
                        String ide;
                        while(rs.next()){
                            ide = rs.getString(1);
                            num++;
                        %>
                        <tr>
                             <td><%out.print(num);%></td>
                            <td><% out.print(rs.getString(2)); %></td>
                            <td><% out.print(rs.getString(3)); %></td>
                            <td><a href="DatosPais.jsp?f_accion=E&f_idpais=<%out.print(ide);%>">Eliminar</a></td>
                        </tr>
                        <%
                        }
                        rs.close();
                        pst.close();
                        cn.close();
                      
                  }  catch(Exception e){
                      out.print("Error SQL");
                  }
                %>
                
                 
            </tbody>
        </table><br>
                <div align="center">
                    <a href="menu.jsp">Menu</a> <br>
                    <a href="Login.jsp">Salir</a>
                </div>
                
    </body>
</html>
