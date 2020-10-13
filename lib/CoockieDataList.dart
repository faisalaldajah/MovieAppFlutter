class CoockieDataList {
  String productId;
  String productName;
  String imgUr;
  String description;
  String type;
  String quantity;
  String price;

  CoockieDataList(this.productId, this.productName, this.imgUr,
      this.description, this.type, this.quantity, this.price);

  static List<CoockieDataList> getCoockieDataList() => [];
}
