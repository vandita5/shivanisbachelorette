//
//  WelcomeViewController.swift
//  ShivanisBachelorette
//
//  Created by Vandita Sharma on 6/14/16.
//  Copyright © 2016 Vandita Sharma. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {


    @IBOutlet weak var startButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        startButton.setTitle("Start", forState: .Normal)
        startButton.titleLabel!.font = UIFont.systemFontOfSize(25)
        startButton.backgroundColor = UIColor(red: 255/255, green: 89/255, blue: 108/255, alpha: 1)
    }
    
    @IBAction func startPressed(sender: AnyObject) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let firstStepViewController = storyboard.instantiateViewControllerWithIdentifier("StepViewController") as! StepViewController
        firstStepViewController.step = Step(number: 1, text: "Pack your things. It’s time!\n*Dont forget to pack your toothbrush.", nextButtonText: "Next")
        navigationController?.pushViewController(firstStepViewController, animated: true)
    }

//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        <#code#>
//    }
}
