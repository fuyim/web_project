package obtk.com.e324.web.servlet;

import com.fasterxml.jackson.databind.ObjectMapper;
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

@WebServlet("/FindCartServlet")
public class FindCartServlet extends HttpServlet {
    private AddCartService service = new AddCartServiceImpl();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获取数据
        HttpSession session = request.getSession();
        User user =(User) session.getAttribute("user");
        String userName = user.getUserName();
        //调用servicefindByShowCart
        List<UserCart> list = service.findByShowCart(userName);
        System.out.println(list.size());

        //将数据转换为json数据并返回前台
        ObjectMapper mapper = new ObjectMapper();
        response.setContentType("application/json;charset=utf-8");
        mapper.writeValue(response.getWriter(),list);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
