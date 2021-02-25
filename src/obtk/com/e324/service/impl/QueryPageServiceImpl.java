package obtk.com.e324.service.impl;

import obtk.com.e324.dao.QueryPageDao;
import obtk.com.e324.dao.impl.QueryPageDaoImpl;
import obtk.com.e324.domain.PageBean;
import obtk.com.e324.domain.Product;
import obtk.com.e324.domain.ProductAttach;
import obtk.com.e324.service.QueryPageService;

import java.util.List;

public class QueryPageServiceImpl implements QueryPageService {
    private QueryPageDao dao = new QueryPageDaoImpl();
    @Override
    public PageBean queryPage(int cid,int currentPage, int pageSize,String rname,int pid,int wid) {
        //封装pageBean
        PageBean pageBean = new PageBean();
        //设置当前页码
        pageBean.setCurrentPage(currentPage);
        //设置显示个数
        pageBean.setPageSize(pageSize);
        //设置总页码数
        int totalCount= dao.getTotalPage(cid,rname,wid);
        pageBean.setTotalSzie(totalCount);
        //设置当前页面显示的数据集合
        int start = (currentPage - 1)*pageSize;
        List<Product> list = dao.findByPage(cid,start,pageSize,rname,pid,wid);
        pageBean.setList(list);


        //设置总页码数
        int totalPage = totalCount % pageSize == 0 ? totalCount/ pageSize : totalCount/pageSize+1;
        pageBean.setTotalPage(totalPage);
        return pageBean;
    }
}
