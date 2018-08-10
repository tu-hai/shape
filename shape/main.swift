
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


class Square: Shape2D {
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
        guard Triangle.isValidTriangle(edgeA: edgeA, edgeB: edgeB, edgeC: edgeC) else { return nil }
        
        self.edgeA = edgeA
        self.edgeB = edgeB
        self.edgeC = edgeC
    }
    
    static func isValidTriangle(edgeA: Double, edgeB: Double, edgeC: Double) -> Bool {
        return edgeC + edgeB > edgeA && edgeA + edgeB > edgeC && edgeA + edgeC > edgeB
    }
    
    override func perimeter() -> Double {
        return edgeC + edgeB + edgeA
        
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
    case circle, square, triangle, globular, cube
}


class RandomCreateShapes {
    var inputValueForShapes: Double = Double(arc4random_uniform(99) + 1) //giá trị nhâp vào ngẫu nhiên 1...100 của các loại hình
    var listShapes: [Shape] = []  // mảng danh sách chứa các loại hình
    var count = 0
    
    func getShapesType() -> ShapesType? {
        let randomNumber = Int(arc4random_uniform(27) + 69) // số nguyên T bất kỳ từ 69...96
        let number: Int = randomNumber % 5
        return ShapesType(rawValue: number)
    }
   
    public func invalidInputForShapes() {
        let invalidInput = Int (inputValueForShapes.truncatingRemainder(dividingBy: 6.0))
        // )))
    }
    
    
    
    func addShapeToList()  {
        repeat {
            guard let randomShapeType = getShapesType() else { return }
            switch randomShapeType {
            case .circle:
                listShapes.append(Circle(radius: inputValueForShapes))
            case .square:
                listShapes.append(Square(edge: inputValueForShapes))
            case .globular:
                listShapes.append(Globular(radius: inputValueForShapes))
            case .cube:
                listShapes.append(Cube(edge: inputValueForShapes))
            case .triangle:
                if let triangle = Triangle(edgeA: inputValueForShapes, edgeB: inputValueForShapes, edgeC: inputValueForShapes) {
                    listShapes.append(triangle)
                }
            }
            count += 1
        } while count < 20 && inputValueForShapes > 10 //&& invalidInput % 6
    }

    
    func logInfoShapes() {
        var cubes: [Cube] = []
        var triangles: [Triangle] = []
        var squares: [Square] = []
        var globulars: [Globular] = []
        var circles: [Circle] = []
        
        for index in 0..<listShapes.count {
            let shape: Shape = listShapes[index]

            if let circle = shape as? Circle {
                circles.append(circle)
            }

            if let triangle = shape as? Triangle{
                triangles.append(triangle)
            }

            if let square = shape as? Square {
                squares.append(square)
            }

            if let globular = shape as? Globular{
                globulars.append(globular)
            }

            if let cube = shape as? Cube {
                cubes.append(cube)
            }
        }
        

        var totalVolumeCubes       = 0.0
        var totalAreaCubes         = 0.0
        
        var totalPrimeterCircles   = 0.0
        var totalAreaCircles       = 0.0
        
        var totalPrimeterSquares  = 0.0
        var totalAreaSquares      = 0.0
        
        var totalPrimeterTriangles = 0.0
        var totalAreaTriangles     = 0.0
        
        var totalVolumeGlobulars = 0.0
        var totalAreaGlobulars     = 0.0
        
        
        for index in 0..<cubes.count{
            let cube         = cubes[index]
            totalVolumeCubes = totalVolumeCubes + cube.volume()
            totalAreaCubes   = totalAreaCubes + cube.area()
        }
        
        for index in 0..<circles.count{
            let circle           = circles[index]
            totalPrimeterCircles = totalPrimeterCircles + circle.perimeter()
            totalAreaCircles     = totalAreaCircles + circle.area()
        }
        
        for index in 0..<squares.count{
            let square           = squares[index]
            totalPrimeterSquares = totalPrimeterSquares + square.perimeter()
            totalAreaSquares     = totalAreaSquares + square.area()
        }
        
        for index in 0..<globulars.count{
            let globular       = globulars[index]
            totalVolumeGlobulars = totalVolumeGlobulars + globular.volume()
            totalAreaGlobulars = totalAreaGlobulars + globular.area()
        }
        
        for index in 0..<triangles.count{
            let triangle           = triangles[index]
            totalPrimeterTriangles = totalVolumeGlobulars + triangle.perimeter()
            totalAreaTriangles     = totalAreaTriangles + triangle.area()
        }
        
        print("total of circles: \(circles.count)")
        print("total of trangles: \(triangles.count)")
        print("total of squares: \(squares.count)")
        print("total of globulars: \(globulars.count)")
        print("total of cubes: \(cubes.count)")
        
        
        print("\nthe total volumes of cube: \(totalVolumeCubes)")
        print("the total areas of cube: \(totalVolumeCubes)")
        
        print("\nthe total volumes of globulars: \(totalVolumeGlobulars)")
        print("the total areas of cube: \(totalAreaGlobulars)")
        
        print("\nthe total primeter of circles: \(totalPrimeterCircles)")
        print("the total areas of circles: \(totalAreaCircles)")
        
        print("\nthe total primeter of squares: \(totalPrimeterSquares)")
        print("the total areas of squares: \(totalAreaSquares)")
        
        print("\nthe total primeter of triangles: \(totalPrimeterTriangles)")
        print("the total areas of triangles: \(totalAreaTriangles)\n")
        
    }
}

let randomCreateShapes = RandomCreateShapes()
randomCreateShapes.addShapeToList()
randomCreateShapes.logInfoShapes()
