package obtk.com.e324.domain;

public class HotSell {
    private String imageFile;
    private double price;
    private String name;
    private int id;
    private int ClothNum;

    public String getImageFile() {
        return imageFile;
    }

    public void setImageFile(String imageFile) {
        this.imageFile = imageFile;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getClothNum() {
        return ClothNum;
    }

    public void setClothNum(int clothNum) {
        ClothNum = clothNum;
    }
}
