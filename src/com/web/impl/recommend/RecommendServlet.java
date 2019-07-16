package com.web.impl.recommend;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import org.ansj.domain.Term;
import org.ansj.splitWord.analysis.ToAnalysis;

import com.services.impl.Ac01ServicesImpl;

public class RecommendServlet
{
	
	public static void main(String[] args)
	{
		Map<String,List<String>> data=RecommendServlet.getData();
		List<List<String>> docs=new ArrayList<>(data.values());
		Set<Entry<String,List<String>>> set=data.entrySet();
		//计算每个文档中每个词语的词频
		for(Entry<String,List<String>> doc: set)
		{
			Map<String,Double> map=new HashMap<>();
			for(String item:doc.getValue())
			{
				double value=RecommendServlet.tfIdf(doc.getValue(),docs, item);
				map.put(item, value);
			}
			List<Entry<String,Double>> keyWordList=RecommendServlet.getKeyWord(map);
			
		}
	}
	
	/**
	 * 获得每个文档的关键字，最多五个
	 */
	public static List<Entry<String,Double>> getKeyWord(Map<String,Double> map)
	{
		Comparator<Map.Entry<String, Double>> valueComparator = new Comparator<Map.Entry<String, Double>>() {
	                @Override
	                public int compare(Entry<String, Double> o1, Entry<String, Double> o2) {
	                    return o1.getValue().compareTo(o2.getValue());
	                }
	            };
		List<Entry<String, Double>> list=new ArrayList<Entry<String,Double>>(map.entrySet());
		Collections.sort(list, valueComparator);
		Collections.reverse(list);
		if(list.size()>5)
		{
			list=list.subList(0, 4);
		}
		return list;
	}
	
	/**
	 * 获取原始数据
	 */
	public static Map<String,List<String>> getData()
	{
		Ac01ServicesImpl ac01=new Ac01ServicesImpl();
		Map<String,List<String>> map=new HashMap<>();
		try
		{
			List<Map<String,String>> firstData=ac01.queryForList();
			for(Map<String,String> seData:firstData)
			{
				String value=seData.get("aac104");
				List<Term> strs= ToAnalysis.parse(value).getTerms();
				List<String> result=new ArrayList<>();
				for(Term s:strs)
				{
					result.add(s.getName());
				}
				map.put(seData.get("aac101"), result);
			}

		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		return map;
	}
	
	/**
	 * 词频统计
	 */
	public static double  tf(List<String> doc,String item) {
		double termFrequency = 0;
		for(String str:doc) {
			if(str.equalsIgnoreCase(item)) {
			termFrequency++;
			}
		}
		return termFrequency;
	}

	/***
	 * 文档频率统计
	 */
	public static int df(List<List<String>> docs,String item) {
		int n =0;
		if(item != null  && item != "") {
			for(List<String> doc:docs) {
				for(String word:doc) {
					if(word.equalsIgnoreCase(item)) {
						n++;
						break;
					}
				}
			}
			
		}else {
			System.out.println("item 不能为null或者空串");
		}
		
		return n;
	}

	/**
	 * 逆文档频率
	 */
	public static double idf(List<List<String>> docs,String item) {
		return Math.log(docs.size()/(double) df(docs,item)+1);
	}

	/**
	 * 词频
	 */
	public static double tfIdf(List<String> doc,List<List<String>> docs,String item) {
		return tf(doc,item)*idf(docs,item);
	}

	
	
}
