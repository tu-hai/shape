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


class Shape3D: Shape {
    func volume() -> Double { //thể tích của hình 3 chiều
        return 0.0
    }
    
    override func area() -> Double { // diện tích mặt của hình 3 chiều
        return 0.0
    }
}

////////////////2D///////////////
final class Circle: Shape2D {
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
    
    func display(){
         print("chu vi hinh tron la: \(perimeter())")
         print("dien tich hinh tron la: \(area())\n")
    }
}
let setCircle = Circle(radius: 9)
setCircle.display()




final class Square: Shape2D{
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
    
    func display(){
        print("chu vi hinh vuong la: \(perimeter())")
        print("dien tich hinh vuong la: \(area())\n")
    }
 }
 let setSquare = Square(edge: 4)
setSquare.display()



 
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
    }
    override func perimeter() -> Double {
        return edgeA + edgeB + edgeC
    }
    override func area() -> Double {
        return 0.5 * (height * edgeC)
    }
    func display(){
        print("chu vi hinh tam giac la: \(perimeter())")
        print("dien tich hinh tam giac la: \(area())\n")
    }
    
 }
let setTriangle = Triangle(edgeA: 2, edgeB: 5, edgeC: 6, height: 6)
setCircle.display()




///////////3D///////////////////////

 final class Globular: Shape3D{
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
    
    func display(){
        print("the tich hinh cau la: \(volume())")
        print("dien tich mặt cầu la: \(area())\n")
    }
 }
 let setGlobular = Globular(radius: 4)
 setGlobular.display()

 final class Cube: Shape3D{
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
    func display(){
        print("the tich hinh lap phuong: \(volume())")
        print("dien tich mặt hinh lap phuong la: \(area())\n")
    }
 }
 let setCube = Cube(edge: 5.5)
setCube.display()
 



