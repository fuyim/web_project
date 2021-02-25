package obtk.com.e324.dao.impl;

import obtk.com.e324.dao.QueryPageDao;
import obtk.com.e324.domain.Product;
import obtk.com.e324.domain.ProductAttach;
import obtk.com.e324.util.JDBCUtils;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.ArrayList;
import java.util.List;

public class QueryPageDaoImpl implements QueryPageDao {
    private JdbcTemplate jdbcTemplate = new JdbcTemplate(JDBCUtils.getDataSource());
    @Override
    public int getTotalPage(int cid,String rname,int wid) {
//        String sql = "SELECT COUNT(*) FROM web_product";
        String sql = "SELECT COUNT(*) FROM web_product where 1=1";
        StringBuilder sb = new StringBuilder(sql);
        ArrayList list = new ArrayList();
        if (cid!=0){
            sb.append(" and mid = ? ");
            list.add(cid);
        }
        if (wid!=0){
            sb.append(" and wid = ? ");
            list.add(wid);
        }

        if (rname != null && rname.length() > 0){
            sb.append(" and name like ? ");
            list.add("%"+rname+"%");
        }
        sql = sb.toString();
        return jdbcTemplate.queryForObject(sql,Integer.class,list.toArray());
    }

    @Override
    public List<Product> findByPage(int cid , int start, int pageSize,String rname,int pid,int wid) {
//        String sql = "select * from web_product limit ? , ?";
        String sql = "select * from web_product where 1 = 1";
        StringBuilder sb = new StringBuilder(sql);
        ArrayList list = new ArrayList();
        if (cid !=0){
            sb.append(" and mid = ? ");
            list.add(cid);
        }

        if (wid!=0){
            sb.append(" and wid = ? ");
            list.add(wid);
        }

        if (rname != null && rname.length() > 0){
            sb.append(" and name like ? ");
            list.add("%"+rname+"%");
        }

        if (pid !=0){
            sb.append(" and id = ? ");
            list.add(pid);
        }
        sb.append(" limit ? , ? ");
        list.add(start);
        list.add(pageSize);


        sql = sb.toString();

        return jdbcTemplate.query(sql,new BeanPropertyRowMapper<Product>(Product.class),list.toArray());
    }

}
