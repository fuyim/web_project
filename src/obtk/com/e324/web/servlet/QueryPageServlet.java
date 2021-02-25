package obtk.com.e324.web.servlet;

import com.fasterxml.jackson.databind.ObjectMapper;
import obtk.com.e324.domain.PageBean;
import obtk.com.e324.domain.Product;
import obtk.com.e324.service.QueryPageService;
import obtk.com.e324.service.impl.QueryPageServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/QueryPage")
public class QueryPageServlet extends HttpServlet {
    private QueryPageService service = new QueryPageServiceImpl();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //接收参数
        String currentPageStr = request.getParameter("currentPage");
        String pageSizeStr = request.getParameter("pageSize");
        String cidStr = request.getParameter("cid");
        String rname = request.getParameter("rname");
        String widStr = request.getParameter("wid");
//        if (rname!=null&&rname.length()>0) {
//            rname = new String(rname.getBytes("iso-8859-1"), "utf-8");
//        }
        String pidStr = request.getParameter("pid");
        //处理接收到的参数
        int cid = 0;
        if (cidStr!=null&&cidStr.length()>0){
            cid = Integer.parseInt(cidStr);
        }

        int wid = 0;
        if (widStr!=null&&widStr.length()>0){
            wid = Integer.parseInt(widStr);
        }

        int pid = 0;
        if (pidStr!=null&&pidStr.length()>0){
            pid = Integer.parseInt(pidStr);
        }

        int currentPage = 0;
        if (currentPageStr!=null&&currentPageStr.length()>0){
            currentPage = Integer.parseInt(currentPageStr);
        }else{
            currentPage = 1;
        }

        int pageSize = 0;
        if (pageSizeStr!=null&&pageSizeStr.length()>0){
            pageSize = Integer.parseInt(pageSizeStr);
        }else {
            pageSize = 12;
        }

        //调用service
        PageBean pb = service.queryPage(cid,currentPage,pageSize,rname,pid,wid);
        ObjectMapper mapper = new ObjectMapper();
        response.setContentType("application/json;charset=utf-8");
        mapper.writeValue(response.getOutputStream(),pb);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
