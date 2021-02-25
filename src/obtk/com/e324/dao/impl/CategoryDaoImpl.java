package obtk.com.e324.dao.impl;

import obtk.com.e324.dao.CategoryDao;
import obtk.com.e324.domain.ManCategory;
import obtk.com.e324.domain.WomanCategory;
import obtk.com.e324.util.JDBCUtils;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.List;

public class CategoryDaoImpl implements CategoryDao {
    private JdbcTemplate jdbcTemplate = new JdbcTemplate(JDBCUtils.getDataSource());
    @Override
    public List<ManCategory> findManAll() {
        String sql = "select * from web_man";

        return jdbcTemplate.query(sql, new BeanPropertyRowMapper<ManCategory>(ManCategory.class));
    }

    @Override
    public List<WomanCategory> findWomanAll() {
        String sql = "select * from web_woman";

        return jdbcTemplate.query(sql, new BeanPropertyRowMapper<WomanCategory>(WomanCategory.class));
    }
}
