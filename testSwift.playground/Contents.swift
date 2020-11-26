//: A UIKit based Playground for presenting user interface
  
import UIKit
import Foundation
//: # 1. (1 балл за каждый пункт)
//: ### 1.1 Что такое значимый (value) и  ссылочный(reference) тип? Приведите примеры.
//значимый тип это тип который перезаписывается в одной и той же ячейке памяти накладываясь на предыдущую запись, ссылочный тип постоянно ссылается на одну ячейку памяти в которой хранится информация
//: ### 1.2 Чем отличается “struct“ от “class”?
// класс это ссылочный тип а структура это значимый тип
//: ### 1.3 Что такое Опционал(optional value)? Какие способы “unwrapping” для опционала вы знаете?

// опционал указывает на значение которого может и не быть, но может и быть. при условии когда мы допускаем что значение может быть но сейчас его нет, мы можем предусмотреть опционал возможного значения. опционал это по сути контейнер который содержит значение nil если ему не задано иное значение. перед извлечением опционала он проходит проверку на nil

//: ### 1.4 Какие Коллекции(Collection types) вы знаете? Приведите примеры использования каждого из них(т.е. какую коллекцию для каких задач рациональнее использовать).

//: ### массив, словарь, множество. в массивах значения упорядоченные и могут повторятся, в словаре хранятся значения одного типа и у каждого значения есть ключ, у множества значения не упорядоченные и не повторяются в отличии от массива.

//: ### 1.5 Что такое замыкание(Closure)? Приведите примеры использования.
// замыкание это безымянные функции которые могут быть переданы в виде аргумента. замыкания могут захватывать значения из вложенных функций и переменные
//

//: ### 1.6 Что такое enum? Что такое raw и associated value?
// enum это перечисление однородных значений, элементы значений обозначаются словом case мы можем присвоить тип, без значения это будет associated value. либо присвоить значение по умолчанию raw value.


//: ### 1.7 Как вы понимаете основные понятия/принципы ООП: Наследование, инкапсуляция, полиморфизм? Приведите примеры.
// Инкапсуляция объединяет данные и код и защищает его от внешнего вмешательства
// Полиморфизм это когда одним интерфейсом, мы можем выполнить множество методов
//Наследование это приобретение одним объектом свойств другого и добавление своих свойст для более полного описания объекта

//: ### 1.8 Для чего существуют операторы "if" и "switch"? Чем они отличаются?

//оператор if выполняет блок кода если его условие возвращает true оператор switch сравнивает значения с многими другими и выбирает нужный блок кода для исполнения

//: ### 1.9 Что такое Extension и Protocol. Для чего они предназначены? Какие принципы ООП они реализовывают?
//: # 2. (2 балла за каждый пункт)
//:  2.1 Опишите enum который будет отражать общие состояния погоды(ясно, облачно, осадки и тд). Для тех состояний погоды, для которых возможно, опишите assosiated values с количеством осадков.
enum WeatherConditions {
    case temperature (celcius: Double)
    case cloudiness
    case fallout (typeOfFallout: String)
    case wind
}

func whatToWear (if goForWalk: WeatherConditions) {
    switch goForWalk {
    case .temperature(let celcius) where celcius <= 10:
        print("It's cold outside. Put on warm clothes.")
    case .cloudiness:
        print("You'd better bring an umbrella and wear a scarf.")
    case .fallout(let typeOfFallout) where typeOfFallout.lowercased() == "rainy" || typeOfFallout.lowercased() == "storm":
        print("You'd better bring an umbrella and wear a scarf.")
    case .wind:
        print("It's windy outside. Put on warm clothes.")
    case .temperature, .fallout:
        print("It's sunny and warm outside. Put on a dress.")
    }
}
//:  2.2 Опишите функцию minValue, которая принимает 2 аргумента и возвращает меньшее из этих значений.
func minValue(num1: Int, num2: Int) -> Int{
    let result = num1 < num2 ? num1 : num2
    return result
}

//:  2.3 Для следующего объекта типа String выведите все строки короче 10 символов, которые начинаются на "a" или "A" и все строки начинающиеся на b или "B"
let strings = ["adfkjsd", "Akdsfjkdfjldfjk", "bdkk", "kaf", " afurl", "ABBA", "ABBBBBBBBBBBBBBBBA", "no", "1234566dkjdksdjksd", "bbbbbbbbbbbbbbbbbbbb", "Ваc?"]

let filtered = strings.filter({$0.count < 10 && $0.hasPrefix("b") || $0.count < 10 && $0.hasPrefix("a") || $0.count < 10 && $0.hasPrefix("A") || $0.count < 10 && $0.hasPrefix("B")})
print(filtered)



//:  2.4 Опишите функцию, которая принимает номер дня недели и возвращает название дня недели.
enum Day: Int {
    case Понедельник = 1
    case Вторник = 2
    case Среда = 3
    case Четверг = 4
    case Пятница = 5
    case Суббота = 6
    case Воскресенье = 7
}
Day(rawValue: 1)
Day(rawValue: 6)


