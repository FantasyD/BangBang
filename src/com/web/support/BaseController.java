package com.web.support;

import java.util.Map;

public interface BaseController 
{
	//Filling DTO for Business Controller
	
	void setMapDto(Map<String,Object> dto);
	
    String execute()throws Exception;
    
    Map<String,Object> getAttribute();
}
