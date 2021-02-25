package obtk.com.e324.web.servlet;

import com.fasterxml.jackson.databind.ObjectMapper;
import obtk.com.e324.domain.User;
import obtk.com.e324.service.UserService;
import obtk.com.e324.service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

@WebServlet("/updatePassWord")
public class UpdatePassWordServlet extends HttpServlet {

    private boolean flag;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        /**
         * 更改密码 用户名功能
         */
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
        //获取前台数据
        String newPsw = request.getParameter("newPsw");
        String updateSex = request.getParameter("sex");
        String userName = request.getParameter("userName");
        String s2 = "<script>alert(\"%s\");location.replace('updateUser.jsp')</script>";
        User u = new User();
        u.setPassWord(newPsw);
        u.setSex(updateSex);
        u.setUserName(userName);
        //调用service
        UserService service = new UserServiceImpl();
        if (u.getSex()!=null) {
            flag = service.update(u.getUserName(), u.getPassWord(), u.getSex());
        }
         flag = service.updatePassWord(u.getUserName(),u.getPassWord());
        if(flag){
            //修改成功跳转index重新登录
//            Cookie cookie1 = new Cookie("username",null);
//            cookie1.setMaxAge(0);
//            cookie1.setPath("/");
//            response.addCookie(cookie1);
//            Cookie cookie2 = new Cookie("password", null);
//            cookie2.setMaxAge(0);
//            cookie2.setPath("/");
//            response.addCookie(cookie2);
            removeCookie(request,response);
            out.print(String.format(s,"修改成功！请重新登录！"));
        }else if (flag&&u.getSex()!=null){
            //修改成功跳转index重新登录
//            Cookie cookie1 = new Cookie("username",null);
//            cookie1.setMaxAge(0);
//            cookie1.setPath("/");
//            response.addCookie(cookie1);
//            Cookie cookie2 = new Cookie("password", null);
//            cookie2.setMaxAge(0);
//            cookie2.setPath("/");
//            response.addCookie(cookie2);
            removeCookie(request,response);
            out.print(String.format(s,"修改成功！请重新登录！"));
        }else {
            //失败跳转修改页面
            out.print(String.format(s2,"修改失败"));
        }
    }

    public void removeCookie(HttpServletRequest request, HttpServletResponse response){
        Cookie cookie1 = new Cookie("username",null);
        cookie1.setMaxAge(0);
        cookie1.setPath("/");
        response.addCookie(cookie1);
        Cookie cookie2 = new Cookie("password", null);
        cookie2.setMaxAge(0);
        cookie2.setPath("/");
        response.addCookie(cookie2);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
