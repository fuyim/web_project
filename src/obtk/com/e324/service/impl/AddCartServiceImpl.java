package obtk.com.e324.service.impl;

import obtk.com.e324.dao.AddCartDao;
import obtk.com.e324.dao.impl.AddCartDaoImpl;
import obtk.com.e324.domain.Cart;
import obtk.com.e324.domain.HotSell;
import obtk.com.e324.domain.UserCart;
import obtk.com.e324.service.AddCartService;

import java.util.List;

public class AddCartServiceImpl implements AddCartService {
    private AddCartDao dao = new AddCartDaoImpl();
    @Override
    public List<Cart> findByUserCart(String userName,String clothSize,int pid,int click) {

        return dao.findByUserCart(userName,clothSize,pid,click);
    }

    @Override
    public int updateCartNum(String userName, int pid) {

        return dao.updateCartNum(userName,pid);
    }

    @Override
    public int addCart(Cart cart) {
        return dao.addCart(cart);
    }

    @Override
    public List<UserCart> findByShowCart(String userName) {
        return dao.findByShowCart(userName);
    }

    @Override
    public int updateUserCart(String userName, int checked,int pid,int num,String checkedStr,int click) {
        return dao.updateUserCart(userName,checked,pid,num,checkedStr,click);
    }

    @Override
    public List<HotSell> OrderByCart() {
        return dao.OrderByCart();
    }

}
