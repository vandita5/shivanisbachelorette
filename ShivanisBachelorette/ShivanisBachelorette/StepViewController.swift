//
//  StepViewController.swift
//  ShivanisBachelorette
//
//  Created by Vandita Sharma on 6/14/16.
//  Copyright © 2016 Vandita Sharma. All rights reserved.
//

import UIKit

class StepViewController: UIViewController {

    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var stepTextView: UITextView!
    @IBOutlet weak var stepNumberLabel: UILabel!
    var step: Step!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 255/255, green: 89/255, blue: 108/255, alpha: 1)
        stepNumberLabel.text = "\(step.number)"
        stepTextView.text = step.text
        stepNumberLabel.font = UIFont.systemFontOfSize(72)
        stepTextView.font = UIFont.systemFontOfSize(25)
        nextButton.setTitle(step.nextButtonText, forState: .Normal)
        nextButton.titleLabel!.font = UIFont.systemFontOfSize(25)
    }
    
    func nextStep() -> Step {
        if step.number == 1 {
            return Step(number: 2, text: "Go to the airport by 1730 hrs. American Airlines departure terminal.", nextButtonText: "At the airport!")
        } else if step.number == 2 {
            return Step(number: 3, text: "Post “Green Cats are super cute!” to facebook.", nextButtonText: "Next")
        } else if step.number == 3 {
            return Step(number: 4, text: "Print your boarding pass and head to your gate. Confirmation ID: OINKQD", nextButtonText: "Next")
        } else if step.number == 4 {
            return Step(number: 5, text: "Take an in-flight selfie and post it on instagram. ", nextButtonText: "Next")
        } else if step.number == 5 {
            return Step(number: 6, text: "Run to Hertz Car Rental office  and get your ride.", nextButtonText: "Next")
        }else {
            preconditionFailure("Invalid Step Number")
        }
    }

    @IBAction func buttonPressed(sender: AnyObject) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let nextStepViewController = storyboard.instantiateViewControllerWithIdentifier("StepViewController") as! StepViewController
        nextStepViewController.step = nextStep()
        navigationController?.pushViewController(nextStepViewController, animated: true)
    }
}
