package obtk.com.e324.web.filter;

import obtk.com.e324.domain.User;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebFilter("/user/*")
public class FindUserFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("user");
        PrintWriter out = resp.getWriter();
        String s = "<script>alert(\"%s\");location.replace('/web_project/index.jsp')</script>";
        if (user==null){
            //用户没登录
            out.print(String.format(s,"请先登录"));

        }else {
            //
            chain.doFilter(request,resp);
        }
    }

    public void init(FilterConfig config) throws ServletException {

    }

}
