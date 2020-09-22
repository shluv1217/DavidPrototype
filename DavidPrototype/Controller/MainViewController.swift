//
//  ViewController.swift
//  DavidPrototype
//
//  Created by David Shin on 2020/09/21.
//  Copyright © 2020 David Shin. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let constants = Constants()
        
        titleLabel.text = constants.mainTitle
    }


}

