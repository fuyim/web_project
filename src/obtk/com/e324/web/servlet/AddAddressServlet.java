package obtk.com.e324.web.servlet;


import obtk.com.e324.domain.Address;
import obtk.com.e324.domain.User;
import obtk.com.e324.service.AddAddressService;
import obtk.com.e324.service.impl.AddAddressServiceImpl;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.List;
import java.util.Map;

@WebServlet("/AddAddress")
public class AddAddressServlet extends HttpServlet {
    private AddAddressService service = new AddAddressServiceImpl();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获取数据
        String reapName = request.getParameter("reapName");
        String province = request.getParameter("province");
        String city = request.getParameter("city");
        String area = request.getParameter("area");
        String particular = request.getParameter("particular");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        HttpSession session = request.getSession();
        User user =(User) session.getAttribute("user");
        String userName = user.getUserName();

        //封装数据
        Address address = new Address();
        address.setUsername(userName);
        address.setReapName(reapName);
        address.setProvince(province);
        address.setCity(city);
        address.setArea(area);
        address.setDetail(particular);
        address.setPhone(phone);
        address.setEmail(email);
        session.setAttribute("address",address);
        //调用service addAddress(address);
        //第一次添加
        int i = service.addUserAddress(address);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
