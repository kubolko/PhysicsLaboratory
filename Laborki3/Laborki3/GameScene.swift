//
//  GameScene.swift
//  Laborki3
//
//  Created by Jakub Sumionka on 17/12/2020.
//

import SpriteKit
import GameplayKit
import GLKit

class GameScene: SKScene {
    
    var równia = SKSpriteNode(color: .white, size: CGSize(width: 1200, height: 10))
    var body = SKSpriteNode(color: .black, size: CGSize(width: 100, height: 100))
    var number: String = ""
    
    var oldVelocity: CGVector?
    var newVelocity: CGVector?
    var errorVelocity = CGVector(dx: 0, dy: 0)
    
    var newSpeed: CGFloat?
    var oldSpeed: CGFloat?
    var errorSpeed = CGFloat(0)
    
    override func didMove(to view: SKView) {
        let background = SKSpriteNode(imageNamed: "PG")
            background.position = CGPoint(x: size.width/2, y: size.height/2)
        background.size = CGSize(width: 1366, height: 1024)
            addChild(background)
        
        
        równia.name = "Równia pochyła"
        równia.color = SKColor.white
        równia.position = CGPoint(x: 400, y: 140)
        równia.zRotation = CGFloat.pi/12 * (-1)
        równia.zPosition = 1
        równia.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 1200, height: 10))
        równia.physicsBody?.isDynamic = false
        
        body.name = "Ciało"
        body.position = CGPoint(x: 150, y: 700)
        body.zRotation = CGFloat.pi/6*(-1)
        body.zPosition = 1
        body.physicsBody = SKPhysicsBody(rectangleOf: body.size)
        body.physicsBody?.mass = 20
        addChild(równia)
        addChild(body)
    }
    func distance(point1: CGPoint, point2: CGPoint) -> CGFloat {
        let dx = point1.x - point2.x
        let dy = point1.y - point2.y
        return sqrt(dx * dx + dy * dy)
    }
    func subtractvectors(vector1: CGVector, vector2: CGVector) -> CGVector {
        let dx = vector1.dx - vector2.dx
        let dy = vector2.dy - vector2.dy
        return CGVector(dx: dx, dy: dy)
    }
    func subtractModules(vector1: CGVector, vector2: CGVector) -> CGFloat{
        let module1 = sqrt((vector1.dx * vector1.dx) + (vector1.dy * vector1.dy))
        let module2 = sqrt((vector2.dx * vector2.dx) + (vector1.dy * vector1.dy))
        return CGFloat(module1 - module2)
    }
    func getModule(vector: CGVector) -> CGFloat{
        let module = sqrt((vector.dx * vector.dx) + ((vector.dy * vector.dy)))
        return module
    }
    
    func touchDown(atPoint pos : CGPoint) {

    }
    
    func touchMoved(toPoint pos : CGPoint) {

    }
    
    func touchUp(atPoint pos : CGPoint) {

    }
    
    override func mouseDown(with event: NSEvent) {
        self.touchDown(atPoint: event.location(in: self))
    }
    
    override func mouseDragged(with event: NSEvent) {
        self.touchMoved(toPoint: event.location(in: self))
    }
    
    override func mouseUp(with event: NSEvent) {
        self.touchUp(atPoint: event.location(in: self))
    }
    
    override func keyDown(with event: NSEvent) {
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
        newVelocity = body.physicsBody?.velocity
        print(subtractModules(vector1: newVelocity ?? errorVelocity, vector2: oldVelocity ?? errorVelocity))
        oldVelocity = body.physicsBody?.velocity
        
        if body.position.y < 0{
            body.removeFromParent()
        }
    }
    
}
extension Int {
    static func parse(from string: String) -> Double? {
        return Double(string.components(separatedBy: CharacterSet.decimalDigits.inverted).joined())
    }
}
