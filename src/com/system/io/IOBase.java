package com.system.io;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.lang.ThreadLocal;

public class IOBase 
{
	private static final ThreadLocal<BufferedReader> inputthread=new ThreadLocal<>();
	private static final ThreadLocal<BufferedWriter> outputthread=new ThreadLocal<>();
	//创建文件
	public static void createFile(String path,String filename) throws IOException
	{
        File file=new File(path+"/"+filename);
        if(!file.exists())
            file.createNewFile();
    }
	
	//文件是否存在
	public static boolean fileIsExists(String filePath) throws Exception
	{
		File file=new File(filePath);
		return file.exists();
	}
	
	
    //创建输入流
	public static void setIn(String filePath) throws Exception
    {
    	BufferedReader in = inputthread.get();
    	if(in == null)
    	{
    		in = new BufferedReader(new InputStreamReader(new FileInputStream(filePath),"GBK"));
    		inputthread.set(in);
    	}
    }
	
	//获取输入流
    public static BufferedReader getIn() throws Exception
    {
    	return inputthread.get();
    }
    
    //创建输出流
    public static void setOut(String filePath) throws Exception
    {
    	BufferedWriter out = outputthread.get();
    	if(out == null)
    	{
    		out = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(filePath),"GBK"));
    		outputthread.set(out);
    	}
    }
    
    public static void setOut(String filePath, boolean tag) throws Exception
    {
    	BufferedWriter out = outputthread.get();
    	if(out == null)
    	{
    		out = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(filePath, tag),"GBK"));
    		outputthread.set(out);
    	}
    }

    //获取输出流
    public static BufferedWriter getOut() throws Exception
    {
    	return outputthread.get();
    }
    
    //读入
    public static String readLine() throws Exception
    {
    	return getIn().readLine();
    }
    
    //写入
    public static void writeLine(String str) throws Exception
    {
    	getOut().write(str);
        getOut().newLine();
    }
    
    //获取一个文本文件的所有信息
    public static String getAllString(String filePath) throws Exception
    {
    	setIn(filePath);
        String str = readLine();
        StringBuilder result = new StringBuilder();
        while (str != null) 
        {
            result.append(str + "\n");
        	str = readLine();
        }
        closeIn();
        return result.toString();
    }

    //向一个文本文件输入特定信息
    public static void setString(String filePath, Object str) throws Exception
    {
    	String[] strs = null;
    	if(str instanceof String[])
    	{
    		strs = (String[])str;
    	}
    	else if(str instanceof String)
    	{
    		strs = ((String) str).split("\n");
    	}
		setOut(filePath);
		for(String line : strs)
		{
			if(line == null || line.equals(""))
			{
				continue;
			}
			writeLine(line);
		}
		flush();
		closeOut();
    }
    
    public static void setString(String filePath, Object str, boolean tag) throws Exception
    {
    	String[] strs = null;
    	if(str instanceof String[])
    	{
    		strs = (String[])str;
    	}
    	else if(str instanceof String)
    	{
    		strs = ((String) str).split("\n");
    	}
		setOut(filePath, tag);
		for(String line : strs)
		{
			if(line == null || line.equals(""))
			{
				continue;
			}
			writeLine(line);
		}
		flush();
		closeOut();
    }
    
    //刷新缓存区
    private static void flush() throws Exception
    {
    	getOut().flush();
    }
	
	//关闭输入流
	public static void closeIn()
	{
		
		try {
			BufferedReader in = inputthread.get();
			if(in != null)
			{
				inputthread.remove();
				in.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	//关闭输出流
	public static void closeOut()
	{
		try {
			BufferedWriter out = outputthread.get();
			if(out != null)
			{
				outputthread.remove();
				out.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
