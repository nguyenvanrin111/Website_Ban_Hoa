/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modal;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 *
 * @author admin
 */
@Builder
@Getter
@Setter
@ToString

public class Product {
    private int id;
    private String name;
    private int quantity;
    private double price;
    private String description;
    private String imageURL;
    private String createdDate;
    private int categoryId;

    public Product() {
    }

    public Product(String name, int quantity, double price, String description, String imageURL, String createdDate, int categoryId) {
        
        this.name = name;
        this.quantity = quantity;
        this.price = price;
        this.description = description;
        this.imageURL = imageURL;
        this.createdDate = createdDate;
        this.categoryId = categoryId;
    }

    public Product(int id, String name, int quantity, double price, String description, String imageURL, String createdDate, int categoryId) {
        this.id = id;
        this.name = name;
        this.quantity = quantity;
        this.price = price;
        this.description = description;
        this.imageURL = imageURL;
        this.createdDate = createdDate;
        this.categoryId = categoryId;
    }
    
      
}
