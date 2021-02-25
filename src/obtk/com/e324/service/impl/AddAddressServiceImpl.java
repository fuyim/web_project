package obtk.com.e324.service.impl;

import obtk.com.e324.dao.AddAddressDao;
import obtk.com.e324.dao.impl.AddAddressDaoImpl;
import obtk.com.e324.domain.Address;
import obtk.com.e324.service.AddAddressService;

import java.util.List;

public class AddAddressServiceImpl implements AddAddressService {
    private AddAddressDao dao = new AddAddressDaoImpl();
    @Override
    public int addUserAddress(Address address) {
        return dao.addUserAddress(address);
    }

    @Override
    public List<Address> findByUserAddress(String username) {
        return dao.findBuUserAddress(username);
    }

    @Override
    public int updateDefault(int id, String username) {
        return dao.updateDefault(id,username);
    }

    @Override
    public int updateUserDefault(int pid, String userName) {
        return dao.updateUserDefault(pid,userName);
    }

    @Override
    public int deleteAddress(int pid,String username) {
        return dao.deleteAddress(pid,username);
    }
}
