//
//  main.swift
//  playground218
//
//  Created by pulino4ka ✌🏻 on 2.7.2025.
//

import Foundation


//Task 1.1
//Протокол Describable
//Создайте протокол Describable с требованием свойства description типа String.
//Сделайте структуру Person и класс Car конформирующими этому протоколу.
//Выведите описание для каждого объекта.

protocol Describable {
    var description: String {get}
}

struct Person: Describable {
    var name: String
    var surname: String
    var description: String
}

class Car: Describable {
    var brand: String
    var model: String
    var year: Int
    var description: String
    init(carBrand: String, carModel: String, carYear: Int, carDescription: String) {
        brand = carBrand
        model = carModel
        year = carYear
        description = carDescription
    }
    
}

//Task 1.2
//Протокол Comparable
//Создайте протокол Comparable, который позволяет сравнивать два объекта.
//Реализуйте этот протокол для класса Student, где сравнение происходит по среднему баллу.

protocol Comparable: Equatable {
    static func < (lhs: Self, rhs: Self) -> Bool 
    static func > (lhs: Self, rhs: Self) -> Bool
}

class Student: Comparable {
    var name: String
    var averageGrade: Double
    
    init(name: String, averageGrade: Double) {
        self.name = name
        self.averageGrade = averageGrade
    }
    
    static func > (lhs: Student, rhs: Student) -> Bool {
        return lhs.averageGrade > rhs.averageGrade
    }
    
    static func == (lhs: Student, rhs: Student) -> Bool {
        return lhs.averageGrade == rhs.averageGrade
    }
    
    static func < (lhs: Student, rhs: Student) -> Bool {
        return lhs.averageGrade < rhs.averageGrade
    }
}

var student1 = Student(name: "Ivan", averageGrade: 10)
var student2 = Student(name: "Masha", averageGrade: 15)


if student1 > student2 {
    print("У \(student1.name) балл выше, чем у \(student2.name)")
} else if student1 < student2 {
    print("У \(student2.name) балл выше, чем у \(student1.name)")
} else {
    print("У \(student1.name) и \(student2.name) одинаковые баллы")
}

//Task 1.3
//Расширение String
//Создайте расширение для класса String, которое добавляет метод isPalindrome(), проверяющий, является ли строка палиндромом.

extension String {
    func isPalindrome() -> Bool {
        if self.isEmpty {
            return false
        }
        if self.lowercased() == String(self.lowercased().reversed()) {
            return true
        } else {
            return false
        }
    }
}

var string = "dkfj"
print(string.isPalindrome())


//Task 1.4
//Протокол Equatable
//Создайте протокол Equatable для структуры Point, чтобы можно было сравнивать две точки.

protocol Equatable {
    static func == (point1: Self, point2: Self) -> Bool
}

struct Point: Equatable {
    var x: Int
    var y: Int
    
    static func == (point1: Self, point2: Self) -> Bool {
        return point1.x == point2.x && point1.y == point2.y
    }
}

var point1 = Point(x: 6, y: 1)
var point2 = Point(x: 5, y: 1)

print(point1 == point2)


//Task 1.5
//Расширение Array
//Создайте расширение для массива (Array), которое добавляет метод average(), вычисляющий среднее значение чисел в массиве.

extension Array where Element: BinaryInteger {
    func average() -> Double {
        guard !self.isEmpty else {return 0}
        let sum = self.reduce(0, +)
        return Double(sum) / Double(self.count)
    }
}

extension Array where Element: BinaryFloatingPoint {
    func average() -> Double {
        guard !self.isEmpty else {return 0}
        let sum = self.reduce(0, +)
        return Double(sum) / Double(self.count)
    }
}
var strArr = ["fdf","dd","ds"]
var arr = Array(1...5)
var arrDouble = [0.1, 0.2, 0.3]
print(arr.average())
print(arrDouble.average())


//Task 2.1
//Протокол Identifiable
//Создайте протокол Identifiable с требованием свойства id типа String.
//Сделайте класс User и структуру Product конформирующими этому протоколу.

protocol Identifiable {
    var id: String {get set}
}

class User: Identifiable {
    var username: String
    var id: String
    
    init(id: String, username: String) {
        self.id = id
        self.username = username
    }
}

struct Product: Identifiable {
    var title: String
    var id: String
}


