//
//  WelcomeViewController.swift
//  ShivanisBachelorette
//
//  Created by Vandita Sharma on 6/14/16.
//  Copyright © 2016 Vandita Sharma. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.orangeColor()
        // Do any additional setup after loading the view.
    }

    @IBAction func startPressed(sender: AnyObject) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let firstStepViewController = storyboard.instantiateViewControllerWithIdentifier("StepViewController") as! StepViewController
        firstStepViewController.step = 1
        navigationController?.pushViewController(firstStepViewController, animated: true)
    }

//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        <#code#>
//    }
}
