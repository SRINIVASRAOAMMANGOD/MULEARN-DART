import 'dart:io';

class Car {
  String name;
  int price;

  Car(this.name, this.price);

  void changePrice(int newPrice) {
    price = newPrice;
  }

  @override
  String toString() {
    return name + " (Rs. " + price.toString() + ")";
  }
}

class Person {
  String name;
  int moneyLeft;
  List<Car> ownedCars = [];

  Person(this.name, this.moneyLeft);

  void buyCar(Car car) {
    if (moneyLeft >= car.price) {
      ownedCars.add(car);
      moneyLeft = moneyLeft - car.price;
      print("You bought " + car.name + " for Rs. " + car.price.toString());
    } else {
      print("Not enough money to buy " + car.name);
    }
  }

  void sellCar(Car car) {
    if (ownedCars.contains(car)) {
      ownedCars.remove(car);
      moneyLeft = moneyLeft + car.price;
      print("You sold " + car.name + " for Rs. " + car.price.toString());
    } else {
      print("You do not own this car.");
    }
  }

  void showOwnedCars() {
    if (ownedCars.isEmpty) {
      print("You have no cars.");
    } else {
      print("Your cars:");
      for (Car car in ownedCars) {
        print("- " + car.toString());
      }
    }
  }

  void showMoney() {
    print("Money left: Rs. " + moneyLeft.toString());
  }
}

void main() {
  print("Enter your name:");
  String name = stdin.readLineSync()!;
  print("Enter your money:");
  int money = int.parse(stdin.readLineSync()!);

  Person person = Person(name, money);

  List<Car> cars = [
    Car("Dodge", 10000),3
    Car("Lamborghini", 20000),
    Car("Ferrari", 30000),
    Car("BMW", 40000),
    Car("Mercedes", 50000),
  ];

  while (true) {
    print("\n--- Menu ---");
    print("1. Show available cars");
    print("2. Buy a car");
    print("3. Sell a car");
    print("4. Show owned cars");
    print("5. Show money left");
    print("6. Exit");

    stdout.write("Enter choice: ");
    int choice = int.parse(stdin.readLineSync()!);

    if (choice == 1) {
      print("\nAvailable cars:");
      for (int i = 0; i < cars.length; i++) {
        print((i + 1).toString() + ". " + cars[i].toString());
      }
    } else if (choice == 2) {
      print("Enter car name to buy:");
      String carName = stdin.readLineSync()!;
      bool found = false;
      for (Car car in cars) {
        if (car.name.toLowerCase() == carName.toLowerCase()) {
          person.buyCar(car);
          found = true;
          break;
        }
      }
      if (!found) {
        print("Car not found.");
      }
    } else if (choice == 3) {
      print("Enter car name to sell:");
      String sellName = stdin.readLineSync()!;
      bool sold = false;
      for (Car car in person.ownedCars) {
        if (car.name.toLowerCase() == sellName.toLowerCase()) {
          person.sellCar(car);
          sold = true;
          break;
        }
      }
      if (!sold) {
        print("You don't have that car.");
      }
    } else if (choice == 4) {
      person.showOwnedCars();
    } else if (choice == 5) {
      person.showMoney();
    } else if (choice == 6) {
      print("Thank you for using the app!");
      break;
    } else {
      print("Invalid choice. Try again.");
    }
  }
}

