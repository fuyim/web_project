package obtk.com.e324.domain;

public class Cart {
    private int cart_id ;
    private String username;
    private String ClothSize;
    private int ClothNum;
    private int pid;

    public int getCart_id() {
        return cart_id;
    }

    public void setCart_id(int cart_id) {
        this.cart_id = cart_id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getClothSize() {
        return ClothSize;
    }

    public void setClothSize(String clothSize) {
        ClothSize = clothSize;
    }

    public int getClothNum() {
        return ClothNum;
    }

    public void setClothNum(int clothNum) {
        ClothNum = clothNum;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }
}
