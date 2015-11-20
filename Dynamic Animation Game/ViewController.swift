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
    @IBAction func dropDown(sender: AnyObject) {
        drop()
    }
    //TODO: add gravity

    @IBOutlet weak var smallBox: UIView!
    var dropSize: CGSize {
        let size = backgroundView.bounds.size.width / CGFloat(dropRow)
        return CGSize(width: size, height: size)
    }
    var dropRow = 10
    
    func drop() {
        var frame = CGRect(origin: CGPointZero, size: dropSize)
        frame.origin.x = CGFloat.random(dropRow) * dropSize.width
        print(frame.origin.x)
        let dropView = UIView(frame: frame)
        dropView.backgroundColor = UIColor.random
        backgroundView.addSubview(dropView)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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
        switch arc4random()%5 {
            case 0: return UIColor.greenColor()
            case 1: return UIColor.grayColor()
            case 2: return UIColor.blackColor()
            case 3: return UIColor.brownColor()
            case 4: return UIColor.redColor()
            default: return UIColor.purpleColor()
        }
    }
}
