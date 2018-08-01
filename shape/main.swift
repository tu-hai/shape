//
//  main.swift
//  Shape
//
//  Created by WITZ on 7/23/18.
//  Copyright © 2018 WITZ. All rights reserved.
//

import Foundation
//import UIKit

let pi = 3.14  // hằng số pi khai báo toàn cục
print("số pi = \(pi)")

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



final class Circle: Shape2D {
    var radius: Double
    init(radius: Double) {
        self.radius = radius
        
        func perimeter() -> Double {
            return 2 * pi * radius
        }
        print("\ndien tich hinh tron la: \(perimeter())")
        
        func area() -> Double {
            return pi * radius * radius
        }
        print("dien tich hinh tron la: \(area())\n")
    }
}
let setCircle = Circle(radius: 9)




final class Square: Shape2D{
    var edge: Double
    init(edge: Double) {
        self.edge = edge
    
    func perimeter() -> Double {
            return edge * 4
    }
    print("chu vi hinh vuong la: \(perimeter())")
    
    func area() -> Double {
        return edge * edge
    }
    print("dien tich hinh vuong la: \(area())\n")
    }
 }
 let setSquare = Square(edge: 4)



 
 final class Triangle: Shape2D{
    var edgeA: Double
    var edgeB: Double
    var edgeC: Double
    var height: Double
    init(edgeA: Double, edgeB: Double, edgeC: Double, height: Double) {
        self.edgeA = edgeA
        self.edgeB = edgeB
        self.edgeC = edgeC // canh huyen
        self.height = height // chieu cao
    func perimeter() -> Double {
        return edgeA + edgeB + edgeC
    }
     print("\nchu vi hinh tam giac la: \(perimeter())")
    func area() -> Double {
        return 0.5 * (height * edgeC)
    }
        print("dien tich hinh tam giac la: \(area())")
    }
 }
let setTriangle = Triangle(edgeA: 2, edgeB: 5, edgeC: 6, height: 6)


class Shape3D: Shape {
    func volume() -> Double { //thể tích
        return 0.0
    }
    
    override func area() -> Double {
        return 0.0
    }
}


 final class Globular: Shape3D{
    var radius: Double
    init(radius: Double){
        self.radius = radius
        func volume() -> Double {
            return 4/3 * pi * radius * radius * radius
        }
        print("\nthe tich  hinh cau la: \(volume())")
        
        func area() -> Double { // diệntisch mặt cầu
            return 4 * pi * radius * radius
        }
        print("the tich  hinh cau la: \(volume())")
 
    }
 }
 let setGlobular = Globular(radius: 4)
 

 final class Cube: Shape3D{
 var edge: Double
 init(edge: Double){
 self.edge = edge
    
    func volume() -> Double {
        return edge * edge * edge
    }
    print("\nthe tich hinh lap phuong: \(volume())")
    
    
    func area() -> Double { // diện tích bề mặt hình lập phương
        return 6 * edge * edge
    }
    print("dien tich hinh be mat lap phuong: \(area())")
 }
 }
 let setCube = Cube(edge: 5.5)
 