// Task 2.2
//Расширение Int
//Создайте расширение для типа Int, которое добавляет метод isEven(), проверяющий, является ли число четным.
extension Int {
    func isEven() -> Bool {
        if self.isMultiple(of: 2) {
            return true
        } else {
            return false
        }
    }
}

var number = 10
print(number.isEven())


//Task 2.3
//Протокол CustomStringConvertible
//Реализуйте протокол CustomStringConvertible для класса Book, чтобы при выводе объекта отображалось его название и автор.


class Book: CustomStringConvertible {
    var title: String
    var author: String
    var description: String {
        return "\(title), \(author)"
    }
    init(title: String, author: String) {
        self.title = title
        self.author = author
    }
    
}

var book = Book(title: "Idiot", author: "Dostoevskiy")
print(book)

//Task 2.4
//Протокол Delegate
//Создайте простой пример использования делегата:
//Класс Timer вызывает метод делегата, когда таймер заканчивается.
//Класс ViewController реализует протокол делегата и обрабатывает событие.

protocol Delegate {
    func timerEnded()
}

class Timer {
    var delegate: Delegate?
    var time: Int
    init(delegate: Delegate? = nil, time: Int) {
        self.delegate = delegate
        self.time = time
    }
    func start(){
        while time > 0 {
            time -= 1
        }
        delegate?.timerEnded()
    }
    
}
 

class ViewController: Delegate {
    func timerEnded() {
        print("таймер закончился")
    }
    
}

var timer = Timer(time: 5)
timer.delegate = ViewController()
timer.start()

//Task 2.5
//Расширение Dictionary
//Создайте расширение для словаря (Dictionary), которое добавляет метод keysAsString(), возвращающий все ключи как одну строку через запятую.

extension Dictionary {
    func keysAsString() -> String {
        var stringKeys  = self.keys.map{ "\($0)" }.joined(separator: ", ")
        return stringKeys
    }
}

var dict: Dictionary = ["first": 2, "second": 3, "third": 3]
print(dict.keysAsString())


//Task 3.1
//Протокол Observable
//Создайте протокол Observable, который позволяет объектам уведомлять наблюдателей о своих изменениях.
//Пример: класс Counter увеличивает счетчик, а наблюдатель получает уведомление о новом значении.

protocol Observable {
    func counterEdited(counter: Int)
}

class Counter {
    var observable: Observable?
    var counter: Int
    init(observable: Observable? = nil, counter: Int) {
        self.observable = observable
        self.counter = counter
    }
    func start() {
        while counter >= 0 {
            observable?.counterEdited(counter: counter)
            counter -= 1
        }
    }
}

class Spectator: Observable {
    func counterEdited(counter: Int) {
        print("Счет: \(counter) ")
    }
    
}

var counter = Counter(counter: 5)
counter.observable = Spectator()
counter.start()

//Task 3.2
//Расширение Double
//Создайте расширение для типа Double, которое добавляет метод roundToDecimal(places:), округляющий число до указанного количества десятичных знаков.

extension Double {
    func roundToDecimal(places: Int) -> Double {
        let rounded = pow(10.0, Double(places))
        return (self * rounded).rounded() / rounded
    }
}

let double = 3.1545454
let rounded = double.roundToDecimal(places: 2)
print(rounded)

//Task 3.3
//Протокол Codable
//Создайте структуру User с полями name и age, которая конформирует протоколу Codable.
//Напишите код, который преобразует экземпляр User в JSON строку и обратно.

struct UserCodable: Codable {
    var name: String
    var age: Int
    
}

let user1 = UserCodable(name: "Polina", age: 21)

do {
    let jsonData = try JSONEncoder().encode(user1)
    let jsonString = String(data: jsonData, encoding: .utf8)!
    print(jsonString)
    
    let decodedUser = try JSONDecoder().decode(UserCodable.self, from: jsonData)
    print(decodedUser)
} catch {print(error)}

//Task 3.4
//Протокол Factory
//Создайте протокол Factory, который содержит метод create() для создания объектов.
//Реализуйте этот протокол для класса CarFactory, который создает автомобили разных марок.

protocol Factory {
    func create() -> NewCar
}

class NewCar {
    var brand: String
    var model: String
    var year: Int
    
    init(brand: String, model: String, year: Int) {
        self.brand = brand
        self.model = model
        self.year = year
    }
    
}

class CarFactory: Factory {
    func create() -> NewCar{
        return NewCar(brand: "BMW", model: "X5", year: 2003)
    }

}

