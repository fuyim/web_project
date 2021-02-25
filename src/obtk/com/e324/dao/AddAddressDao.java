package obtk.com.e324.dao;

import obtk.com.e324.domain.Address;

import java.util.List;

public interface AddAddressDao {
    int addUserAddress(Address address);

    List<Address> findBuUserAddress(String username);

    int updateDefault(int id, String username);

    int updateUserDefault(int pid, String userName);

    int deleteAddress(int pid,String username);
}
