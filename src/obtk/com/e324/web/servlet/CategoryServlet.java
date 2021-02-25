package obtk.com.e324.web.servlet;

import com.fasterxml.jackson.databind.ObjectMapper;
import obtk.com.e324.domain.ManCategory;
import obtk.com.e324.domain.WomanCategory;
import obtk.com.e324.service.CategoryService;
import obtk.com.e324.service.impl.CategoryServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/category")
public class CategoryServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 查询所有小类
        CategoryService service = new CategoryServiceImpl();
        List<ManCategory> list = service.findManAll();
        ObjectMapper mapper = new ObjectMapper();
        response.setContentType("application/json;charset=utf-8");
        mapper.writeValue(response.getWriter(),list);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
