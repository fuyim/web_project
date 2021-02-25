package obtk.com.e324.web.servlet;

import com.fasterxml.jackson.databind.ObjectMapper;
import obtk.com.e324.domain.ProductAttach;
import obtk.com.e324.service.GetProductAttachService;
import obtk.com.e324.service.impl.GetProductAttachServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/GetProductAttach")
public class GetProductAttachServlet extends HttpServlet {
    private GetProductAttachService service = new GetProductAttachServiceImpl();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获取数据
        String pidStr = request.getParameter("pid");

        //处理数据
        int pid = 0;
        if(pidStr!=null&&pidStr.length()>0){
            pid = Integer.parseInt(pidStr);
        }
        //调用service
        List<ProductAttach> list = service.FindProductAttach(pid);

        ObjectMapper mapper = new ObjectMapper();
        response.setContentType("application/json;charset=utf-8");
        mapper.writeValue(response.getOutputStream(),list);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
