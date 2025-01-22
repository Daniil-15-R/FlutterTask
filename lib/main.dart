import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OOP Examples',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _controller = TextEditingController();
  String _output = '';

  void _executeTask(int taskNumber) {
    switch (taskNumber) {
      case 1:
        Person person = Person(name: "John", age: 30, gender: "Male");
        person.displayInfo();
        _output = "Task 1 executed: Person info displayed.";
        break;
      case 2:
        Manager manager = Manager(name: "Alice", age: 40, gender: "Female", salary: 100000);
        manager.addSubordinate("Bob");
        _output = "Task 2 executed: Manager has subordinates: ${manager.subordinates}.";
        break;
      case 3:
        List<Animal> animals = [Dog(), Cat(), Cow()];
        _output = "Task 3 executed: ";
        for (var animal in animals) {
          animal.makeSound();
          _output += "${animal.runtimeType} makes sound. ";
        }
        break;
      case 4:
        Transport car = Car();
        Transport bike = Bike();
        _output = "Task 4 executed: ";
        car.move();
        bike.move();
        break;
      case 5:
        Library library = Library();
        library.addBook(Book(title: "1984", author: "George Orwell", year: 1949));
        library.addBook(Book(title: "Brave New World", author: "Aldous Huxley", year: 1932));
        library.findByAuthor("George Orwell");
        _output = "Task 5 executed: Books added and searched.";
        break;
      case 6:
        BankAccount account = BankAccount(accountNumber: "123456789");
        account.deposit(1000);
        account.withdraw(500);
        _output = "Task 6 executed: Deposit and withdrawal performed.";
        break;
      case 7:
        Counter counter1 = Counter();
        Counter counter2 = Counter();
        _output = "Task 7 executed: Total objects created: ${Counter.objectCount}.";
        break;
      case 8:
        Shape circle = Circle(radius: 5);
        Shape rectangle = Rectangle(width: 4, height: 6);
        _output = "Task 8 executed: Circle area: ${circle.getArea()}, Rectangle area: ${rectangle.getArea()}.";
        break;
      case 9:
        List<Animal> moreAnimals = [Fish(), Bird()];
        _output = "Task 9 executed: ";
        for (var animal in moreAnimals) {
          animal.makeSound();
          _output += "${animal.runtimeType} makes sound. ";
        }
        break;
      case 10:
        University university = University();
        university.addStudent(Student(name: "Alice", group: "CS101", grade: 90));
        university.addStudent(Student(name: "Bob", group: "CS101", grade: 85));
        university.sortByName();
        _output = "Task 10 executed: Students added and sorted.";
        break;
      case 11:
        Store store = Store();
        store.addProduct(Product(name: "Laptop", price: 999.99, quantity: 10));
        store.addProduct(Product(name: "Smartphone", price: 699.99, quantity: 5));
        store.findProductByName("Laptop");
        _output = "Task 11 executed: Products added and searched.";
        break;
      case 12:
        PaymentSystem creditCard = CreditCard();
        creditCard.pay();
        _output = "Task 12 executed: Payment made with Credit Card.";
        break;
      case 13:
        UniqueID id1 = UniqueID();
        UniqueID id2 = UniqueID();
        _output = "Task 13 executed: Unique IDs generated: ${id1.id}, ${id2.id}.";
        break;
      case 14:
        Point p1 = Point(1, 2);
        Point p2 = Point(4, 6);
        Rectangle2 rectangle2 = Rectangle2(p1, p2);
        _output = "Task 14 executed: Rectangle area: ${rectangle2.getArea()}.";
        break;
      case 15:
        ComplexNumber c1 = ComplexNumber(1, 2);
        ComplexNumber c2 = ComplexNumber(3, 4);
        ComplexNumber sum = c1 + c2;
        _output = "Task 15 executed: Sum of complex numbers: $sum.";
        break;
      case 16:
        Matrix matrix1 = Matrix([[1, 2], [3, 4]]);
        Matrix matrix2 = Matrix([[5, 6], [7, 8]]);
        Matrix result = matrix1 + matrix2;
        _output = "Task 16 executed: Resulting matrix:\n$result";
        break;
      case 17:
        Player player = Player(name: "Hero");
        Enemy enemy = Enemy(name: "Villain");
        player.attack(enemy);
        _output = "Task 17 executed: Player attacks enemy.";
        break;
      case 18:
        Order order = Order();
        order.addProduct(Product(name: "Laptop", price: 999.99, quantity: 1));
        order.addProduct(Product(name: "Mouse", price: 25.99, quantity: 2));
        double total = order.totalCost();
        _output = "Task 18 executed: Total order cost: \$${total}.";
        break;
      case 19:
        Smartphone smartphone = Smartphone(brand: "BrandX");
        smartphone.turnOn();
        smartphone.takePhoto();
        smartphone.turnOff();
        _output = "Task 19 executed: Smartphone used.";
        break;
      case 20:
        Game game = Game();
        game.start();
        _output = "Task 20 executed: Game started.";
        break;
      default:
        _output = "Invalid task number. Please enter a number from 1 to 20.";
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OOP Examples'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter task number (1-20)',
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                int? taskNumber = int.tryParse(_controller.text);
                if (taskNumber != null) {
                  _executeTask(taskNumber);
                } else {
                  setState(() {
                    _output = "Please enter a valid number.";
                  });
                }
              },
              child: const Text('Execute Task'),
            ),
            const SizedBox(height: 20),
            Text(_output),
          ],
        ),
      ),
    );
  }
}

