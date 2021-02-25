package obtk.com.e324.service.impl;

import obtk.com.e324.dao.UserDao;
import obtk.com.e324.dao.impl.UserDaoImpl;
import obtk.com.e324.domain.User;
import obtk.com.e324.service.UserService;

public class UserServiceImpl implements UserService {
    UserDao dao = new UserDaoImpl();
    @Override
    public boolean register(User user) {
        User u = dao.findByUserName(user.getUserName());
        System.out.println(user.getUserName());
        if (u !=null){
            //注册失败
            return false;
        }
        dao.save(user);
        return true;
    }

    @Override
    public User login(User user) {

        return dao.findByUserNameAndPassWord(user.getUserName(),user.getPassWord());
    }

    @Override
    public boolean update(String userName, String passWord, String sex) {

        System.out.println(userName);
        System.out.println(passWord);
        System.out.println(sex);
        return dao.updatePassWordAndSex(userName,passWord,sex);
    }

    @Override
    public boolean updatePassWord(String userName, String passWord) {
        return dao.updatePassWord(userName,passWord);
    }


}
