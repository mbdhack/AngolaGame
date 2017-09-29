//
//  LandingViewController.swift
//  AngolaGame
//
//  Created by admin on 9/29/17.
//  Copyright © 2017 davCorp. All rights reserved.
//

import UIKit

class LandingViewController: UIViewController {

    @IBOutlet weak var lateastScore: UILabel!
    @IBOutlet weak var currentScore: UILabel!
    @IBOutlet weak var playButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttondesign(button: [playButton])
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func buttondesign(button: [UIButton]){
        for item in button {
            item.layer.borderWidth = 5
            item.layer.borderColor = UIColor.orange.cgColor
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
