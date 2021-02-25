package obtk.com.e324.dao;

import obtk.com.e324.domain.User;

public interface UserDao {
    User findByUserName(String userName);

    void save(User user);

    User findByUserNameAndPassWord(String userName, String passWord);

    boolean updatePassWordAndSex(String userName,String passWord,String sex);

    boolean updatePassWord(String userName, String passWord);
}