let factory = CarFactory()
let newCar = factory.create()
print(newCar.brand, newCar.model, newCar.year)

//Task 3.5
//Расширение для коллекций
//Создайте расширение для всех коллекций (Collection), которое добавляет метод removeAll(where:), удаляющий элементы, удовлетворяющие условию.

extension RangeReplaceableCollection {
   mutating func removeAll(elem: (Element) -> Bool) {
       let filtered = self.filter { !elem($0) }
       self = Self(filtered)
    }
}


var array = [1,1,1,2,3,4,7,1]
array.removeAll(elem: {$0 > 1})
print(array)


//Task 4.1
//Протокол PaymentMethod
//Создайте протокол PaymentMethod, который содержит метод process(amount:), обрабатывающий платеж
//Реализуйте этот протокол для классов CreditCard и PayPal.

protocol PaymentMethod {
     func process(amount: Double)
}

class CreditCard: PaymentMethod {
    var cardNumber: String
    var account: Double = 10000
 

    init(cardNumber: String) {
        self.cardNumber = cardNumber
        
    }
    
    func process(amount: Double) {
        account -= amount
        print("Покупка: \(amount) руб. Счет: \(account) руб ")
    }
    
}

class PayPal: PaymentMethod {
    var accountNumber: String
    var account: Double = 10000
    
    init(accountNumber: String) {
        self.accountNumber = accountNumber
    }
    
    func process(amount: Double) {
        account -= amount
        print("Покупка: \(amount) $. Счет: \(account) $ ")
    }
    
}

let method: PaymentMethod = CreditCard(cardNumber: "1222")
method.process(amount: 50)


//Task 4.2
//Расширение для URL
//Создайте расширение для типа URL, которое добавляет метод isValid(), проверяющий, является ли URL валидным.
extension URL {
    func isValid() -> Bool {
        return self.scheme != nil && self.host != nil
    }
}

let url = URL(string: "https://www.example.com")
print(url?.isValid())


//Task 4.3
//Создайте протокол Observer, который позволяет объектам подписываться на события другого объекта.
//Пример: класс WeatherStation оповещает подписчиков об изменении температуры.
protocol Observer {
    func weatherChanged(newTemp: Int, newWeather: String)
}

class WeatherStation {
    var weather: String
    var temperature: Int
    var observer: Observer?
    
    init(weather: String, temperature: Int, observer: Observer? = nil) {
        self.weather = weather
        self.temperature = temperature
        self.observer = observer
    }
    
    
    func updateWeather(newTemp: Int, newWeather: String) {
        observer?.weatherChanged(newTemp: newTemp, newWeather: newWeather)
    }
}

class Subscriber: Observer {
    func weatherChanged(newTemp: Int, newWeather: String) {
        print("Температура \(newTemp) и погода \(newWeather)")
    }
}

let currWeather = WeatherStation(weather: "Sunny", temperature: 22)
currWeather.observer = Subscriber()
currWeather.updateWeather(newTemp: 25, newWeather: "Sunny")


//Task 4.4
//Расширение для Date
//Создайте расширение для типа Date, которое добавляет метод daysUntil(date:), вычисляющий количество дней до указанной даты

extension Date {
    func daysUntil(date: Date) -> Int? {
        let calendar = Calendar.current

        let date1 = calendar.startOfDay(for: Date())
        let date2 = calendar.startOfDay(for: date)

        let components = calendar.dateComponents([.day], from: date1, to: date2)
        return components.day
    }
}

let currDate = Date()
let formatter = DateFormatter()
formatter.dateFormat = "dd.MM.yyyy"

if let newDate = formatter.date(from: "06.07.2025") {
    if let days = currDate.daysUntil(date: newDate) {
        print(days)
    } else {
        print("Неправильный ввод")
    }
  
} else {
    print("Неправильная дата")
}

//Task 4.5
//Протокол Transformer
//Создайте протокол Transformer, который содержит метод transform(input:), преобразующий входные данные.
//Реализуйте этот протокол для класса TextEncryptor, который шифрует текст.

protocol Transformer {
    static func transform(input: String) -> String
}

class TextEncryptor: Transformer {
    static func transform(input: String) -> String {
        guard let data = input.data(using: .utf8) else {return "Ошибка"}
        
        return data.base64EncodedString()
    }
    

}
print(TextEncryptor.transform(input: "Hello"))
