package com.mycompany.cafe.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Conexion {

    private static final String URL = "jdbc:mysql://localhost:3306/cafe_jhona";
    private static final String USER = "root";
    private static final String PASSWORD = "";

    public static Connection getConexion() {

        Connection conexion = null;

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");

            conexion = DriverManager.getConnection(URL, USER, PASSWORD);

            System.out.println("Conexión exitosa a la base de datos.");

        } catch (ClassNotFoundException e) {

            Logger.getLogger(Conexion.class.getName()).log(
                    Level.SEVERE,
                    "No se encontró el Driver de MySQL.",
                    e
            );

        } catch (SQLException e) {

            Logger.getLogger(Conexion.class.getName()).log(
                    Level.SEVERE,
                    "Error al conectar con la base de datos.",
                    e
            );
        }

        return conexion;
    }
}