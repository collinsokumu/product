// Interface for data loading
abstract class Loadable {
  Future<void> loadData(String filePath);
}

// Product class
class Product {
  String name;
  double price;
  int quantity;

  // Constructor
  Product(this.name, this.price, this.quantity);

  // Method to display product information
  void displayInfo() {
    print("Product Name: $name");
    print("Price: Ksh$price");
    print("Quantity: $quantity");
  }
}

// ElectronicProduct class inherits from Product (inheritance)
class ElectronicProduct extends Product {
  String brand;

  // Constructor
  ElectronicProduct(String name, double price, int quantity, this.brand)
      : super(name, price, quantity);

  // Override displayInfo method to include brand
  @override
  void displayInfo() {
    super.displayInfo();
    print("Brand: $brand");
  }
}

// InventoryManager class implements Loadable (interface implementation)
class InventoryManager implements Loadable {
  List<Product> products = [];

  // Simulate data loading (no file reading here)
  @override
  Future<void> loadData(String filePath) async {
    // Replace with actual file reading logic
    final data = [
      ["TV", "9000.00", "10", "Sony"],
      ["Laptop", "7000.00", "5", "Dell"],
      ["Phone", "5000.00", "15", "Apple"],
    ];

    for (var item in data) {
      final name = item[0] as String;
      final price = double.parse(item[1] as String);
      final quantity = int.parse(item[2] as String);
      final brand = item[3] as String;
      products.add(ElectronicProduct(name, price, quantity, brand));
    }
  }

  // Method to display all products (using a loop)
  void displayInventory() {
    for (var product in products) {
      product.displayInfo();
      print("--------");
    }
  }
}

// Main function
void main() async {
  final inventoryManager = InventoryManager();
  await inventoryManager
      .loadData('inventory.txt'); // Replace with your file path for data
  inventoryManager.displayInventory();
}
