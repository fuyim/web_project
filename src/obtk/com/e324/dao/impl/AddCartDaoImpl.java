package obtk.com.e324.dao.impl;

import obtk.com.e324.dao.AddCartDao;
import obtk.com.e324.domain.Cart;
import obtk.com.e324.domain.HotSell;
import obtk.com.e324.domain.User;
import obtk.com.e324.domain.UserCart;
import obtk.com.e324.util.JDBCUtils;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.ArrayList;
import java.util.List;

public class AddCartDaoImpl implements AddCartDao {
    private JdbcTemplate jdbcTemplate = new JdbcTemplate(JDBCUtils.getDataSource());
    @Override
    public List<Cart> findByUserCart(String userName,String clothSize,int pid,int click) {
        String sql = "select * from web_cart where username = ? and pid = ? and ClothSize = ? and isDelete = ? ";
        return jdbcTemplate.query(sql,new BeanPropertyRowMapper<Cart>(Cart.class),userName,pid,clothSize,click);
    }

    @Override
    public int updateCartNum(String userName, int pid) {
        String sql = "update web_cart set ClothNum =ClothNum+1  where username = ? and pid = ?";

        return jdbcTemplate.update(sql,userName,pid);
    }

    @Override
    public int addCart(Cart cart) {
        String sql = "insert into web_cart values(0,?,?,default,?,default ,default )";

        return jdbcTemplate.update(sql,cart.getUsername(),cart.getClothSize(),cart.getPid());
    }

    @Override
    public List<UserCart> findByShowCart(String userName) {
        String sql = "SELECT p.imageFile , p.price , p.name , c.ClothSize , c.ClothNum  , c.isChecked , c.cart_id , c.isDelete ,c.pid FROM web_cart c , web_product p WHERE p.id = c.pid AND username = ? ";

        return jdbcTemplate.query(sql,new BeanPropertyRowMapper<UserCart>(UserCart.class),userName);
    }

    @Override
    public int updateUserCart(String userName, int checked , int pid , int num,String checkedStr,int click) {
        //定义一个sql模板
        String sql = "update web_cart set isDelete = "+click+" where 1 = 1 ";
        if (num == 0&&checkedStr!=null){
             sql = "UPDATE web_cart SET isChecked = "+checked+"  WHERE 1 = 1 ";
        }

        if (num != 0){
             sql = "UPDATE web_cart SET  ClothNum = "+num+"  WHERE 1 = 1 ";
        }
        StringBuilder sb = new StringBuilder(sql);
        List list = new ArrayList<>();
        if (pid != 0){
            sb.append(" and username = ? and cart_id = ? ");
            list.add(userName);
            list.add(pid);
        }
        if (pid == 0){
            sb.append(" and username = ? ");
            list.add(userName);
        }
        sql = sb.toString();

        return jdbcTemplate.update(sql,list.toArray());
    }

    @Override
    public List<HotSell> OrderByCart() {
        String sql = "SELECT p.ImageFile , p.price , p.NAME , p.id , c.ClothNum FROM web_cart c , web_product p WHERE p.id = c.pid ORDER BY ClothNum DESC";
        return jdbcTemplate.query(sql,new BeanPropertyRowMapper<HotSell>(HotSell.class));
    }
}
