package obtk.com.e324.dao;

import obtk.com.e324.domain.Cart;
import obtk.com.e324.domain.HotSell;
import obtk.com.e324.domain.UserCart;

import java.util.List;

public interface AddCartDao {
    List<Cart> findByUserCart(String userName,String clothSize,int pid,int click);

    int updateCartNum(String userName, int pid);

    int addCart(Cart cart);

    List<UserCart> findByShowCart(String userName);

    int updateUserCart(String userName, int checked,int pid,int num,String checkedStr,int click);

    List<HotSell> OrderByCart();
}
