package com.simulation.dao;

import javax.sql.DataSource;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class SimulationDAO {
	
    public Object updateTable;
	private JdbcTemplate jdbcTemplate;
	
    public SimulationDAO(DataSource dataSource) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    } 
	
 // 전기사용량, 비용 가져오기
    public JSONArray getSimulationIndexViewData(String feb_index_view_elec, String feb_index_view_cost) {
    	
    	System.out.println("feb_index_view_elec : " + feb_index_view_elec + ", feb_index_view_cost : " + feb_index_view_cost);

    	String query = "SELECT "
    	        + "    a.PROCESS_FEB,"
    	        + "    a.ELEC_USING,"
    	        + "    b.INDEX_COST"
    	        + " FROM " + feb_index_view_elec + " a"
    	        + " INNER JOIN ("
    	        + "    SELECT "
    	        + "        b.PROCESS_FEB,"
    	        + "        b.INDEX_COST"
    	        + "    FROM " + feb_index_view_cost + " b"
    	        + ") b ON a.PROCESS_FEB = b.PROCESS_FEB";

    	return jdbcTemplate.query(query, rs -> {
    	    JSONArray jsonArray = new JSONArray();
    	    while (rs.next()) {
    	        JSONObject row = new JSONObject();
    	        row.put("PROCESS_FEB", rs.getString("PROCESS_FEB"));
    	        row.put("ELEC_USING", rs.getString("ELEC_USING"));
    	        row.put("INDEX_COST", rs.getString("INDEX_COST"));
    	        jsonArray.add(row);
    	    }
    	    return jsonArray;
    	});
    }
}
