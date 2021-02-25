package obtk.com.e324.dao.impl;

import obtk.com.e324.dao.AddAddressDao;
import obtk.com.e324.domain.Address;
import obtk.com.e324.util.JDBCUtils;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.List;

public class AddAddressDaoImpl implements AddAddressDao {
    private JdbcTemplate jdbcTemplate = new JdbcTemplate(JDBCUtils.getDataSource());
    @Override
    public int addUserAddress(Address address) {
        String sql = "insert into web_address values (0,?,?,?,?,?,?,?,?,default,default )";

        return jdbcTemplate.update(sql,address.getUsername(),
                                       address.getReapName(),
                                       address.getProvince(),
                                       address.getCity(),
                                       address.getArea(),
                                       address.getDetail(),
                                       address.getPhone(),
                                       address.getEmail());
    }

    @Override
    public List<Address> findBuUserAddress(String username) {
        String sql = " select * from web_address where username = ? ";
        return jdbcTemplate.query(sql,new BeanPropertyRowMapper<Address>(Address.class),username);
    }

    @Override
    public int updateDefault(int id, String username) {
        String sql = " update web_address set isDefault = 1 where id = ? and username = ? ";
        return jdbcTemplate.update(sql,id,username);
    }

    @Override
    public int updateUserDefault(int pid, String userName) {
        String sql = " update web_address set isDefault = 0 where username = ?";
        jdbcTemplate.update(sql,userName);
        return jdbcTemplate.update("update web_address set isDefault = 1 where id = ?",pid);
    }

    @Override
    public int deleteAddress(int pid,String username) {
        String sql = " delete from web_address where id = ? and  username = ?";
        return jdbcTemplate.update(sql,pid,username);
    }
}