func dayOfWeek(dayNumber: Int){
    switch dayNumber {
        case 1: print("Понедельник")
        case 2: print("Вторник")
        case 3: print("Среда")
        case 4: print("Четверг")
        case 5: print("Пятница")
        case 6: print("Суббота")
        case 7: print("Воскресенье")
    default:
        print("Не удалось распознать значение")
    }
}
dayOfWeek(dayNumber:7)

//:  2.5 Опишите функцию, которая получает время в качестве трех аргументов (часы, минуты, секунды) и возвращает время в качестве (с тремя этими компонентами). С помощью typealias можете назвать исходящий тип по-своему.
func time(hours: Int, minutes: Int, seconds: Int) -> (Int,Int,Int) {
    typealias myTime = (Int,Int,Int)
    let newTime: myTime = (hours, minutes, seconds)
    return newTime
}

print (time(hours: 12, minutes: 10, seconds: 30))

//: 2.6 Опишите функцию, принимающую время в виде кортежа, описанного в предыдущем задании, конвертирует полученное время в секунды и возвращает значение Int(количество секунд)

func time2(hours: Int, minutes: Int, seconds: Int) -> Int {
    let newTime: Int = ((hours * 3_600) + (minutes * 60) + seconds)
    return newTime
}

time2(hours: 11, minutes: 11, seconds: 43)


//:  2.7 Опишите функцию обратную функции из предыдущего задания, принимающую 1 аргумент - количество секунд(например 1500) и конвертирует полученное время в формат кортежа (часы, минуты, секунды) из пункта 2.5
func time3(time: Int) -> (hours: Int, minutes: Int, seconds: Int) {
    let hours: Int = time/3_600
    let minutes: Int = (time - (hours*3_600))/60
    let seconds: Int = (time - (hours*3_600) - (minutes*60))
    let newTime = (hours, minutes, seconds)
    return newTime
}

time3(time: 1500)
//:  2.8 Объявите переменную которая будет иметь тип Closure(замыкание), которое принимает аргументы Int и String и возвращает массив String. Присвойте ей реализацию, которая повторит в массиве строку n раз. Выполните эту функцию, передав ей число 7 и строку "test".
typealias myClosure = (String, Int) -> ([String])

var repeatFunction: myClosure = { (stringToRepeat, count) in
    return Array(repeating: stringToRepeat, count: count)
}

repeatFunction("test", 7)

//:  2.9 Используя функцию `filter', получите массив только с городами с населением более 15 млн человек
struct City {
    let population: Int
    let country: String
    let name: String
}

let citiesArray = [City(population: 24_256_800, country: "Китай", name: "Шанхай"),
City(population: 23_500_000, country: "Пакистан", name: "Карачи" ),
City(population: 21_516_000, country: "Пекин", name: "Китай"),
City(population: 16_349_831, country: "Индия", name: "Дели"),
City(population: 16_060_303, country: "Нигерия", name: "Лагос"),
City(population: 15_200_000, country: "Китай", name: "Тяньцзинь"),
City(population: 14_160_467, country: "Турция", name: "Стамбул"),
City(population: 13_513_734, country: "Япония", name: "Токио"),
City(population: 13_080_500, country: "Китай", name: "Гуанчжоу"),
City(population: 12_442_373, country: "Индия", name: "Мумбаи"),
City(population: 12_197_596, country: "Россия", name: "москва"),
City(population: 11_895_893, country: "Бразилия", name: "Сан-Паулу"),
City(population: 10_467_400, country: "Китай", name: "Шэньчжэнь"),
City(population: 10_075_310, country: "Индонезия", name: "Джакарта"),
City(population: 10_052_000, country: "Пакистан", name: "Лахор"),]

let filterArray = citiesArray.filter({$0.population > 15000000 })
print(filterArray)

//: # 3. (5 баллов за каждый пункт)
//: Представьте себе задачу по разработке приложения для домашней климатической техники. В рамках данной задачи вам необходимо выполнить следующее:

// 3.1 Опишите базовый класс HomeSensor, который содержит несколько общих свойств для разных датчиков (например: датчик влажности, температуры, CO2):
// - значение измеряемого параметра данным датчиком value,
// - название измеряемого параметра,
// - целевое значение параметра - идальный показатель (targetValue),
// - точность в процентах (погрешность датчика),
// - id датчика
// - Опишите Void(Ничего не возвращающую) функцию "output" с пустым телом (т.е. что бы она ничего не делала)
class HomeSensor {
    var measureValue: Int
    var measureName: String
    var targetValue: Int
    var accuracy: Double
    var sensorID: Int
    
    init(measureValue: Int, measureName: String, targetValue: Int,accuracy: Double, sensorID: Int){
        self.measureValue = measureValue
        self.measureName = measureName
        self.targetValue = targetValue
        self.accuracy = accuracy
        self.sensorID = sensorID
    }
    func output () {
        
        
    }
    
}
 
// 3.2 Опишите наследуемые классы для каждого типа датчиков (HumiditySensor, TemperatureSensor, COSensor)
class HumiditySensor: HomeSensor{
    
