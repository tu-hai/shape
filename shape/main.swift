//
//  main.swift
//  Shape
//
//  Created by WITZ on 7/23/18.
//  Copyright © 2018 WITZ. All rights reserved.
import Foundation

class Shape {
    func area() -> Double {
        return 0.0
    }
}


class Shape2D: Shape {
    func perimeter() -> Double {
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
        return 2 * .pi * radius
    }
        
    override func area() -> Double {
        return .pi * radius * radius
    }
}


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


class Triangle: Shape2D {
    var edgeA: Double
    var edgeB: Double
    var edgeC: Double
    
    init?(edgeA: Double, edgeB: Double, edgeC: Double) {
        guard Triangle.isValidParameters(edgeA: edgeA, edgeB: edgeB, edgeC: edgeC) else { return nil }
        
        self.edgeA = edgeA
        self.edgeB = edgeB
        self.edgeC = edgeC
    }
    
    override func perimeter() -> Double {
        return edgeC + edgeB + edgeA
        
    }
    
    override func area() -> Double {
        let  halfPerimeter: Double = perimeter() * 0.5 // dùng 1 nữa chu vi để tính diện tích
        
        return sqrt(halfPerimeter * (halfPerimeter - edgeA) * (halfPerimeter - edgeB) * (halfPerimeter - edgeC))
        // công thức heron dùng 1 nữa chu vi và 3 cạnh để tính S tam giác
    }
    
    static func isValidParameters(edgeA: Double, edgeB: Double, edgeC: Double) -> Bool {
        // Check valid
        
        return true
    }
}


///////////3D///////////////////////
class Globular: Shape3D{
    var radius: Double
    
    init(radius: Double){
        self.radius = radius
    }
    override func volume() -> Double {
        return 4/3 * .pi * radius * radius * radius
    }
    override func area() -> Double { // diện tich mặt cầu
        return round( 4 * .pi * radius * radius)
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


enum ShapesType: Int {
    case circle
    case square
    case triangle
    case globular
    case cube
}
// cách dùng enum


class RandomCreateShapes {
    var inputValueForShapes: Double = Double(arc4random_uniform(99) + 1) //giá trị nhâp vào ngẫu nhiên 1...100 của các loại hình
    var listShapes: [Shape] = []  // mảng danh sách chứa các loại hình
    var count = 0
    
    func getR() -> ShapesType? {
        let randomNumber: Int =  Int(arc4random_uniform(27) + 69) // số nguyên T bất kỳ từ 69...96
        let  surplus: Int = randomNumber % 5 // so du khi T % 5
        return ShapesType(rawValue: surplus)
    }
    
    func addShapesToList()  {
        guard count < 20 else { return }
        guard let randomShapeType = getR() else { return }
        
        switch randomShapeType {
        case .circle : listShapes.append(Circle(radius: inputValueForShapes))
        case .square : listShapes.append(Square(edge: inputValueForShapes))
        case .triangle :
            if let triangle = Triangle(edgeA: inputValueForShapes, edgeB: inputValueForShapes, edgeC: inputValueForShapes) {
                listShapes.append(triangle)
            }
        case .globular : listShapes.append(Globular(radius: inputValueForShapes))
        case .cube : listShapes.append(Cube(edge: inputValueForShapes))
        }
        count += 1
        
        print(randomShapeType)
        
        addShapesToList()
    }
}