// 1. Класс "Человек"
class Person {
  String name;
  int age;
  String gender;

  Person({required this.name, required this.age, required this.gender});

  void displayInfo() {
    print("Name: $name, Age: $age, Gender: $gender");
  }

  void incrementAge() {
    age++;
  }

  void changeName(String newName) {
    name = newName;
  }
}

// 2. Наследование: Класс "Работник" и "Менеджер"
class Worker extends Person {
  double salary;

  Worker({required String name, required int age, required String gender, required this.salary})
      : super(name: name, age: age, gender: gender);
}

class Manager extends Worker {
  List<String> subordinates = [];

  Manager({required String name, required int age, required String gender, required double salary})
      : super(name: name, age: age, gender: gender, salary: salary);

  void addSubordinate(String subordinate) {
    subordinates.add(subordinate);
  }
}

// 3. Полиморфизм: Животные
abstract class Animal {
  void makeSound();
  void move();
}

class Dog extends Animal {
  @override
  void makeSound() {
    print("Woof!");
  }

  @override
  void move() {
    print("Dog runs.");
  }
}

class Cat extends Animal {
  @override
  void makeSound() {
    print("Meow!");
  }

  @override
  void move() {
    print("Cat walks.");
  }
}

class Cow extends Animal {
  @override
  void makeSound() {
    print("Moo!");
  }

  @override
  void move() {
    print("Cow walks.");
  }
}

// 4. Абстрактный класс "Транспорт"
abstract class Transport {
  void move();
}

class Car extends Transport {
  @override
  void move() {
    print("Car drives.");
  }
}

class Bike extends Transport {
  @override
  void move() {
    print("Bike rides.");
  }
}

// 5. Класс "Книга" и "Библиотека"
class Book {
  String title;
  String author;
  int year;

  Book({required this.title, required this.author, required this.year});
}

class Library {
  List<Book> books = [];

  void addBook(Book book) {
    books.add(book);
  }

  void findByAuthor(String author) {
    for (var book in books) {
      if (book.author == author) {
        print("Found book: ${book.title}");
      }
    }
  }
}

// 6. Инкапсуляция: Банк
class BankAccount {
  String accountNumber;
  double _balance;

  BankAccount({required this.accountNumber, double balance = 0}) : _balance = balance;

  void deposit(double amount) {
    _balance += amount;
  }

  void withdraw(double amount) {
    if (_balance >= amount) {
      _balance -= amount;
    } else {
      print("Insufficient funds");
    }
  }
}

// 7. Счетчик объектов
class Counter {
  static int objectCount = 0;

  Counter() {
    objectCount++;
  }
}

// 8. Площадь фигур
abstract class Shape {
  double getArea();
}

class Circle extends Shape {
  double radius;

  Circle({required this.radius});

  @override
  double getArea() {
    return 3.14 * radius * radius;
  }
}

class Rectangle extends Shape {
  double width;
  double height;

  Rectangle({required this.width, required this.height});

  @override
  double getArea() {
    return width * height;
  }
}

