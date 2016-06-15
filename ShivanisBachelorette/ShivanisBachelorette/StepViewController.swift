//
//  StepViewController.swift
//  ShivanisBachelorette
//
//  Created by Vandita Sharma on 6/14/16.
//  Copyright © 2016 Vandita Sharma. All rights reserved.
//

import UIKit

class StepViewController: UIViewController {

    @IBOutlet weak var stepNumberLabel: UILabel!
    var step: Int!
    override func viewDidLoad() {
        super.viewDidLoad()

        stepNumberLabel.text = "\(step)"
    }
    
    

}
