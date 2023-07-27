package com.issue.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.issue.vo.EzFileVO;

@Repository
public class EzFileDAO {

	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	public EzFileDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	// 파일 mapper
	private static class ezFileMapper implements RowMapper<EzFileVO> {
        @Override
        public EzFileVO mapRow(ResultSet rs, int rowNum) throws SQLException {
        	EzFileVO ezFileVO = new EzFileVO();
        	ezFileVO.setFileno(rs.getInt("fileno"));
        	ezFileVO.setNo(rs.getInt("no"));
        	ezFileVO.setOriginalname(rs.getString("originalname"));
        	ezFileVO.setSavename(rs.getString("savename"));
        	ezFileVO.setFilesize(rs.getInt("fileSize"));
            return ezFileVO;
        }
    }
	
	// 다음 게시물 번호 조회
	public int getDynamicIssueNo() {
//		String nextvalSql = "SELECT ISSUE_SEQ.NEXTVAL FROM dual";
//	    jdbcTemplate.queryForObject(nextvalSql, Integer.class); // NEXTVAL 호출
	    String selectSql = "SELECT ISSUE_SEQ.CURRVAL FROM dual";
	    return jdbcTemplate.queryForObject(selectSql, Integer.class);
	}
		
	// 파일 업로드
	public void uploadFile(EzFileVO ezFileVO, int no) {
        String SQL = "INSERT INTO EZ_FILE ("
        		+ "					FILENO"
        		+ "					, NO"
        		+ "					, ORIGINALNAME"
        		+ "					, SAVENAME"
        		+ "					, FILESIZE )" 
                + "	  VALUES (EZ_FILE_NO_SEQ.NEXTVAL, ?, ?, ?, ?)";
        System.out.println(SQL);
        jdbcTemplate.update(
        		SQL
        		, no
        		, ezFileVO.getOriginalname()
        		, ezFileVO.getSavename()
        		, ezFileVO.getFilesize());
    }
	
	// 파일 갯수
	public int issueFileListCnt(int no) {
		String SQL = "SELECT COUNT(NO) FROM EZ_FILE WHERE NO = " + no + " AND FILENO > 0";
		int cnt = jdbcTemplate.queryForObject(SQL, Integer.class);
		System.out.println(SQL);
		return cnt;
	}
	
	// 파일 목록
	public List<EzFileVO> getFileList(int no) {
		String SQL = "SELECT"
				+ "			FILENO"
				+ "			, NO"
				+ "			, ORIGINALNAME"
				+ "			, SAVENAME"
				+ "			, FILESIZE"
				+ "	  FROM"
				+ "			EZ_FILE"
				+ "	  WHERE"
				+ "			NO = ?";
		List<EzFileVO> fileList = jdbcTemplate.query(SQL, new Object[]{no}, new ezFileMapper());
		return fileList;
	}
	
	// 파일 삭제
	public void deleteFile(int no) {
		String SQL = "DELETE FROM EZ_FILE WHERE NO = ?";
		jdbcTemplate.update(SQL, no);
	}
}
