package com.web.support;

import java.util.Map;

import javax.servlet.http.HttpSession;

public interface BaseController 
{
	//Filling DTO for Business Controller
	
	void setMapDto(Map<String,Object> dto);
	
	String execute()throws Exception;
    
	Map<String,Object> getAttribute();
    
	Map<String, Object> getResponseAttribute();
    
	default Map<String,Object> getSession_attribute()
	{
		return null;
	}
}
