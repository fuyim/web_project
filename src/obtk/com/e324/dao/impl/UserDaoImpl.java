package obtk.com.e324.dao.impl;

import obtk.com.e324.dao.UserDao;
import obtk.com.e324.domain.User;
import obtk.com.e324.util.JDBCUtils;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.List;

public class UserDaoImpl implements UserDao {

     private JdbcTemplate jdbcTemplate = new JdbcTemplate(JDBCUtils.getDataSource());
    /**
     * 查询用户是否存在
     * @param userName
     * @return
     */
    @Override
    public User findByUserName(String userName) {
        User user = null;
        String sql = "select * from web_user where username = ?";
        try {
            user = jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<User>(User.class), userName);
        } catch (DataAccessException e) {
            return null;
        }
        return user;
    }

    /**
     * 保存用户信息
     * @param user
     */
    @Override
    public void save(User user) {
        String sql = "insert into web_user (username,password,telephone,sex,email,birthday,code) values(?,?,?,?,?,?,?)";
        jdbcTemplate.update(sql,user.getUserName(),
                                user.getPassWord(),
                                user.getTelephone(),
                                user.getSex(),
                                user.getEmail(),
                                user.getBirthday(),
                                user.getCode());
    }

    @Override
    public User findByUserNameAndPassWord(String userName, String passWord) {
        User user = null;
        String sql = "select * from web_user where username = ? and password = ?";
        try {
            user = jdbcTemplate.queryForObject(sql,new BeanPropertyRowMapper<User>(User.class),userName,passWord);
        } catch (DataAccessException e) {
            return null;
        }
        return user;
    }

    @Override
    public boolean updatePassWordAndSex(String userName, String passWord, String sex) {
        String sql = "update web_user set password = ? , sex = ? where username = ?";
        try {

            System.out.println(userName);
            System.out.println(passWord);
            System.out.println(sex);
            jdbcTemplate.update(sql,passWord,sex,userName);
        } catch (DataAccessException e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    @Override
    public boolean updatePassWord(String userName, String passWord) {
        String sql = "update web_user set password = ? where username = ?";
        try {
            jdbcTemplate.update(sql,passWord,userName);
        } catch (DataAccessException e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }


}
