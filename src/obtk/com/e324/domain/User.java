package obtk.com.e324.domain;

import java.io.Serializable;

/**
 * 用户信息实现类
 */
public class User{
    private String userName;
    private String passWord;
    private String telephone;
    private String sex;
    private String email;
    private String birthday;
    private String code;

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassWord() {
        return passWord;
    }

    public void setPassWord(String passWord) {
        this.passWord = passWord;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String emali) {
        this.email = emali;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String date) {
        this.birthday = date;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }
}
