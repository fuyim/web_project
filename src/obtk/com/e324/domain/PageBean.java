package obtk.com.e324.domain;

import java.util.List;

public class PageBean {
    private int currentPage; // 当前页码
    private int pageSize; // 每页展示的数
    private int totalPage; //总页码数
    private int totalSzie; //总记录数

    private List<Product> list; // 每条显示的数据集合


    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public int getTotalSzie() {
        return totalSzie;
    }

    public void setTotalSzie(int totalSzie) {
        this.totalSzie = totalSzie;
    }

    public List<Product> getList() {
        return list;
    }

    public void setList(List<Product> list) {
        this.list = list;
    }
}
