package JavaClass;



public class Cart1 {

  private Integer ID;
  private Integer qty;
  private String prodname;
  private Double price;
  private Double tprice;

  public Cart1(Integer ID, Integer qty, String prodname, Double price, Double tprice) {
    this.ID = ID;
    this.qty = qty;
    this.prodname = prodname;
    this.price = price;
    this.tprice = tprice;
  }

  

  public Integer getID() {
    return ID;
  }

  public void setID(Integer ID) {
    this.ID = ID;
  }

  public Integer getQty() {
    return qty;
  }

  public void setQty(Integer qty) {
    this.qty = qty;
  }

  public String getProdname() {
    return prodname;
  }

  public void setProdname(String prodname) {
    this.prodname = prodname;
  }

  public Double getPrice() {
    return price;
  }

  public void setPrice(Double price) {
    this.price = price;
  }

  public Double getTprice() {
    return tprice;
  }

  public void setTprice(Double tprice) {
    this.tprice = tprice;
  }

  

  
    
}
