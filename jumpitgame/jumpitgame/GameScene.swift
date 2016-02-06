//
//  GameScene.swift
//  jumpitgame
//
//  Created by ggc on 26/8/14.
//  Copyright (c) 2014 ggc. All rights reserved.
//

import SpriteKit

enum ColliderType: UInt32 {
    case Bridge = 1
    case Idiot = 2
    case Obstable = 4
}

class GameScene: SKScene, SKPhysicsContactDelegate {

    var delta_t = 0.1
    var start_t = 0.0
    var idx = 0
    var maxidx = 15
    
    let imgnameprefix = "villager_walk_"
    var imgnamesub = "2"
    
    var toSpwan = false
    
    var sprite:SKSpriteNode!
    var bridge:SKSpriteNode!
    var slimy:SKSpriteNode!
    
    func reloadNode(name:NSString){
        
        if (name == "idiot")
        {
            //spite
            let spritetexture = SKTexture(imageNamed: "villager_walk_20000")
            spritetexture.filteringMode = SKTextureFilteringMode.Nearest
            sprite = SKSpriteNode(texture: spritetexture)
            sprite.name = name
            sprite.size = CGSizeMake(91.0, 163.0)
            sprite.setScale(0.2)
            sprite.physicsBody = SKPhysicsBody(rectangleOfSize: CGSizeMake(sprite.size.width, sprite.size.height))
            sprite.physicsBody.dynamic = true;
            sprite.physicsBody.categoryBitMask = ColliderType.Idiot.toRaw()
            sprite.physicsBody.collisionBitMask = ColliderType.Obstable.toRaw()
            sprite.physicsBody.contactTestBitMask = ColliderType.Obstable.toRaw()
            sprite.position = CGPoint(x: self.frame.width*0.5, y: self.frame.height*0.75)
            sprite.zPosition = 20;
            self.addChild(sprite)
            
        } else if (name == "baga") {
            /*
            let sprite = SKSpriteNode(imageNamed:"Spaceship")
            sprite.xScale = 0.5
            sprite.yScale = 0.5
            sprite.position = location
            let action = SKAction.rotateByAngle(CGFloat(M_PI), duration:1)
            sprite.runAction(SKAction.repeatActionForever(action))
            self.addChild(sprite)
            */
            let baga = SKSpriteNode(imageNamed: "villager_walk_20001")
            baga.size = CGSizeMake(91.0, 163.0)
            baga.setScale(0.13)
            baga.physicsBody = SKPhysicsBody(rectangleOfSize: CGSizeMake(baga.size.width, baga.size.height))
            baga.physicsBody.dynamic = true
            baga.position = CGPoint(x: CGFloat(arc4random_uniform(UInt32(self.frame.width))),
                y: CGFloat(arc4random_uniform(UInt32(self.frame.height))))
            //baga.position = CGPointMake(400, self.frame.height*0.7)
            self.addChild(baga)
            
            print("add baga:  ")
            println(baga.position)
        }
    }
    
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        
        //setup physics
        self.physicsWorld.gravity = CGVector(0.0, -2.0)
        self.physicsWorld.contactDelegate = self
        
        //setup background
        let bg = SKSpriteNode(imageNamed: "bg")
        bg.name = "bg"
        bg.anchorPoint = CGPointZero
        bg.xScale = 1
        bg.yScale = 1
        self.addChild(bg)
        
