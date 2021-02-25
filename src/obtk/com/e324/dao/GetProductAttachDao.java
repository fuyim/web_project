package obtk.com.e324.dao;

import obtk.com.e324.domain.ProductAttach;

import java.util.List;

public interface GetProductAttachDao {
    List<ProductAttach> GetProductAttach(int pid);
}
