package obtk.com.e324.web.servlet;

import com.fasterxml.jackson.databind.ObjectMapper;
import obtk.com.e324.domain.User;
import obtk.com.e324.service.UserService;
import obtk.com.e324.service.impl.UserServiceImpl;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.InvocationTargetException;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/selectUser")
public class SelectUserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        /**
         * 数据回显到前台
         */
        //获取session中的user对象
        HttpSession session = request.getSession();
        User user =(User) session.getAttribute("user");
        //取出数据
        String userName = user.getUserName();
        String passWord = user.getPassWord();
        String birthday = user.getBirthday();
        String email = user.getEmail();
        String telephone = user.getTelephone();
        String sex = user.getSex();
        //将数据存入map集合
        HashMap<String, Object> map = new HashMap<>();
        if (user!=null){
            map.put("username",userName);
            map.put("passWord",passWord);
            map.put("birthday",birthday);
            map.put("email",email);
            map.put("telephone",telephone);
            map.put("sex",sex);
        }

        ObjectMapper mapper = new ObjectMapper();
        mapper.writeValue(response.getWriter(),map);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
