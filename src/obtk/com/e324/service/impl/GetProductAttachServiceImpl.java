package obtk.com.e324.service.impl;

import obtk.com.e324.dao.GetProductAttachDao;
import obtk.com.e324.dao.impl.GetProductAttachDaoImpl;
import obtk.com.e324.domain.ProductAttach;
import obtk.com.e324.service.GetProductAttachService;

import java.util.List;

public class GetProductAttachServiceImpl implements GetProductAttachService {
    private GetProductAttachDao dao  = new GetProductAttachDaoImpl();
    @Override
    public List<ProductAttach> FindProductAttach(int pid) {

        return dao.GetProductAttach(pid);
    }
}
