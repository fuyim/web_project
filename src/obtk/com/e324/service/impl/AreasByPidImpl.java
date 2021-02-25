package obtk.com.e324.service.impl;

import obtk.com.e324.dao.AreasByPidDao;
import obtk.com.e324.dao.impl.AreasByPidDaoImpl;
import obtk.com.e324.domain.Areas;
import obtk.com.e324.service.AreasByPid;
import obtk.com.e324.util.JedisUtil;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.Tuple;

import java.util.List;
import java.util.Set;

public class AreasByPidImpl implements AreasByPid {
    @Override
    public List<Areas> getByPidAreas(String pid) {
        AreasByPidDao dao = new AreasByPidDaoImpl();
        return dao.getAreas(pid);
    }
}
