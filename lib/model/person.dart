
class Item{
  String itemName;
  int price;
  int qty;
  int tax;

  Item(this.itemName, this.price, this.qty, this.tax);


}
class PersonModel{
  String name;
  String mobile;
  bool isPaid;
  List<Item> a=[];

  PersonModel(this.name, this.mobile, this.isPaid, this.a);

}