        let myLabel = SKLabelNode(fontNamed:"Chalkduster")
        myLabel.text = "Touch here, nerd!";
        myLabel.fontSize = 20;
        myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:60);
        bg.addChild(myLabel)


        //ground
        let bridgetexture = SKTexture(imageNamed: "Bridge")
        bridgetexture.filteringMode = SKTextureFilteringMode.Nearest
        bridge = SKSpriteNode(texture: bridgetexture, color: SKColor.redColor(), size: CGSizeMake(view.bounds.width, 100))
        bridge.physicsBody = SKPhysicsBody(rectangleOfSize: CGSizeMake(view.bounds.width, 16.0))
        //bridge.physicsBody = SKPhysicsBody()
        //bridge.setScale(0.155)
        bridge.physicsBody.dynamic = false
        bridge.physicsBody.friction = 0.2
        bridge.position = CGPoint(x: self.frame.width*0.5, y:100)
        
        self.addChild(bridge)
        
        
        //sprite
        reloadNode("idiot")
        //slimy
        //var slimypath = NSBundle.mainBundle().pathForResource("villager_death_70000", ofType: "png")
        //NSLog(slimypath.stringByStandardizingPath)
        //let slimytexture = SKTexture(imageNamed: slimypath.stringByStandardizingPath)
        //let slimytexture = SKTexture(imageNamed: mypath)
        //slimytexture.filteringMode = SKTextureFilteringMode.Nearest
        //slimy = SKSpriteNode(texture: slimytexture)

        //obstacle
        slimy = SKSpriteNode(imageNamed: "villager_death_70015")
        slimy.size = CGSizeMake(91.0, 163.0)
        slimy.name = "obstacle"
        slimy.setScale(0.5)
        slimy.physicsBody = SKPhysicsBody(rectangleOfSize: CGSizeMake(slimy.size.width, slimy.size.height) )
        slimy.physicsBody.dynamic = false;
        slimy.physicsBody.categoryBitMask = ColliderType.Obstable.toRaw()
        slimy.physicsBody.collisionBitMask = ColliderType.Idiot.toRaw()
        slimy.physicsBody.contactTestBitMask = ColliderType.Idiot.toRaw()
        
        slimy.position = CGPoint(x: self.frame.width*0.43, y: self.frame.height*0.4)
        self.addChild(slimy)
    }
    
    
    // class func
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        /* Called when a touch begins */
        var shift = 2.8;
        
        for touch: AnyObject in touches {
            let location = touch.locationInNode(self)
            
            /*
            let sprite = SKSpriteNode(imageNamed:"Spaceship")
            sprite.xScale = 0.1
            sprite.yScale = 0.1
            sprite.position = location
            let action = SKAction.rotateByAngle(CGFloat(M_PI), duration:1)
            sprite.runAction(SKAction.repeatActionForever(action))
            self.addChild(sprite)
             */
            
            if (location.y < self.bridge.position.y) {
                // touchpoint belows sprite
                self.sprite.physicsBody.velocity = CGVectorMake(0,0)
                self.sprite.physicsBody.applyImpulse(CGVectorMake(0,8))
            }
            
            if (location.y > 100 && location.y < 180) {
                
                if( location.x > self.bridge.position.x) {
                    shift *= -1;
                    self.imgnamesub = "6"
                }else{
                    self.imgnamesub = "2"
                }
                
                self.sprite.physicsBody.velocity = CGVectorMake(0,0)
                self.sprite.physicsBody.applyImpulse(CGVectorMake(shift,0))
            }
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        var imgname = ""
        
        for i in 1...(4-countElements("\(idx)")) {
            imgname += "0"
        }
        imgname = self.imgnameprefix + self.imgnamesub + imgname + "\(idx)"
        
        if (self.sprite.position.x > self.frame.width || self.sprite.position.y < 0){
            self.sprite.removeFromParent()
            reloadNode(self.sprite.name)
        }
        
        if (currentTime - start_t > delta_t) {
            self.sprite.texture = SKTexture(imageNamed: imgname)
            //self.slimy.texture = SKTexture(imageNamed: imgname3)
            idx = (idx+1)%maxidx;
            start_t = currentTime;
        }
        
        if (toSpwan){
            reloadNode("baga")
            toSpwan = false
        }
    }
    
    func didBeginContact(contact: SKPhysicsContact) {
        if (contact.bodyA.node.name != nil && contact.bodyB.node.name != nil) {
            
            print("a:"+contact.bodyA.node.name)
            println(", b:" + contact.bodyB.node.name)
            
            if (contact.bodyB.node.name == "obstacle" || contact.bodyA.node.name == "obstacle") {
                println("collide!")
                //reloadNode("baga")
                toSpwan = true
            }
        }
    }

    func didEndContact(contact: SKPhysicsContact) {
    }
}
