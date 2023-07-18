테이블 접속 http://localhost:8584/EASYFACTORY/feb/feb1

package config;

필요하면 추가
    // Feb mapper
 	private static class FebMapper implements RowMapper<FebVO> {
         @Override
         public FebVO mapRow(ResultSet rs, int rowNum) throws SQLException {
        	 FebVO febVO = new FebVO();
        	 febVO.setOpratio(rs.getDouble("opratio"));
        	 febVO.setTemp(rs.getInt("temp"));
        	 febVO.setTr(rs.getInt("tr"));
        	 febVO.setFal(rs.getInt("fal"));
        	 febVO.setStock(rs.getInt("stock"));
        	 febVO.setCosts(rs.getInt("costs"));
        	 febVO.setUsingratio(rs.getDouble("usingratio"));
        	 febVO.setHiredate(rs.getDate("hiredate"));
             return febVO;
         }
    }
    
	
	 public double selectFebIndexVO(String feb) {
		String query = "SELECT elec_using FROM feb_index_view WHERE process_feb=?";
		Double val = jdbcTemplate.queryForObject(query, new Object[] {feb},	Double.class);	
		
		return val;
    }
	    