//
//  ExitViewController.swift
//  ShivanisBachelorette
//
//  Created by Vandita Sharma on 6/22/16.
//  Copyright © 2016 Vandita Sharma. All rights reserved.
//

import UIKit

class ExitViewController: UIViewController {
    @IBOutlet weak var exitText: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 255/255, green: 89/255, blue: 108/255, alpha: 1)
        exitText.font = UIFont.systemFontOfSize(60)
        exitText.textColor = UIColor.whiteColor()
    }
}