   override func output() {
        print("Влaжность на датчике \(sensorID) равна \(measureValue) \(measureName) +/- \(accuracy) \(measureName). Целевое значение - \(targetValue) \(measureName)")
    }
}

let humiditySensor = HumiditySensor (measureValue: 50, measureName: "%", targetValue: 60, accuracy: 5, sensorID: 10)
humiditySensor.output()

class TemperatureSensor: HomeSensor{
    
    override func output() {
        print("Температура на датчике \(sensorID) равна \(measureValue) \(measureName) +/- \(accuracy) \(measureName). Целевое значение - \(targetValue) \(measureName)")
    }
}

let temperatureSensor = TemperatureSensor(measureValue: 15, measureName: "ºС", targetValue: 19, accuracy: 1, sensorID: 13)
temperatureSensor.output()


class COSensor: HomeSensor{
    override func output() {
        print("Значение на датчике \(sensorID) равна \(measureValue) \(measureName) +/- \(accuracy) \(measureName). Целевое значение - \(targetValue) \(measureName)")
    }
}

let sensorCO = COSensor(measureValue: 5, measureName: "%", targetValue: 10, accuracy: 5, sensorID: 5)
sensorCO.output()

// 3.3 В дочерних классах переопределите функцию Output, что бы она выводила описание типа "Температура на датчике 13 равна 15ºС +/- 1ºС. Целевое значение - 19ºС"

// 3.4 Опишите класс для комнаты(Room), который может содержать несколько сенсоров(HomeSensor) в одном свойстве c названием sensors. Так же Room должно содержать свойство - название комнаты.
class Room {
    let sensors: [HomeSensor]
    let nameRoom: String
    
    init(sensors: [HomeSensor], nameRoom: String){
        self.sensors = sensors
        self.nameRoom = nameRoom
        
    }
}

// 3.5 Опишите класс Home, который может содержать несколько комнат(Room) в одном свойстве c названием rooms, а также опишите в нем функцию, которая выводит в консоль показания всех датчиков в каждой комнате, используя метод output
class Home{
    let rooms: [Room]
    init(rooms: [Room]) {
            self.rooms = rooms
        }
    func output() {
            for room in rooms {
                for sensor in room.sensors {
                    print(sensor.output())
                }
            }
        }
}



// Продемонстрируйте работу:
// - Создайте 1 экземпляр класса Home и  3 экземпляра Room (кухня, гостинная, спальня). Добавьте созданные экземпляры комнат в объект Home (в проперти rooms объекта Home)
let kitchenTemperatureSensor = TemperatureSensor(measureValue: 21, measureName: "ºС", targetValue: 20, accuracy: 0.5, sensorID: 44)
let kitchenCOSensor = COSensor(measureValue: 10, measureName: "%", targetValue: 10, accuracy: 5, sensorID: 45)
let kitchenHumiditySensor = HumiditySensor(measureValue: 50, measureName: "%", targetValue: 60, accuracy: 5, sensorID: 46)

let livRoomTemperatureSensor = TemperatureSensor (measureValue: 21, measureName: "ºС", targetValue: 20, accuracy: 0.5, sensorID: 55)
let livRoomCOSensor = COSensor(measureValue: 10, measureName: "%", targetValue: 10, accuracy: 5, sensorID: 56)
let livRoomHumiditySensor = HumiditySensor(measureValue: 50, measureName: "%", targetValue: 60, accuracy: 5, sensorID: 57)


let sleepRoomTemperatureSensor = TemperatureSensor(measureValue: 21, measureName: "ºС", targetValue: 20, accuracy: 0.5, sensorID: 66)
let SleepRoomCOSensor = COSensor(measureValue: 10, measureName: "%", targetValue: 10, accuracy: 5, sensorID: 67)
let sleepRoomHumiditySensor = HumiditySensor(measureValue: 50, measureName: "%", targetValue: 60, accuracy: 5, sensorID: 68)


let kitchen = Room(sensors: [kitchenTemperatureSensor, kitchenCOSensor, kitchenCOSensor], nameRoom: "Kitchen")
let livingRoom = Room(sensors: [livRoomTemperatureSensor, livRoomTemperatureSensor, livRoomHumiditySensor], nameRoom: "Livingroom")
let sleepRoom = Room(sensors: [sleepRoomTemperatureSensor, SleepRoomCOSensor, sleepRoomHumiditySensor], nameRoom: "Sleeproom")

let myRoom = Home(rooms:[kitchen, livingRoom, sleepRoom])
myRoom.output()

// - Создайте и добавьте несколько экземпляров датчиков в каждую комнату
// - У объекта Home вызовите функцию, которая выводит в консоль показания всех датчиков в каждой комнате
//


//: Дополнительное задание:
/*:
 Для каждого датчика:
 - опишите дополнительное значение нижнего предела targetValueMin
 - опишите метод, устанавливающий targetValueMin и targetValueMax, предусмотрите валидацию введенного значения (что бы с точки зрения контекста каждого измерения не нарушалась логика)
 - в didSet проперти value предусмотрите сообщение в консоль в случае если новое значение больше, чем targetValue
 */
