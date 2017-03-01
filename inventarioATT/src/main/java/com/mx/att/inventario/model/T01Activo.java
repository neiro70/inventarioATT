package com.mx.att.inventario.model;

import java.io.Serializable;
import java.sql.Timestamp;

public class T01Activo implements Serializable {

	private Integer id;
	private String orden;
	private String marca;
	private String modelo;
	private Integer estatus;
	private Timestamp fhCreacion;
	private String proveedor;
	private String serialATT;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getOrden() {
		return orden;
	}
	public void setOrden(String orden) {
		this.orden = orden;
	}
	public String getMarca() {
		return marca;
	}
	public void setMarca(String marca) {
		this.marca = marca;
	}
	public String getModelo() {
		return modelo;
	}
	public void setModelo(String modelo) {
		this.modelo = modelo;
	}
	public Integer getEstatus() {
		return estatus;
	}
	public void setEstatus(Integer estatus) {
		this.estatus = estatus;
	}
	public Timestamp getFhCreacion() {
		return fhCreacion;
	}
	public void setFhCreacion(Timestamp fhCreacion) {
		this.fhCreacion = fhCreacion;
	}
	public String getProveedor() {
		return proveedor;
	}
	public void setProveedor(String proveedor) {
		this.proveedor = proveedor;
	}
	public String getSerialATT() {
		return serialATT;
	}
	public void setSerialATT(String serialATT) {
		this.serialATT = serialATT;
	}
	
	
	
}
