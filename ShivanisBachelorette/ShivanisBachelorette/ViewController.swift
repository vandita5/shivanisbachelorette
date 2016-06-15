//
//  ViewController.swift
//  ShivanisBachelorette
//
//  Created by Vandita Sharma on 6/14/16.
//  Copyright © 2016 Vandita Sharma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonPressed(sender: AnyObject) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let viewController  = storyboard.instantiateViewControllerWithIdentifier("ViewController") as! ViewController
        navigationController?.pushViewController(viewController, animated: true)
    }

}
