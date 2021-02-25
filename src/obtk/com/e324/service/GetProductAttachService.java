package obtk.com.e324.service;

import obtk.com.e324.domain.ProductAttach;

import java.util.List;

public interface GetProductAttachService {
    List<ProductAttach> FindProductAttach(int pid);
}
