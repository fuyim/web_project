package obtk.com.e324.web.servlet;

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
import java.util.Map;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    private UserService service = new UserServiceImpl();


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        /**
         * 注册后台
         * @param request
         * @param response
         * @throws ServletException
         * @throws IOException
         */
            //验证码校验
            String s = "<script>alert(\"%s\");location.replace('index.jsp')</script>";
            PrintWriter out = response.getWriter();
            HttpSession session = request.getSession();
            String checkCode_session =(String) session.getAttribute("checkCode_session");
            String check = request.getParameter("code");
            session.removeAttribute("checkCode_session");
            //判断验证码是否相同
            if (check != null && !checkCode_session.equalsIgnoreCase(check)){
                //验证码错误
                out.print(String.format(s,"验证码错误！"));
                return;
            }

            //获取数据
            Map<String, String[]> map = request.getParameterMap();
            User user = new User();
            //封装数据
            try {
                BeanUtils.populate(user,map);
            } catch (IllegalAccessException e) {
                e.printStackTrace();
            } catch (Exception e) {
                e.printStackTrace();
            }
            //调用service层的register方法
            boolean flag = service.register(user);
            if (flag){
                //注册成功
                //跳转到index.jsp
                out.print(String.format(s,"注册成功！"));
//                response.sendRedirect("index.jsp");

            }else{
                out.print(String.format(s,"注册失败！"));
            }
        }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
