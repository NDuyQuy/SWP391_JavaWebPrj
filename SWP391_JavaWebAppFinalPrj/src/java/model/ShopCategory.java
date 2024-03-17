/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;
import dao.CategoryDao;

/**
 *
 * @author hien
 */
public class ShopCategory {
    private int id;
    private int shop_id;
    private String name;
    private String description;
    private MainCategory maincategory;
    private Shops shop;

    public ShopCategory() {
    }


    public ShopCategory(int id, int shop_id, String name, String description, MainCategory maincategory, Shops shop) {
        this.id = id;
        this.shop_id = shop_id;
        this.name = name;
        this.description = description;
        this.maincategory = maincategory;
        this.shop = shop;
    }
    
    


    public ShopCategory(int id, int maincate_id, int shop_id, String name, String description) {
        this.id = id;
        this.maincategory = CategoryDao.getMainCategoryById(maincate_id);
        this.shop_id = shop_id;
        this.name = name;
        this.description = description;
    }
    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getShop_id() {
        return shop_id;
    }

    public void setShop_id(int shop_id) {
        this.shop_id = shop_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public MainCategory getMaincategory() {
        return maincategory;
    }

    public void setMaincategory(MainCategory maincategory) {
        this.maincategory = maincategory;
    }

    public Shops getShop() {
        return shop;
    }

    public void setShop(Shops shop) {
        this.shop = shop;
    }
    

    @Override
    public String toString() {
        return "ShopCategory{" + "id=" + id + ", maincate_id=" + ", shop_id=" + shop_id + ", name=" + name + ", description=" + description + '}';
    }
    
}
