package obtk.com.e324.dao.impl;

import obtk.com.e324.dao.GetProductAttachDao;
import obtk.com.e324.domain.ProductAttach;
import obtk.com.e324.util.JDBCUtils;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.List;

public class GetProductAttachDaoImpl implements GetProductAttachDao {
    private JdbcTemplate jdbcTemplate = new JdbcTemplate(JDBCUtils.getDataSource());
    @Override
    public List<ProductAttach> GetProductAttach(int pid) {
        String sql = "select * from product_attach where pid = ?";

        return jdbcTemplate.query(sql,new BeanPropertyRowMapper<ProductAttach>(ProductAttach.class),pid);
    }
}
