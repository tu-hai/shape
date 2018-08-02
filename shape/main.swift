//
//  main.swift
//  Shape
//
//  Created by WITZ on 7/23/18.
//  Copyright © 2018 WITZ. All rights reserved.
import Foundation

let pi = 3.14  // hằng số pi khai báo toàn cục

class Shape {
    func perimeter() -> Double {
        return 0.0
    }
    
    func area() -> Double {
        return 0.0
    }
}


class Shape2D: Shape {
    override func perimeter() -> Double {
        return 0.0
    }
    
    override func area() -> Double {
        return 0.0
    }
}


class Shape3D: Shape {
    func volume() -> Double { //thể tích của hình 3 chiều
        return 0.0
    }
    
}


////////////////2D///////////////
class Circle: Shape2D {
    var radius: Double
    init(radius: Double) {
        self.radius = radius
    }
        override func perimeter() -> Double {
            return 2 * pi * radius
        }
        
        override func area() -> Double {
            return pi * radius * radius
        }
}
//let setCirrcle = Circle(radius: 3.0)


class Square: Shape2D{
    var edge: Double
    init(edge: Double) {
        self.edge = edge
    }
    
    override func perimeter() -> Double {
            return edge * 4
    }
    
    override func area() -> Double {
        return edge * edge
    }
    
 }


class Triangle: Shape2D{
    var edgeA: Double
    var edgeB: Double
    var edgeC: Double
    init(edgeA: Double, edgeB: Double, edgeC: Double) {
        self.edgeA = edgeA
        self.edgeB = edgeB
        self.edgeC = edgeC
    }
    
    override func perimeter() -> Double {
        if edgeA + edgeB > edgeC && edgeC + edgeB > edgeA && edgeC + edgeA > edgeB {
            return edgeC + edgeB + edgeA
        }
        else{
            return 0.0
        }
    }
    
    override func area() -> Double {
        let  halfPerimeter: Double = perimeter() * 0.5 // dùng 1 nữa chu vi để tính diện tích
        return sqrt(halfPerimeter * (halfPerimeter - edgeA) * (halfPerimeter - edgeB) * (halfPerimeter - edgeC))
        // công thức heron dùng 1 nữa chu vi và 3 cạnh để tính S tam giác
    }
    
 }


///////////3D///////////////////////
class Globular: Shape3D{
    var radius: Double
    init(radius: Double){
        self.radius = radius
    }
       override func volume() -> Double {
            return 4/3 * pi * radius * radius * radius
        }
       override func area() -> Double { // diện tich mặt cầu
            return round( 4 * pi * radius * radius)
        }

  }


class Cube: Shape3D{
    var edge: Double
    init(edge: Double){
            self.edge = edge
        }
        override  func volume() -> Double {
            return edge * edge * edge
        }
        override  func area() -> Double { // diện tích bề mặt hình lập phương
            return 6 * edge * edge
        }
}



class RandomCreateShapes {
    
    var intT: Int32 =  Int32(arc4random_uniform(27) + 69) // số nguyên T bất kỳ từ 69...96
    var InputValueForShapes: Double = Double(arc4random_uniform(99) + 1) //giá trị nhâp vào ngẫu nhiên 1...100 của các loại hình
    
    func GetR() -> Int32 {
        let  surPlusR: Int32 = intT % 5
        return surPlusR
    }
    
    func AddShapesToList()  {
        var listShapes = [Any]()  // mảng danh sách chứa các loại hình
        let n = 1
        while n <= 20 {
    
            switch GetR() < 5 {
                case GetR() == 0 : listShapes.append(Circle(radius: InputValueForShapes))
                case GetR() == 1 : listShapes.append(Square(edge: InputValueForShapes))
                case GetR() == 2 : listShapes.append(Triangle(edgeA: InputValueForShapes, edgeB: InputValueForShapes, edgeC: InputValueForShapes))
                case GetR() == 3 : listShapes.append(Globular(radius: InputValueForShapes))
                case GetR() == 4 : listShapes.append(Cube(edge: InputValueForShapes))
                    default: print("Drink Beer affter that go to Sleep")
            }
        }
    }
}

