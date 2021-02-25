package obtk.com.e324.domain;


import java.util.Date;

public class Product {
    private int id;
    private String name;
    private double price;
    private String ImageFile;
    private String ClothSize;
    private String ClothColor;
    private String province;
    private String city;
    private String area;
    private Date OrderTime;
    private String mid;
    private String wid;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getImageFile() {
        return ImageFile;
    }

    public void setImageFile(String imageFile) {
        ImageFile = imageFile;
    }

    public String getClothSize() {
        return ClothSize;
    }

    public void setClothSize(String clothSize) {
        ClothSize = clothSize;
    }

    public String getClothColor() {
        return ClothColor;
    }

    public void setClothColor(String clothColor) {
        ClothColor = clothColor;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }

    public Date getOrderTime() {
        return OrderTime;
    }

    public void setOrderTime(Date orderTime) {
        OrderTime = orderTime;
    }

    public String getMid() {
        return mid;
    }

    public void setMid(String mid) {
        this.mid = mid;
    }

    public String getWid() {
        return wid;
    }

    public void setWid(String wid) {
        this.wid = wid;
    }
}
