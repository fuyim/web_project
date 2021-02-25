package obtk.com.e324.web.servlet;

import obtk.com.e324.domain.User;
import obtk.com.e324.domain.UserCart;
import obtk.com.e324.service.AddCartService;
import obtk.com.e324.service.impl.AddCartServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/UpdateCartServlet")
public class UpdateCartServlet extends HttpServlet {
    private AddCartService service = new AddCartServiceImpl();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获取数据
        String checkedStr = request.getParameter("checked");
        String pidStr = request.getParameter("pid");
        HttpSession session = request.getSession();
        User user =(User) session.getAttribute("user");
        String userName = user.getUserName();
        String numStr = request.getParameter("num");
        String clickStr = request.getParameter("click");
        //处理数据
        int pid = 0;
        if (pidStr!=null&&pidStr.length()>0){
            pid = Integer.parseInt(pidStr);
        }

        int num = 0;
        if (numStr!=null&&numStr.length()>0){
            num = Integer.parseInt(numStr);
        }

        int checked = 1;
        if (checkedStr!=null&("true").equals(checkedStr)){
            checked = 1 ;
        }else if (checkedStr!=null&("false").equals(checkedStr)){
            checked = 0;
        }

        int click = 0;
        if (clickStr!=null&&clickStr.length()>0){
            click = Integer.parseInt(clickStr);
        }

        //调用service updateUserCart()
        int i = service.updateUserCart(userName,checked,pid,num,checkedStr,click);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
