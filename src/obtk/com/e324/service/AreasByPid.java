package obtk.com.e324.service;

import obtk.com.e324.domain.Areas;

import java.util.List;

public interface AreasByPid {
    List<Areas> getByPidAreas(String pid);
}
