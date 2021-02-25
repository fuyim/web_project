package obtk.com.e324.service;

import obtk.com.e324.domain.PageBean;

public interface QueryPageService {
    PageBean queryPage(int cid,int currentPage, int pageSize,String rname,int pid,int wid);
}
