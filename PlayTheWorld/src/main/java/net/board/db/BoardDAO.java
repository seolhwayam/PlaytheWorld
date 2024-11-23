package net.board.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDAO {
	static Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	
	//DB 연결 생성자
	public BoardDAO() {
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
	
	
	
	
	
	// 글의 개수 구하기
		public int getListCount() {
			int x = 0;

			try {
				pstmt = con.prepareStatement("select count(*) from board");
				rs = pstmt.executeQuery();

				if (rs.next()) {
					x = rs.getInt(1);
				}
			} catch (Exception ex) {
				System.out.println("getListCount 에러: " + ex);
			} finally {
				if (rs != null)
					try {
						rs.close();
					} catch (SQLException ex) {
					}
				if (pstmt != null)
					try {
						pstmt.close();
					} catch (SQLException ex) {
					}
			}
			return x;
		}

		// ======================================
		// 글 목록보기
		public List getBoardList(int page, int limit) {
			String board_list_sql = "select * from " + "(select row_number() over() rnum,BOARD_NUM,BOARD_NAME,BOARD_SUBJECT,"
					+ "BOARD_CONTENT,BOARD_FILE,BOARD_RE_REF,BOARD_RE_LEV,"
					+ "BOARD_RE_SEQ,BOARD_READCOUNT,BOARD_DATE from "
					+ "(select * from board order by BOARD_RE_REF desc,BOARD_RE_SEQ asc) AS s)AS u " + "where rnum>=? and rnum<=?";		

			List list = new ArrayList();

			int startrow = (page - 1) * 10 + 1; // 읽기 시작할 row번호
			int endrow = startrow + limit - 1; // 읽기 마지막 row번호.
			try {
				pstmt = con.prepareStatement(board_list_sql);
				pstmt.setInt(1, startrow);
				pstmt.setInt(2, endrow);
				rs = pstmt.executeQuery();

				while (rs.next()) {
					BoardBean board = new BoardBean();
					board.setBOARD_NUM(rs.getInt("BOARD_NUM"));
					board.setBOARD_NAME(rs.getString("BOARD_NAME"));
					board.setBOARD_SUBJECT(rs.getString("BOARD_SUBJECT"));
					board.setBOARD_CONTENT(rs.getString("BOARD_CONTENT"));
					board.setBOARD_FILE(rs.getString("BOARD_FILE"));
					board.setBOARD_RE_REF(rs.getInt("BOARD_RE_REF"));
					board.setBOARD_RE_LEV(rs.getInt("BOARD_RE_LEV"));
					board.setBOARD_RE_SEQ(rs.getInt("BOARD_RE_SEQ"));
					board.setBOARD_READCOUNT(rs.getInt("BOARD_READCOUNT"));
					board.setBOARD_DATE(rs.getDate("BOARD_DATE"));
					list.add(board);
				}
				/*
				 * 1. getBoardList(int page, int limit):
					이 메서드는 현재 페이지 번호와 페이지 당 표시할 게시물 수를 매개변수로 받습니다.
					현재 페이지에 해당하는 게시물 목록을 가져와서 리스트에 담아 반환합니다.
					2. board_list_sql:
					SQL 쿼리를 저장하는 문자열 변수입니다. 이 쿼리는 데이터베이스에서 게시물 목록을 가져오기 위해 사용됩니다.
					쿼리는 ROW_NUMBER() 함수를 사용하여 각 게시물의 행 번호를 할당하고, 이를 사용하여 페이징 처리를 수행합니다.
					ORDER BY 구문을 사용하여 게시물의 순서를 정렬합니다. BOARD_RE_REF를 기준으로 내림차순으로 정렬하고, 그 다음에 BOARD_RE_SEQ를 오름차순으로 정렬합니다.
					3. startrow, endrow:
					페이징 처리를 위해 읽어야 하는 시작 행과 끝 행의 번호를 계산합니다.
					4. PreparedStatement:
					SQL 쿼리를 실행하기 위한 PreparedStatement 객체를 생성합니다.
					시작 행과 끝 행의 번호를 바인딩하여 SQL 쿼리를 실행합니다.
					5. ResultSet 반복문:
					SQL 쿼리를 실행한 결과인 ResultSet에서 각각의 행을 반복하여 가져옵니다.
					각 행에서 게시물 정보를 읽어와 BoardBean 객체에 설정한 후, 리스트에 추가합니다.
				 * 
				 * */

				return list;
			} catch (Exception ex) {
				System.out.println("getBoardList 에러 : " + ex);
			} finally {
				if (rs != null)
					try {
						rs.close();
					} catch (SQLException ex) {
					}
				if (pstmt != null)
					try {
						pstmt.close();
					} catch (SQLException ex) {
					}
			}
			return list;			
		}

			//글 등록
			public boolean boardInsert(BoardBean board){
				int num =0;
				String sql="";
				
				int result=0;
				
				try{
					// 게시글 번호 등록을 위한 게시글 번호 조회
					pstmt=con.prepareStatement("select max(board_num) from board");
					// 가장 최신 게시글 번호를 찾기
					rs = pstmt.executeQuery();
					
					if(rs.next())
						num =rs.getInt(1)+1; //최신 게시글 번호가 있다면 최신게시글 번호 + 1
					else
						num=1; //최신 게시글 번호가 없다면 1
					
					sql="insert into board (BOARD_NUM,BOARD_NAME,BOARD_PASS,BOARD_SUBJECT,";
					sql+="BOARD_CONTENT, BOARD_FILE, BOARD_RE_REF,"+
						"BOARD_RE_LEV,BOARD_RE_SEQ,BOARD_READCOUNT,"+
						"BOARD_DATE) values(?,?,?,?,?,?,?,?,?,?,now())";
					
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, num); //게시글 번호
					pstmt.setString(2, board.getBOARD_NAME()); //작성자 이름
					pstmt.setString(3, board.getBOARD_PASS()); //글 비밀번호
					pstmt.setString(4, board.getBOARD_SUBJECT()); // 글 제목
					pstmt.setString(5, board.getBOARD_CONTENT()); // 글 내용
					pstmt.setString(6, board.getBOARD_FILE()); // 파일 
					pstmt.setInt(7, num); // 답글 그룹 번호
					pstmt.setInt(8, 0); // 답글 레벨(대댓글)
					pstmt.setInt(9, 0); // 답글 순서(그냥 댓글)
					pstmt.setInt(10, 0); // 조회수
					
					result=pstmt.executeUpdate();
					if(result==0)return false;
					
					return true;
				}catch(Exception ex){
					System.out.println("boardInsert 에러 : "+ex);
				}finally{
					if(rs!=null) try{rs.close();}catch(SQLException ex){}
					if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
				}
				return false;
			}
			
			//글 수정
			public boolean boardModify(BoardBean modifyboard) throws Exception{
				String sql="update board set BOARD_SUBJECT=?,BOARD_CONTENT=? where BOARD_NUM=?";
				
				try{
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, modifyboard.getBOARD_SUBJECT());
					pstmt.setString(2, modifyboard.getBOARD_CONTENT());
					pstmt.setInt(3, modifyboard.getBOARD_NUM());
					pstmt.executeUpdate();
					return true;
				}catch(Exception ex){
					System.out.println("boardModify 에러 : " + ex);
				}finally{
					if(rs!=null)try{rs.close();}catch(SQLException ex){}
					if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
					}
				return false;
			}
			
			//글쓴이인지 확인.
			public boolean isBoardWriter(int num, String pass) {
				String board_sql="select * from board where BOARD_NUM=?";
				
				try{
					pstmt=con.prepareStatement(board_sql);
					pstmt.setInt(1, num);
					rs=pstmt.executeQuery();
					rs.next();
					
					if(pass.equals(rs.getString("BOARD_PASS"))){
						return true;
					}
				}catch(SQLException ex){
					System.out.println("isBoardWriter 에러 : "+ex);
				}
				return false;
			}
			
			
			
			// 글 삭제
			public boolean boardDelete(int num) {
				
				String board_delete_sql="delete from board where BOARD_num=?";
				
				int result=0;
				
				try{
					pstmt=con.prepareStatement(board_delete_sql);
					pstmt.setInt(1, num);
					result=pstmt.executeUpdate();
					if(result==0)return false;
					
					return true;
				}catch(Exception ex){
					System.out.println("boardDelete 에러 : "+ex);
				}finally{
					try{
						if(pstmt!=null)pstmt.close();
					}catch(Exception ex) {}
				}
				
				return false;
			}
			//글 조회수 증가
			public void setReadCountUpdate(int num) throws Exception{
				String sql="update board set BOARD_READCOUNT = "+
					"BOARD_READCOUNT+1 where BOARD_NUM = "+num;
				
				try{
					pstmt=con.prepareStatement(sql);
					pstmt.executeUpdate();
				}catch(SQLException ex){
					System.out.println("setReadCountUpdate 에러 : "+ex);
				}
			}
			//해당 게시글 번호의 정보 가져오기
			public BoardBean getDetail(int num) throws Exception{
				BoardBean board = null;
				try{
					pstmt = con.prepareStatement(
							//게시글 번호에 해당하는 값 찾기
							"select * from board where BOARD_NUM = ?");
					
					pstmt.setInt(1, num);
					
					rs= pstmt.executeQuery();
					
					if(rs.next()){
						board = new BoardBean();
						board.setBOARD_NUM(rs.getInt("BOARD_NUM"));
						board.setBOARD_NAME(rs.getString("BOARD_NAME"));
						board.setBOARD_SUBJECT(rs.getString("BOARD_SUBJECT"));
						board.setBOARD_CONTENT(rs.getString("BOARD_CONTENT"));
						board.setBOARD_FILE(rs.getString("BOARD_FILE"));
						board.setBOARD_RE_REF(rs.getInt("BOARD_RE_REF"));
						board.setBOARD_RE_LEV(rs.getInt("BOARD_RE_LEV"));
						board.setBOARD_RE_SEQ(rs.getInt("BOARD_RE_SEQ"));
						board.setBOARD_READCOUNT(rs.getInt("BOARD_READCOUNT"));
						board.setBOARD_DATE(rs.getDate("BOARD_DATE"));
					}
					return board;
				}catch(Exception ex){
					System.out.println("getDetail 에러 : " + ex);
				}finally{
					if(rs!=null)try{rs.close();}catch(SQLException ex){}
					if(pstmt !=null)try{pstmt.close();}catch(SQLException ex){}
				}
				return null;
			}

			//글 답변
			public int boardReply(BoardBean board){
				String board_max_sql="select max(board_num) from board";
				String sql="";
				int num=0;
				int result=0;
				
				int re_ref=board.getBOARD_RE_REF();
				int re_lev=board.getBOARD_RE_LEV();
				int re_seq=board.getBOARD_RE_SEQ();
				
				try{
					pstmt=con.prepareStatement(board_max_sql);
					rs = pstmt.executeQuery();
					if(rs.next())num =rs.getInt(1)+1;
					else num=1;
					
					sql="update board set BOARD_RE_SEQ=BOARD_RE_SEQ+1 where BOARD_RE_REF=? ";
					sql+="and BOARD_RE_SEQ>?";
					
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1,re_ref);
					pstmt.setInt(2,re_seq);
					result=pstmt.executeUpdate();
					
					re_seq = re_seq + 1;
					re_lev = re_lev+1;
					
					sql="insert into board (BOARD_NUM,BOARD_NAME,BOARD_PASS,BOARD_SUBJECT,";
					sql+="BOARD_CONTENT, BOARD_FILE,BOARD_RE_REF,BOARD_RE_LEV,BOARD_RE_SEQ,";
					sql+="BOARD_READCOUNT,BOARD_DATE) values(?,?,?,?,?,?,?,?,?,?,sysdate())";
					
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, num);
					pstmt.setString(2, board.getBOARD_NAME());
					pstmt.setString(3, board.getBOARD_PASS());
					pstmt.setString(4, board.getBOARD_SUBJECT());
					pstmt.setString(5, board.getBOARD_CONTENT());
					pstmt.setString(6, ""); //답장에는 파일을 업로드하지 않음.
					pstmt.setInt(7, re_ref);
					pstmt.setInt(8, re_lev);
					pstmt.setInt(9, re_seq);
					pstmt.setInt(10, 0);
					pstmt.executeUpdate();
					return num;
				}catch(SQLException ex){
					System.out.println("boardReply 에러 : "+ex);
				}finally{
					if(rs!=null)try{rs.close();}catch(SQLException ex){}
					if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
				}
				return 0;
			}
			
			

	}