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

class Shape {
    func perimeter() -> Double {
        return perimeter()
    }
    
    func area() -> Double {
        return area()
    }
}


class Shape2D: Shape {
    override func perimeter() -> Double {
        return perimeter()
    }
    
    override func area() -> Double {
        return area()
    }
}



final class Circle: Shape2D {
    var radius: Double
    init(radius: Double) {
        self.radius = radius
       func perimeter() -> Double {
            return 2 * pi * radius
        }
        
        func area() -> Double {
            return pi * radius * radius
        }
    }
    func display ()  {
        print("dien tich hinh tron la: \(area())")
        print("\nchu vi hinh tron la: \(perimeter())\n")
    }
}
let showCircle = Circle(radius: 9)


final class Square: Shape2D{
    var edge: Double
    init(edge: Double) {
        self.edge = edge
       func perimeter() -> Double {
            return edge * 4
       }
    
       func area() -> Double {
        return edge * edge
       }
    }
    func display ()  {
    print("chu vi hinh vuong la: \(perimeter())")
    print("dien tich hinh vuong la: \(area())\n")
    }
 }
 let showsQuare = Square(edge: 4)


 
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
    
    func area() -> Double {
        return 0.5 * (height * edgeC)
    }
    }
    
    func display() {
    print("\nchu vi hinh tam giac la: \(perimeter())")
    print("dien tich hinh tam giac la: \(area())")
    }
 }
let showTriangle = Triangle(edgeA: 2, edgeB: 5, edgeC: 6, height: 6)
 showTriangle.display()


class Shape3D: Shape {
    func volume() -> Double { //thể tích
        return volume()
    }
    
    override func area() -> Double {
        return area()
    }
}


 final class Globular: Shape3D{
    var radius: Double
    init(radius: Double){
        self.radius = radius
        func volume() -> Double {
            return 4/3 * pi * radius * radius * radius
        }
        
        func area() -> Double { // diệntisch mặt cầu
            return 4 * pi * radius * radius
        }
 
    }
 func display() {
    print("\nthe tich  hinh cau la: \(volume())")
    print("\ndien tich mat cau la:\(area())")
 }
 }
 let showGlobular = Globular(radius: 4)
 showGlobular.display()
 

 final class Cube: Shape3D{
 var edge: Double
 init(edge: Double){
 self.edge = edge
    
    func volum() -> Double {
        return edge * edge * edge
    }
    
    func area() -> Double { // diện tích bề mặt hình lập phương
        return 6 * edge * edge
    }
 }
 func display() {
 print("\ndien tich hinh be mat lap phuong: \(area())")
 print("the tich hinh lap phuong: \(volume())\n")
 }
 }
 let showcube = Cube(edge: 5.5)
 showcube.display()
 



