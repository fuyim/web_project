package obtk.com.e324.dao;

import obtk.com.e324.domain.ManCategory;
import obtk.com.e324.domain.WomanCategory;

import java.util.List;

public interface CategoryDao {
    List<ManCategory> findManAll();

    List<WomanCategory> findWomanAll();
}
