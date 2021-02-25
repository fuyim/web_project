package obtk.com.e324.dao.impl;

import obtk.com.e324.dao.AreasByPidDao;
import obtk.com.e324.domain.Areas;
import obtk.com.e324.util.JDBCUtils;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import java.awt.geom.Area;
import java.util.ArrayList;
import java.util.List;

public class AreasByPidDaoImpl implements AreasByPidDao {
    private JdbcTemplate jdbcTemplate = new JdbcTemplate(JDBCUtils.getDataSource());
    /**
     * 查询所有的省份
     * @param pid is null
     * @return
     */
    @Override
    public List<Areas> getAreas(String pid) {
        //定义一个sql 模板
        String sql = "select * from areas where 1 = 1";
        StringBuilder sb = new StringBuilder(sql);
        ArrayList list = new ArrayList();
        if (pid == null){
            //查询的是省份
            sb.append(" and pid is null ");
        }else {
            sb.append(" and pid = ? ");
            list.add(pid);
        }
        sql = sb.toString();

        return jdbcTemplate.query(sql,new BeanPropertyRowMapper<Areas>(Areas.class),list.toArray()  );
    }
}
