//
//  ViewController.swift
//  Dynamic Animation Game
//
//  Created by Liguo Jiao on 21/11/15.
//  Copyright (c) 2015 Liguo Jiao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var backgroundView: UIView!
    
    @IBOutlet var score: UILabel!
    
    let gravity = UIGravityBehavior()
    var dropRow = 10
    var location = CGPoint(x: 0, y: 0)
    var scoreCounter = 0
    var speedTimer = 1.5
    var dropSize: CGSize {
        let size = (backgroundView.bounds.size.width / CGFloat(dropRow))*2
        return CGSize(width: size, height: size)
    }
    
    lazy var animator: UIDynamicAnimator = {
        let createDynamicAnimator = UIDynamicAnimator(referenceView: self.backgroundView)
        return createDynamicAnimator
    }()
    lazy var collider: UICollisionBehavior = {
        let createCollider = UICollisionBehavior()
        createCollider.translatesReferenceBoundsIntoBoundary = true
        return createCollider
    }()
    
    func drop() {
        var frame = CGRect(origin: CGPointZero, size: dropSize)
        frame.origin.x = CGFloat.random(dropRow) * dropSize.width
        let dropView = UIView(frame: frame)
       // print(frame.origin.x)
        let tap = UITapGestureRecognizer(target: self, action: Selector("scored:"))
        print(dropView.frame.origin.y)
        dropView.backgroundColor = UIColor.random
        dropView.contentMode = UIViewContentMode.ScaleToFill
        dropView.addGestureRecognizer(tap)
        backgroundView.addSubview(dropView)
        gravity.addItem(dropView)
        //collider.addItem(dropView)
    }
    func scored(tap: UITapGestureRecognizer){
        scoreCounter += 1
        score.text = "\(scoreCounter)"
        if tap.state == .Ended {
            tap.view?.removeFromSuperview()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        var timer = NSTimer()
        
        animator.addBehavior(gravity)
        animator.addBehavior(collider)
        timer.invalidate()
        timer = NSTimer.scheduledTimerWithTimeInterval(speedTimer, target: self, selector: "drop", userInfo: nil, repeats: true)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

private extension CGFloat {
    static func random(max: Int) -> CGFloat {
        return CGFloat(arc4random() % UInt32(max))
    }
}

private extension UIColor {
    // TODO: Change to UIImage
    class var random: UIColor {
        switch arc4random()%6 {
            case 0: return UIColor(patternImage: UIImage(named: "lee.png")!)
            case 1: return UIColor(patternImage: UIImage(named: "tangiwai.png")!)
            case 2: return UIColor(patternImage: UIImage(named: "tom.png")!)
            case 3: return UIColor(patternImage: UIImage(named: "rodrigo.png")!)
            case 4: return UIColor(patternImage: UIImage(named: "raul.png")!)
            case 5: return UIColor(patternImage: UIImage(named: "michal.png")!)
            case 6: return UIColor(patternImage: UIImage(named: "felix.png")!)
            default: return UIColor(patternImage: UIImage(named: "will.png")!)
        }
    }
}
