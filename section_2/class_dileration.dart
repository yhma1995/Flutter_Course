class Prodcut {
  String name;
  double price;
  int quantity;
  bool discount;
  Prodcut(this.name, this.price, this.quantity, {this.discount = false});
  void add(int quantity) {
    this.quantity = quantity + this.quantity;
  }

  void sell(int quantity) {
    if (quantity > this.quantity) {
      print('invalid quantity');
    } else {
      this.quantity = this.quantity - quantity;
    }
  }
}



void main() {
  Prodcut shoes = Prodcut('nike', 25000, 2, discount: true);
  // Prodcut phone =Prodcut('phone',25000,6);
  print(shoes.quantity);
  shoes.sell(10);
}
