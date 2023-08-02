//
//  main.swift
//  hw_5
//
//  Created by Антон Баландин on 2.08.23.
//

import Foundation

//1. В рамках прошлого дз был создан класс пиццерии с переменной, в которой хранится пицца, удалите ее. Необходимо создать структуру картошки фри, в которой будет стоимость и размер картошки и сделать так, чтобы в классе пиццерии была одна переменная, в которую можно было бы класть и пиццу, и картошку фри.
//2. Добавьте в класс пиццерии функцию, которая будет добавлять новую позицию в меню
//3. Создайте протокол, в котором будут содержаться функции открытия и закрытия
//4. Написать расширение для класса пиццерии, в котором будет реализован протокол из пункта 3
//5. Написать функцию, в которой происходит вычитание одного числа из другого. Функиия должна
//работать и с Int, и с Double. Функция должна возвращать результат вычитания

protocol MenuProtocol {
    var cost: Int { get }
    var name: String { get }
}

protocol OpeningClosing {
    func opening()
    func closing()
}

extension Pizzeria: OpeningClosing {
    func opening() {
        print("Pizzeria open")
    }
    func closing() {
        print("The pizzeria is buried")
    }
}

struct Pizza: MenuProtocol {

    enum EnumName: String {
        case calzone = "calzone"
        case napoletana = "napiletana"
        case romana = "romana"
        case siciliana = "siciliana"
        case fritta = "fritta"
        case gourmet = "gourmet"
    }
    
    enum Additives {
        case pepperoni
        case tomato
        case cheese
    }
    
    enum Dough {
        case thick
        case thin
    }

    
    var cost: Int
    var name: String
    var enumName: EnumName
       
    var additives: Additives
    var dough: Dough
}

struct Fries: MenuProtocol {
    enum Size {
        case smal
        case medium
        case large
    }
    var cost: Int
    var size: Size
    var name: String = "fries"
}


class Pizzeria {
    private var menu: [MenuProtocol]
    
    init (menu: [MenuProtocol]) {
        self.menu = menu
    }
    
    func addNext(goods: MenuProtocol) {
        self.menu.append(goods)
    }
    
    func showOrder() {
        for e in menu {
            print(e.name)
        }
    }
}

 var pizzeria = Pizzeria(menu: [])

pizzeria.opening()

pizzeria.addNext(goods: Pizza(cost: 120, name: "calcone", enumName: .calzone, additives: .pepperoni, dough: .thick))
pizzeria.addNext(goods: Fries(cost: 70, size: .large))
pizzeria.showOrder()

pizzeria.closing()


//------------------------------------------------------------

func sum<T: Numeric> (_ number1: T, _ number2: T) -> T {
    number1 + number2
}
var a: Int = 10
var b: Int = 12
var numInt = sum(a, b)
print("Сумма двух целых чисел равна \(numInt)")

var c: Double = 7.0
var d: Double = 8.6
var numDouble = sum(c, d)
print("Сумма двух чисел Double равна \(numDouble)")

