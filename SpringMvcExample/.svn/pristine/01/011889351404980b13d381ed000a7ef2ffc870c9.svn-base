package com.web.controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

public class CoffeeDAOImpl implements CoffeeDAO
{
	private DataSource dataSource;
	
	//establish datasource being used
	public void setDataSource(DataSource dataSource)
	{
		this.dataSource = dataSource;
	}
	
	//insert
	public void insertCoffee(Coffee coffee) {
		
		String sql = "INSERT INTO COFFEE " +
			"(NAME, QUANLITY) VALUES (?, ?)";
		Connection conn = null;
		
		try 
		{
			conn = dataSource.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1,coffee.getName());
			ps.setInt(2, coffee.getQuanlity());
			ps.executeUpdate();
			ps.close();
		}
		catch(SQLException e)
		{
			throw new RuntimeException(e);
		}
		finally
		{
			if(conn != null)
			{
				try
				{
					conn.close();
				}
				catch(SQLException e)
				{
					
				}
			}
		}
		
	}
	
	//select all
	public ArrayList<Coffee> getAllCoffee() {
		
		String sql = "SELECT * FROM COFFEE";
		
		Connection conn = null;
		
		try 
		{
			conn = dataSource.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			ArrayList<Coffee> CoffeeBag =  new ArrayList<Coffee>();
			
			while(rs.next())
			{
				Coffee coffee = new Coffee(rs.getString("Name"),rs.getInt("Quanlity"));
				CoffeeBag.add(coffee);
			}
			
			rs.close();
			ps.close();
			
			return CoffeeBag;
		}
		catch(SQLException e)
		{
			throw new RuntimeException(e);
		}
		finally
		{
			if(conn != null)
			{
				try
				{
					conn.close();
				}
				catch(SQLException e)
				{
					
				}
			}
		}
	}
	
	//select by primary key
	public Coffee getCoffeeByID(int Coffee_ID) {

		String sql = "SELECT * FROM COFFEE where Coffee_ID = ?";
		
		
		Connection conn = null;
		
		try 
		{
			conn = dataSource.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1,Coffee_ID);
			
			Coffee coffee = null;
			ResultSet rs = ps.executeQuery();
			
			if(rs.next())
			{
				coffee = new Coffee(rs.getString("Name"),rs.getInt("Quanlity"));
			}
			
			rs.close();
			ps.close();
			
			return coffee;
		}
		catch(SQLException e)
		{
			throw new RuntimeException(e);
		}
		finally
		{
			if(conn != null)
			{
				try
				{
					conn.close();
				}
				catch(SQLException e)
				{
					
				}
			}
		}
	}
	
	//update
	public void updateCoffee(int Coffee_ID, Coffee coffee) {

		String sql = "UPDATE COFFEE SET Name = ? , Quanlity = ? where Coffee_ID = ?";
		
		Connection conn = null;
		
		try 
		{
			conn = dataSource.getConnection();
			
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1,coffee.getName());
			ps.setInt(2,coffee.getQuanlity());
			ps.setInt(3,Coffee_ID);
			ps.executeUpdate();
			
			ps.close();
		}
		catch(SQLException e)
		{
			throw new RuntimeException(e);
		}
		finally
		{
			if(conn != null)
			{
				try
				{
					conn.close();
				}
				catch(SQLException e)
				{
					
				}
			}
		}
	}

	//delete
	public void deleteCoffeeByID (int Coffee_ID) {

		String sql = "Delete from COFFEE where Coffee_ID = ?";
		
		Connection conn = null;
		
		try 
		{
			conn = dataSource.getConnection();
			
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1,Coffee_ID);
			ps.executeUpdate();
			
			ps.close();
		}
		catch(SQLException e)
		{
			throw new RuntimeException(e);
		}
		finally
		{
			if(conn != null)
			{
				try
				{
					conn.close();
				}
				catch(SQLException e)
				{
					
				}
			}
		}
	}
	
	public void deleteCoffeeByNameAndQuanlity (String Name, int Quanlity) {

		String sql = "Delete from COFFEE where Name = ? and Quanlity = ?";
		
		Connection conn = null;
		
		try 
		{
			conn = dataSource.getConnection();
			
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, Name);
			ps.setInt(2,Quanlity);
			ps.executeUpdate();
			
			ps.close();
		}
		catch(SQLException e)
		{
			throw new RuntimeException(e);
		}
		finally
		{
			if(conn != null)
			{
				try
				{
					conn.close();
				}
				catch(SQLException e)
				{
					
				}
			}
		}
	}

	public ArrayList<Coffee> getCoffeeByName(String Name) {
		String sql = "SELECT * FROM COFFEE where name= ?";
		
		Connection conn = null;
		
		try 
		{
			conn = dataSource.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1,Name);
			ResultSet rs = ps.executeQuery();
			
			ArrayList<Coffee> CoffeeBag =  new ArrayList<Coffee>();
			
			while(rs.next())
			{
				Coffee coffee = new Coffee(rs.getString("Name"),rs.getInt("Quanlity"));
				CoffeeBag.add(coffee);
			}
			
			rs.close();
			ps.close();
			
			return CoffeeBag;
		}
		catch(SQLException e)
		{
			throw new RuntimeException(e);
		}
		finally
		{
			if(conn != null)
			{
				try
				{
					conn.close();
				}
				catch(SQLException e)
				{
					
				}
			}
		}
	}

	public ArrayList<Coffee> getCoffeeByQuanlity(int Quanlity) {
		String sql = "SELECT * FROM COFFEE where quanlity = ?";
		
		Connection conn = null;
		
		try 
		{
			conn = dataSource.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1,Quanlity);
			ResultSet rs = ps.executeQuery();
			
			ArrayList<Coffee> CoffeeBag =  new ArrayList<Coffee>();
			
			while(rs.next())
			{
				Coffee coffee = new Coffee(rs.getString("Name"),rs.getInt("Quanlity"));
				CoffeeBag.add(coffee);
			}
			
			rs.close();
			ps.close();
			
			return CoffeeBag;
		}
		catch(SQLException e)
		{
			throw new RuntimeException(e);
		}
		finally
		{
			if(conn != null)
			{
				try
				{
					conn.close();
				}
				catch(SQLException e)
				{
					
				}
			}
		}
	}

	public ArrayList<Coffee> getCoffeeByNameAndQuanlity(String Name,
			int Quanlity) {
		
		String sql = "SELECT * FROM COFFEE where name = ? and quanlity= ?";
		
		Connection conn = null;
		
		try 
		{
			conn = dataSource.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1,Name);
			ps.setInt(2,Quanlity);
			ResultSet rs = ps.executeQuery();
			
			ArrayList<Coffee> CoffeeBag =  new ArrayList<Coffee>();
			
			while(rs.next())
			{
				Coffee coffee = new Coffee(rs.getString("Name"),rs.getInt("Quanlity"));
				CoffeeBag.add(coffee);
			}
			
			rs.close();
			ps.close();
			
			return CoffeeBag;
		}
		catch(SQLException e)
		{
			throw new RuntimeException(e);
		}
		finally
		{
			if(conn != null)
			{
				try
				{
					conn.close();
				}
				catch(SQLException e)
				{
					
				}
			}
		}
		
	}

	public void addCoffeeQuanlity(Coffee coffee) {

		String sql = "UPDATE COFFEE SET Quanlity = Quanlity + ? where Name = ?";
		
		Connection conn = null;
		
		try 
		{
			conn = dataSource.getConnection();
			
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1,coffee.getQuanlity());
			ps.setString(2,coffee.getName());
			ps.executeUpdate();
			ps.close();
		}
		catch(SQLException e)
		{
			throw new RuntimeException(e);
		}
		finally
		{
			if(conn != null)
			{
				try
				{
					conn.close();
				}
				catch(SQLException e)
				{
					
				}
			}
		}
	}
	public void subtractCoffeeQuanlity(Coffee coffee) {

		String sql = "UPDATE COFFEE SET Quanlity = Quanlity - ? where Name = ?";
		
		Connection conn = null;
		
		try 
		{
			conn = dataSource.getConnection();
			
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1,coffee.getQuanlity());
			ps.setString(2,coffee.getName());
			ps.executeUpdate();
			ps.close();
		}
		catch(SQLException e)
		{
			throw new RuntimeException(e);
		}
		finally
		{
			if(conn != null)
			{
				try
				{
					conn.close();
				}
				catch(SQLException e)
				{
					
				}
			}
		}
	}
}
