package obtk.com.e324.domain;

import java.io.Serializable;

/**
 * 分类（大类）实现类
 */
public class ManCategory {
    private int cid ; //小类 id
    private String cname ; // 小类名

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }
}
