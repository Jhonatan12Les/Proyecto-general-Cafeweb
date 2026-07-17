package com.mycompany.cafe.model;

public class ItemCarrito {

    private String nombre;
    private double precio;
    private String imagen;
    private int cantidad;

    public ItemCarrito() {
    }

    public ItemCarrito(String nombre, double precio, String imagen) {
        this.nombre = nombre;
        this.precio = precio;
        this.imagen = imagen;
        this.cantidad = 1;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public String getImagen() {
        return imagen;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public double getSubtotal() {
        return precio * cantidad;
    }
}