package obtk.com.e324.web.servlet;

import obtk.com.e324.domain.User;
import obtk.com.e324.service.UserService;
import obtk.com.e324.service.impl.UserServiceImpl;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.InvocationTargetException;
import java.util.Map;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //获取数据
        Map<String, String[]> map = request.getParameterMap();
        //封装数据
        User user = new User();
        PrintWriter out = response.getWriter();
        String s = "<script>alert(\"%s\");location.replace('user/UserCenter.jsp')</script>";
        try {
            BeanUtils.populate(user,map);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }
        //调用service的login方法'
        UserService service = new UserServiceImpl();
        User u = service.login(user);
        HttpSession session = request.getSession();
        //判读
        if (u!=null){
            //将查询到的用户存入session
            session.setAttribute("user",u);
            //登录成功
            out.print(String.format(s,"登录成功！"));
//            response.sendRedirect("index.jsp");

            //实现记住我功能
            String remember = request.getParameter("remember");
            String userName = request.getParameter("userName");
            String passWord = request.getParameter("passWord");
            System.out.println(remember);
            if (remember !=null && remember.equals("on")){
                if (userName!=null&&passWord!=null){
                    Cookie cookie1 = new Cookie("username",userName);
                    Cookie cookie2 = new Cookie("password", passWord);
                    cookie1.setMaxAge(60*60*24);
                    cookie2.setMaxAge(60*60*24);
                    cookie1.setPath("/");
                    cookie2.setPath("/");
                    response.addCookie(cookie1);
                    response.addCookie(cookie2);
                }
            }

        }else {
            out.print(String.format(s,"登录失败！"));
//            request.getRequestDispatcher("index.jsp");
        }


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
