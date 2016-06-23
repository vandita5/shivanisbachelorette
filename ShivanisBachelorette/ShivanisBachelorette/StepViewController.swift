//
//  StepViewController.swift
//  ShivanisBachelorette
//
//  Created by Vandita Sharma on 6/14/16.
//  Copyright © 2016 Vandita Sharma. All rights reserved.
//

import UIKit

class StepViewController: UIViewController {

    var overrideVar: Bool = false
    var timer = NSTimer()
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var stepTextView: UITextView!
    @IBOutlet weak var stepNumberLabel: UILabel!
    var step: Step!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 255/255, green: 89/255, blue: 108/255, alpha: 1)
        stepNumberLabel.text = "\(step.number)"
        stepTextView.text = step.text
        stepTextView.editable = false
        stepTextView.userInteractionEnabled = false
        stepNumberLabel.font = UIFont.systemFontOfSize(72)
        stepTextView.font = UIFont.systemFontOfSize(25)
        nextButton.setTitle(step.nextButtonText, forState: .Normal)
        nextButton.titleLabel!.font = UIFont.systemFontOfSize(25)
        nextButton.layer.borderColor = UIColor.whiteColor().CGColor
        nextButton.layer.borderWidth = 0.7
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .Plain, target: nil, action: nil)
    }
    
    func pop() {
        navigationController?.popViewControllerAnimated(true)
    }
    
    func nextStep() -> Step? {
        
        if step.number == 1 {
            if overrideVar {
                overrideVar = false
                return Step(number: 2, text: "Go to the airport by 1730 hrs. American Airlines departure terminal.", nextButtonText: "At the airport!")
            } else {
                let dateNow = NSDate()
                let components: NSDateComponents = NSDateComponents()
                components.setValue(2016, forComponent: NSCalendarUnit.Year)
                components.setValue(6, forComponent: NSCalendarUnit.Month)
                components.setValue(16, forComponent: NSCalendarUnit.Day)
                let expirationDate = NSCalendar.currentCalendar().dateFromComponents(components)
                if NSCalendar.currentCalendar().compareDate(dateNow, toDate: expirationDate!, toUnitGranularity: .Day) == .OrderedSame {
                    return Step(number: 2, text: "Go to the airport by 1730 hrs. American Airlines departure terminal.", nextButtonText: "At the airport!")
                } else {
                    return nil
                }
            }

        } else if step.number == 2 {
            if overrideVar {
                overrideVar = false
                return Step(number: 3, text: "Post “Green Cats are super cute!” to facebook.", nextButtonText: "Done!")
            } else {
                if let inAirport = LocationClient.sharedInstance.inAirport {
                    if inAirport {
                        return Step(number: 3, text: "Post “Green Cats are super cute!” to facebook.", nextButtonText: "Done!")
                    } else {
                        return nil
                    }
                } else {
                    return nil
                }
            }
        } else if step.number == 3 {
            return Step(number: 4, text: "Print your boarding pass and head to your gate. Confirmation ID: OINKQD", nextButtonText: "In the flight!")
        } else if step.number == 4 {
            return Step(number: 5, text: "Take an in-flight selfie and post it on instagram. ", nextButtonText: "Done!")
        } else if step.number == 5 {
            return Step(number: 6, text: "Wait until you reach the final destination.", nextButtonText: "Here, bitches!")
        } else if step.number == 6 {
            if overrideVar {
                overrideVar = false
                return Step(number: 7, text: "Run to Hertz Car Rental office and get your ride.", nextButtonText: "Ready to go!")
            } else {
                if let atDestination = LocationClient.sharedInstance.atDestination {
                    if atDestination {
                        return Step(number: 7, text: "Run to Hertz Car Rental office and get your ride.", nextButtonText: "Ready to go!")
                    } else {
                        return nil
                    }
                } else {
                    return nil
                }
            }
        } else if step.number == 7 {
            return Step(number: 8, text: "Head to address received in text.\r*No text? Complete facebook and insta tasks.", nextButtonText: "I'm here!")
        } else if step.number == 8 {
            return Step(number: 9, text: "Give your name at Reception Desk and follow their directions. We're done here!", nextButtonText: "Finish!")
        }else {
            return nil
        }
    }

//    @IBAction func forcePressed(sender: AnyObject) {
//        print("released")
//        timer.invalidate()
//        performNextStep()
//    }
//    
    func performNextStep() {
        guard let nextStep = nextStep() else {
            cheatScreens()
            return
        }
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let nextStepViewController = storyboard.instantiateViewControllerWithIdentifier("StepViewController") as! StepViewController
        nextStepViewController.step = nextStep
        navigationController?.pushViewController(nextStepViewController, animated: true)
    }
    
    func overrideConditions() {
        print("force touch")
        overrideVar = true
    }
    @IBAction func buttonTouchDown(sender: AnyObject) {
        print("action")
        self.performSelector(#selector(overrideConditions), withObject: nil, afterDelay: 1)
    }
    @IBAction func buttonPressed(sender: AnyObject) {
        print("pressed")
        NSObject.cancelPreviousPerformRequestsWithTarget(self, selector: #selector(overrideConditions), object: nil)
        performNextStep()
    }
    
    func cheatScreens() {
//        let alertController = UIAlertController(title: "NO", message: "Dont", preferredStyle: UIAlertControllerStyle.Alert)
//        let ok = UIAlertAction(title: "ok", style: UIAlertActionStyle.Default, handler: nil)
//        alertController.addAction(ok)
//        presentViewController(alertController, animated: true, completion: nil)

        if step.number == 9 {
            let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
            let exitViewController = storyboard.instantiateViewControllerWithIdentifier("ExitViewController") as! ExitViewController
            navigationController?.pushViewController(exitViewController, animated: true)
        } else {
            let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
            let cheatScreenViewController = storyboard.instantiateViewControllerWithIdentifier("CheatScreenViewController") as! CheatScreenViewController
            presentViewController(cheatScreenViewController, animated: true, completion: nil)
        }
    }
    
}
