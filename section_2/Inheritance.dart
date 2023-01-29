class Product {
  String name;
  double ?price;
  
  Product(this.name, {this.price});

 void echo() {
    print(this.name);
  }

}

class Phone extends Product {
  String model;

  Phone(String name,{required this.model,double price=250000,}):super(name,price: price);
}

void main(){
  Phone a=Phone('sumsung',model: 'A32',);
  a.echo();
}