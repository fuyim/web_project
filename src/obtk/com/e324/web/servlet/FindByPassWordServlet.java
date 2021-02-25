package obtk.com.e324.web.servlet;

import com.fasterxml.jackson.databind.ObjectMapper;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;

/**
 * 判断原密码是否和新密码相同
 */
@WebServlet("/findByPassWord")
public class FindByPassWordServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获取前台数据
        String update_passWord = request.getParameter("update_passWord");
        String newPsw = request.getParameter("newPsw");
        //将数据封装到map集合中
        HashMap<String, Object> map = new HashMap<>();
        //判断密码是否相同
        if (update_passWord!=null&&newPsw!=null&&!update_passWord.equals(newPsw)){
            //不相同
            map.put("isNewMsg",true);
            map.put("NewMsg","新密码可用");

        }else {
            map.put("isNewMsg",false);
            map.put("NewMsg","原密码和新密码相同");
        }

        ObjectMapper mapper = new ObjectMapper();
        mapper.writeValue(response.getWriter(),map);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
