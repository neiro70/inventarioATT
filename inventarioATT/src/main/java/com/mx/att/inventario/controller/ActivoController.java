package com.mx.att.inventario.controller;

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.Writer;
import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.FileItemFactory;
import org.apache.tomcat.util.http.fileupload.RequestContext;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import org.apache.tomcat.util.http.fileupload.servlet.ServletRequestContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mx.att.inventario.model.T01Activo;
import com.mx.att.inventario.service.ActivoService;
import com.mx.att.inventario.service.NotificarService;

import jxl.Cell;
import jxl.Sheet;
import jxl.Workbook;
import jxl.read.biff.BiffException;

@RequestMapping("/activo/*")
@Controller
public class ActivoController {
	
	@Autowired 
	private ActivoService activoService;
	@Autowired 
	private NotificarService notificarService;
	
	@RequestMapping(value = "/index.htm", method = RequestMethod.GET)
    public String init() {
		return "activo/consultar";
    }

	@RequestMapping("consultar.htm")
    public String consultar(Model model) {
		return "activo/consultar";
    }
	
	@RequestMapping("alta.htm")
    public String alta(Model model) {
		return "activo/alta";
    }
	
	
	@RequestMapping("upload.htm")
    public void upload(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException  {
		PrintWriter out = response.getWriter();
		
		
	     boolean isMultipart = ServletFileUpload.isMultipartContent(request);

	        // process only if it is multipart content
	        if (isMultipart) {
	                // Create a factory for disk-based file items
	                FileItemFactory factory = new DiskFileItemFactory();

	                // Create a new file upload handler
	                ServletFileUpload upload = new ServletFileUpload(factory);
	                try {
	                // Parse the request
	                List<FileItem> multiparts = upload.parseRequest(new ServletRequestContext(request));

	                for (FileItem item : multiparts) {
	                if (!item.isFormField()) {
	                String name = new File(item.getName()).getName();
	                item.write(new File("/Users/neiro70/Documents/workspace-sts-3.8.3.RELEASE/inventarioATT/src/main/webapp/activo/"+name));
	              
	                
	        		//String filename=request.getParameter("idFile");
	        		Workbook workbook = null;
	        		try {
	        		workbook = Workbook.getWorkbook(new File("/Users/neiro70/Documents/workspace-sts-3.8.3.RELEASE/inventarioATT/src/main/webapp/activo/" + name));
	        		} catch (BiffException e) {
	        		// TODO Auto-generated catch block
	        		e.printStackTrace();
	        		}

	        		Sheet sheet = workbook.getSheet(0);
	        		out.println("Numero de registros:"+sheet.getRows());


	        		
	        		for(int j=0;j<sheet.getRows();j++){
		        		T01Activo activo=new T01Activo();
		        		activo.setEstatus(1);
		        		activo.setFhCreacion(new Timestamp(new Date().getTime()));
	        			
			        		for(int i=0;i<sheet.getColumns();i++)
			        		{
					        		Cell colcell=sheet.getCell(i,0); 
					        		String column=colcell.getContents();
					        	///	out.println(column);
		
					        		if(i == 1){//marca
					        			activo.setMarca(column);
					        		}
					        		
					        		if(i==2){
					        			activo.setModelo(column);
					        		}
					        		if(i==3){
					        			activo.setOrden(column);
					        		}
					        		if(i==4){
					        			activo.setProveedor(column);
					        		}
					        		if(i==0){
					        			activo.setSerialATT(column);
					        		}
					        		
					        }
	        		
			        		activoService.insert(activo);
	        		}
	        		
	        		HashMap<String,String> parameters=new HashMap<String,String>();
	        		parameters.put("from", "jorge.luis.martinez.alfonso@ideasystems.esy.es");
	        		parameters.put("to", "neiro70@gmail.com");
	        		parameters.put("subject", "Carga de equipos");
	        		parameters.put("msg", "Numero de registros:"+sheet.getRows());
	        		notificarService.sendMail(parameters);
	                
	                }
	                }
	                } 
	                catch (Exception e) 
	                {
	                  e.printStackTrace();
	                }
	        }

		

		
		
    }
	
	
}
