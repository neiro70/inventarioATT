package com.mx.att.inventario.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mx.att.inventario.dao.ActivoDAO;
import com.mx.att.inventario.model.T01Activo;

@Service 
public class ArctivoServiceImp implements ActivoService{

	@Autowired
	private ActivoDAO activoDAO;

	public void insert(T01Activo activo) throws Exception {
		 activoDAO.insert(activo);
		
	}
	
	
	
	
}
