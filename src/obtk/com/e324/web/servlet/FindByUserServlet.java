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
import java.io.IOException;
import java.util.HashMap;

/**
 * 实现注册时判断用户是否存在
 */
@WebServlet("/findByUser")
public class FindByUserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获取前台传来的数据
        String username = request.getParameter("username");
        //封装数据
        User user = new User();
        user.setUserName(username);
        //调用数据库查找数据
        UserService service = new UserServiceImpl();
        boolean u = service.register(user);
        //创建map集合封装msg
        HashMap<String, Object> map = new HashMap<>();
        //判断u是否为空
        if (username!=null&&u == false){
            //用户存在
            map.put("isMsg",true);
            map.put("msg","用户已存在");
        }else {
            map.put("isMsg",false);
            map.put("msg","用户可用");
        }
        ObjectMapper mapper = new ObjectMapper();
        mapper.writeValue(response.getWriter(),map);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
