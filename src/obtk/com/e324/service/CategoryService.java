package obtk.com.e324.service;

import obtk.com.e324.domain.ManCategory;
import obtk.com.e324.domain.WomanCategory;

import java.util.List;

public interface CategoryService {
    List<ManCategory> findManAll();

    List<WomanCategory> findWomanAll();
}
