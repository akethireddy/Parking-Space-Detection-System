package com.dao;

public interface PaymentDaoI 
{
	public String getLicense(String user);
	public int Payment(String user,String license,String holder,String card,String cvv);
}
