package obtk.com.e324.service;

import obtk.com.e324.domain.User;

public interface UserService {
    boolean register(User user);

    User login(User user);

    boolean update(String userName,String passWord,String sex);

    boolean updatePassWord(String userName, String passWord);
}
