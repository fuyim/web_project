package obtk.com.e324.web.servlet;

import com.fasterxml.jackson.databind.ObjectMapper;
import obtk.com.e324.domain.Address;
import obtk.com.e324.domain.User;
import obtk.com.e324.service.AddAddressService;
import obtk.com.e324.service.impl.AddAddressServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/UpdateAddressDefault")
public class UpdateAddressDefaultServlet extends HttpServlet {
    private AddAddressService service = new AddAddressServiceImpl();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获取数据
        HttpSession session = request.getSession();
        User user =(User) session.getAttribute("user");
        String userName = user.getUserName();
        int setDefault = Integer.parseInt(request.getParameter("setDefault"));
        String pidStr = request.getParameter("pid");
        int isDelete = Integer.parseInt(request.getParameter("isDelete"));

        //处理参数
        int pid = 0;
        if (pidStr!=null&&pidStr.length()>0){
            pid = Integer.parseInt(pidStr);
        }
        //查找地址数据库
        List<Address> list = service.findByUserAddress(userName);
        int id = 0;

        for (Address address : list) {
            id = address.getId();
        }
        if (list.size() == 1){
            //此时数据库只有一条数据，将此数据设为默认地址
            int i = service.updateDefault(id,userName);
        }

        if (setDefault == 1&&list.size()>1){
            int i = service.updateUserDefault(pid,userName);
        }

        if (isDelete == 1){
            int i = service.deleteAddress(pid,userName);
        }


        //将数据转换为json、数据
        ObjectMapper mapper = new ObjectMapper();
        response.setContentType("application/json;charset=utf-8");
        mapper.writeValue(response.getWriter(),list);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