// 9. Наследование: Животные и их движения
class Fish extends Animal {
  @override
  void makeSound() {
    print("Blub!");
  }

  @override
  void move() {
    print("Fish swims.");
  }
}

class Bird extends Animal {
  @override
  void makeSound() {
    print("Chirp!");
  }

  @override
  void move() {
    print("Bird flies.");
  }
}

// 10. Работа с коллекциями: Университет
class Student {
  String name;
  String group;
  int grade;

  Student({required this.name, required this.group, required this.grade});
}

class University {
  List<Student> students = [];

  void addStudent(Student student) {
    students.add(student);
  }

  void sortByName() {
    students.sort((a, b) => a.name.compareTo(b.name));
  }
}

// 11. Класс "Магазин"
class Product {
  String name;
  double price;
  int quantity;

  Product({required this.name, required this.price, required this.quantity});
}

class Store {
  List<Product> products = [];

  void addProduct(Product product) {
    products.add(product);
  }

  void findProductByName(String name) {
    for (var product in products) {
      if (product.name == name) {
        print("Found product: ${product.name}");
      }
    }
  }
}

// 12. Интерфейс "Платежная система"
abstract class PaymentSystem {
  void pay();
  void refund();
}

class CreditCard extends PaymentSystem {
  @override
  void pay() {
    print("Payment made with Credit Card.");
  }

  @override
  void refund() {
    print("Refund processed for Credit Card.");
  }
}

class PayPal extends PaymentSystem {
  @override
  void pay() {
    print("Payment made with PayPal.");
  }

  @override
  void refund() {
    print("Refund processed for PayPal.");
  }
}

// 13. Генерация уникальных идентификаторов
class UniqueID {
  static int _counter = 0;
  final int id;

  UniqueID() : id = _counter++;

  static String getUniqueID() {
    return "ID: $_counter";
  }
}

// 14. Класс "Точка" и "Прямоугольник"
class Point {
  double x;
  double y;

  Point(this.x, this.y);
}

class Rectangle2 { // Renamed to avoid conflict
  Point topLeft;
  Point bottomRight;

  Rectangle2(this.topLeft, this.bottomRight);

  double getArea() {
    double width = bottomRight.x - topLeft.x;
    double height = bottomRight.y - topLeft.y;
    return width * height;
  }
}

// 15. Комплексные числа
class ComplexNumber {
  double real;
  double imaginary;

  ComplexNumber(this.real, this.imaginary);

  ComplexNumber operator +(ComplexNumber other) {
    return ComplexNumber(real + other.real, imaginary + other.imaginary);
  }

  @override
  String toString() {
    return "$real + ${imaginary}i";
  }
}

// 16. Перегрузка операторов: Матрица
class Matrix {
  List<List<int>> values;

  Matrix(this.values);

  Matrix operator +(Matrix other) {
    List<List<int>> result = [];
    for (int i = 0; i < values.length; i++) {
      List<int> row = [];
      for (int j = 0; j < values[i].length; j++) {
        row.add(values[i][j] + other.values[i][j]);
      }
      result.add(row);
    }
    return Matrix(result);
  }

  @override
  String toString() {
    return values.map((row) => row.toString()).join('\n');
  }
}

// 17. Создание игры с использованием ООП
class Player {
  String name;

  Player({required this.name});

  void attack(Enemy enemy) {
    print("$name attacks ${enemy.name}!");
  }
}

class Enemy {
  String name;

  Enemy({required this.name});
}

// 18. Автоматизированная система заказов
class Order {
  List<Product> products = [];

  void addProduct(Product product) {
    products.add(product);
  }

  double totalCost() {
    double total = 0;
    for (var product in products) {
      total += product.price * product.quantity;
    }
    return total;
  }
}

// 19. Наследование: Электроника
class Device {
  String brand;

  Device({required this.brand});

  void turnOn() {
    print("$brand device turned on.");
  }

  void turnOff() {
    print("$brand device turned off.");
  }
}

class Smartphone extends Device {
  Smartphone({required String brand}) : super(brand: brand);

  void takePhoto() {
    print("$brand smartphone takes a photo.");
  }
}

class Laptop extends Device {
  Laptop({required String brand}) : super(brand: brand);
}

// 20. Игра "Крестики-нолики"
class Game {
  void start() {
    print("Game started!");
  }
}
