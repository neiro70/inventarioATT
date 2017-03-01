package com.mx.att.inventario.service;

import java.util.HashMap;

public interface NotificarService {

	public void sendMail(HashMap<String,String> parameters);
}
