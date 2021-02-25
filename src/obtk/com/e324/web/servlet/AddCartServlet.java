package obtk.com.e324.web.servlet;

import com.fasterxml.jackson.databind.ObjectMapper;
import obtk.com.e324.domain.Cart;
import obtk.com.e324.domain.User;
import obtk.com.e324.service.AddCartService;
import obtk.com.e324.service.impl.AddCartServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/AddCart")
public class AddCartServlet extends HttpServlet {
    private AddCartService service = new AddCartServiceImpl();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获取参数
        String clothSize = request.getParameter("clothSize");
        String pidStr = request.getParameter("pid");
        HttpSession session = request.getSession();
        User user =(User) session.getAttribute("user");
        String userName = user.getUserName();
        int click =Integer.parseInt(request.getParameter("click"));
        int i ;
        //处理参数
        int pid=0;
        if (pidStr!=null&&pidStr.length()>0){
            pid = Integer.parseInt(pidStr);
        }

        //封装参数
        Cart cart = new Cart();
        cart.setClothSize(clothSize);
        cart.setPid(pid);
        cart.setUsername(userName);
        //调用service
        List<Cart> carts = service.findByUserCart(userName,clothSize,pid,click);
        //判断返回来的数据
        if (carts.size()>0&&carts!=null){
            //购物车不为第一次添加
             i = service.updateCartNum(userName,pid);
        }else {
            //购物车为第一次添加
             i = service.addCart(cart);
        }


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
