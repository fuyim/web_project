package obtk.com.e324.service.impl;

import obtk.com.e324.dao.CategoryDao;
import obtk.com.e324.dao.impl.CategoryDaoImpl;
import obtk.com.e324.domain.ManCategory;
import obtk.com.e324.domain.WomanCategory;
import obtk.com.e324.service.CategoryService;
import obtk.com.e324.util.JedisUtil;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.Tuple;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

public class CategoryServiceImpl implements CategoryService {
    private  CategoryDao dao = new CategoryDaoImpl();
    @Override
    public List<ManCategory> findManAll() {
        //从缓存中查找
        Jedis jedis = JedisUtil.getJedis();
        Set<Tuple> categorys = jedis.zrangeWithScores("ManCategory", 0, -1);
        List<ManCategory> man= null;
        if (categorys==null || categorys.size() == 0){
            //缓存为空查询数据库
            System.out.println("从数据库查。。。。");
            man = dao.findManAll();
            for (int i=0 ; i<man.size() ; i++){
                jedis.zadd("ManCategory",man.get(i).getCid(),man.get(i).getCname());
            }
        }else{
            //从缓存差
            System.out.println("从缓存中查。。。。");
            man = new ArrayList<ManCategory>();
            for (Tuple tuple : categorys) {
                ManCategory category = new ManCategory();
                category.setCid((int)tuple.getScore());
                category.setCname(tuple.getElement());
                man.add(category);
            }
        }

        return man;
    }

    @Override
    public List<WomanCategory> findWomanAll() {
        //从缓存中查
        Jedis jedis = JedisUtil.getJedis();
        Set<Tuple> categorys = jedis.zrangeWithScores("WomanCategory", 0, -1);
        List<WomanCategory> woman = null;
        if (categorys==null || categorys.size()==0){
            //从数据库查
            woman = dao.findWomanAll();
            for (int i=0 ; i<woman.size() ; i++){
                jedis.zadd("WomanCategory",woman.get(i).getCid(),woman.get(i).getCname());
            }
        }else {
            //从缓存查
            woman = new ArrayList<>();
            for (Tuple tuple : categorys) {
                WomanCategory category = new WomanCategory();
                category.setCid((int)tuple.getScore());
                category.setCname(tuple.getElement());
                woman.add(category);
            }
        }
        return woman;
    }
}
