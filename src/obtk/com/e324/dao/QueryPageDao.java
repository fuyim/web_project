package obtk.com.e324.dao;

import obtk.com.e324.domain.Product;
import obtk.com.e324.domain.ProductAttach;

import java.util.List;

public interface QueryPageDao {
    int getTotalPage(int cid,String rname,int wid);

    List<Product> findByPage(int cid,int start, int pageSize,String rname,int pid,int wid);

}
