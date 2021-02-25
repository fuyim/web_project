package obtk.com.e324.dao;

import obtk.com.e324.domain.Areas;

import java.util.List;

public interface AreasByPidDao {
    List<Areas> getAreas(String pid);
}
