package net.admin.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class AdminDAO {
	static Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	
	//DB 연결 생성자
	public AdminDAO() {
		try{
			Context init = new InitialContext();
	  		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/MysqlDB");
	  		if(con==null) {
	  			con = ds.getConnection();
	  		}
	  		
		}catch(Exception ex){
			System.out.println("DB 연결 실패 : " + ex);
			return;
		}
	}
	//관리자 화면 : 유저 id 불러오기
	public List<String> adminList() {
		// TODO Auto-generated method stub
		 	String sql = "";
		    try {
		        sql = "SELECT user_id FROM user ";
		        pstmt = con.prepareStatement(sql);
		        rs = pstmt.executeQuery();
		        AdminBean adminBean = new AdminBean();
		        while (rs.next()) {
		        	adminBean.setUserList(rs.getString("user_id"));
		        }
		        return adminBean.getUserList();
		    } catch (Exception ex) {
		        System.out.println("유저 목록 불러오기 에러");
		        ex.printStackTrace();
		    } finally {
		        // 리소스 정리
		        try { if (rs != null) rs.close(); } catch (SQLException ex) {}
		        try { if (pstmt != null) pstmt.close(); } catch (SQLException ex) {}
		    }
			return null;
		
	}
	public AdminBean adminDetail(String id) {
		// TODO Auto-generated method stub
		System.out.println("아이디 : "+id);
		String sql = "";
	    try {
	        sql = "SELECT * FROM user where user_id =?";
	        pstmt = con.prepareStatement(sql);
	        pstmt.setString(1, id);
	        rs = pstmt.executeQuery();
	        AdminBean adminBean = new AdminBean();
	        while (rs.next()) {
	        	adminBean.setJumin_number(rs.getString("jumin_number"));
	        	adminBean.setUser_id(rs.getString("user_id"));
	        	adminBean.setPassword(rs.getString("password"));
	        	adminBean.setEmail(rs.getString("email"));
	        	adminBean.setName(rs.getString("name"));
	        	adminBean.setHobby(rs.getString("hobby"));
	        	adminBean.setIntroduction(rs.getString("introduction"));
	        }
	        return adminBean;
	        
	    } catch (Exception ex) {
	        System.out.println("유저 정보 불러오기 에러");
	        ex.printStackTrace();
	    } finally {
	        // 리소스 정리
	        try { if (rs != null) rs.close(); } catch (SQLException ex) {}
	        try { if (pstmt != null) pstmt.close(); } catch (SQLException ex) {}
	    }
		return null;

		
	}
	public void adminDelete(String id) {
	    // TODO: 올바른 연결(con) 객체가 이 메서드에 전달되었다고 가정합니다.
	    String deleteUserDataQuery = "DELETE FROM user WHERE user_id = ?";
	    String deleteCartDataQuery = "DELETE FROM cart WHERE userId = ?";

	    try {
	        // 사용자 정보 삭제
	        try (PreparedStatement deleteUserDataStatement = con.prepareStatement(deleteUserDataQuery)) {
	            deleteUserDataStatement.setString(1, id);
	            deleteUserDataStatement.executeUpdate();
	        }

	        // 장바구니 정보 삭제
	        try (PreparedStatement deleteCartDataStatement = con.prepareStatement(deleteCartDataQuery)) {
	            deleteCartDataStatement.setString(1, id);
	            deleteCartDataStatement.executeUpdate();
	        }

	    } catch (SQLException ex) {
	        System.out.println("유저 삭제 에러");
	        ex.printStackTrace();
	    } finally {
	        // 리소스 정리
	        try { if (con != null) con.close(); } catch (SQLException ex) {}
	    }
	}


	


	}