package com.services;

import java.util.List;
import java.util.Map;

public interface BaseServices
{
	void setMapDto(Map<String, Object> dto);

	default Map<String, String> findById() throws Exception
	{
		return null;
	}

	default List<Map<String, String>> query() throws Exception
	{
		return null;
	}
	
	default String check() throws Exception
	{
		return null;
	}
}
