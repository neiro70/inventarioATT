package com.mx.att.inventario.dao.imp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.sql.DataSource;

import com.mx.att.inventario.dao.ActivoDAO;
import com.mx.att.inventario.model.T01Activo;

public class ActivoDAOImp implements ActivoDAO {
	private DataSource dataSource;

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}
	
	public void insert(T01Activo activo){

		String sql = "INSERT INTO T01Activo " +
				"(marca, modelo, orden,proveedor,serialATT,FhCreacion,estatus) VALUES (?, ?, ?,?,?,?,?)";
		Connection conn = null;

		try {
			int i=1;
			conn = dataSource.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setString(i++, activo.getMarca());
			ps.setString(i++, activo.getModelo());
			ps.setString(i++, activo.getOrden());
			ps.setString(i++, activo.getProveedor());
			ps.setString(i++, activo.getSerialATT());
			ps.setTimestamp(i++, activo.getFhCreacion());
			ps.setInt(i++, activo.getEstatus());

			ps.executeUpdate();
			ps.close();

		} catch (SQLException e) {
			throw new RuntimeException(e);

		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {}
			}
		}
	}
}
