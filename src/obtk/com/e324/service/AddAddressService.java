package obtk.com.e324.service;

import obtk.com.e324.domain.Address;

import java.util.List;

public interface AddAddressService {
    int addUserAddress(Address address);

    List<Address> findByUserAddress(String username);

    int updateDefault(int id, String username);

    int updateUserDefault(int pid, String userName);

    int deleteAddress(int pid,String username);
}
