//
//  CheatScreenViewController.swift
//  ShivanisBachelorette
//
//  Created by Vandita Sharma on 6/16/16.
//  Copyright © 2016 Vandita Sharma. All rights reserved.
//

import UIKit

class CheatScreenViewController: UIViewController {
    
    
    @IBOutlet weak var reprimandText: UITextView!
    @IBOutlet weak var dismissButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        dismissButton.setTitle(">.<", forState: .Normal)
        dismissButton.titleLabel!.font = UIFont.systemFontOfSize(25)
        dismissButton.backgroundColor = UIColor(red: 255/255, green: 89/255, blue: 108/255, alpha: 1)
        reprimandText.font = UIFont.systemFontOfSize(22)
        reprimandText.editable = false
        reprimandText.userInteractionEnabled = false
    }
    @IBAction func dismissButtonPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}
