//
//  ViewController.swift
//  AngolaGame
//
//  Created by admin on 9/2/17.
//  Copyright © 2017 davCorp. All rights reserved.
//

import UIKit
import GameplayKit


class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var guideLabel: UILabel!
    @IBOutlet weak var backgroundImage: UIImageView!
  
    var time: Timer!
    var countTime = 15
    var minutes = String()
    var seconds = String()
    var scoretosend = 0
    var score = 0
    let imagevIew = UIImageView()
    let ac =  UIAlertController()

    
    override func viewDidLoad() {
        imagevIew.image = UIImage.init(named: "bug")
        super.viewDidLoad()
        self.imagePosition()
         time = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updatetime), userInfo: nil, repeats: true)
         startTimer()
        
    }
    func imagePosition(){
        let imageHeight = CGFloat(100.0)
        let imageWidth = CGFloat(100.0)
        let height = UIScreen.main.bounds.size.height - imageHeight
        let width = UIScreen.main.bounds.size.width - imageWidth
        let x = CGFloat(CGFloat(arc4random()).truncatingRemainder(dividingBy: width))
        let y = CGFloat(CGFloat(arc4random()).truncatingRemainder(dividingBy: height))
        imagevIew.frame = CGRect(x :x, y:y, width: imageWidth,height: imageHeight)
        self.view.addSubview(imagevIew)
    }
    func submit(_ action : UIAlertAction! = nil){
        let storyboard = UIStoryboard(name: "Main", bundle: nil);
        let vc = storyboard.instantiateViewController(withIdentifier: "nextViewLavel")
        self.present(vc, animated: true, completion: nil)
    }
    @ objc func updatetime(){
        self.timerLabel.text = "\(timeFormatted(countTime))"
        if countTime !=  0 {
            countTime -= 1
        }else {
            endTimer()
//            alertViewtoshow()
        }
    }
    func startTimer() {
        if time == nil {
            time = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updatetime), userInfo: nil, repeats: false)
        }
    }
    func endTimer() {
        if time != nil {
            time.invalidate()
        }
    }
    func restartTimer(){
        countTime = 10
        self.timerLabel.text = "\(timeFormatted(self.countTime))"
        imagePosition()
    }
    func resetScore(completed: @escaping Completed){
        score = 0
        completed()
    }
    func timeFormatted(_ totalSeconds: Int) -> String {
        let seconds: Int = totalSeconds % 60
        return  String(format: "%2d", seconds)
    }
    func checkScore()-> Bool{
        if score == 5 {
            self.scoretosend = score
            return true
        } else {
            return false
        }
    }
//    func alertViewtoshow(){
////        userDefaults.set(score, forKey: "ScoreData")
////        self.savehighscore()
//        let checScoreStatus = self.checkScore()
//        if checScoreStatus == true {
//            self.ac = UIAlertController(title: self.title, message: "You have achieved a score of: \(self.score)", preferredStyle: .alert)
//            self.ac.addAction(UIAlertAction(title: "\(submitButtonTitlte)", style: .default, handler: self.submit))
//            self.present(self.ac, animated: true, completion: {
//            })
//        }else {
//            let title = "GAME OVER"
//            let message = "Your score is: \(self.score)"
//            let popup = PopupDialog(title: title, message: message, buttonAlignment: .horizontal, transitionStyle: .zoomIn, gestureDismissal: false) {
//                print("Completed")
//            }
//            let buttonOne = DefaultButton(title: "HOME") {
//                let destinationVC = self.storyboard?.instantiateViewController(withIdentifier: "Main") as! LandingViewController
//                self.present(destinationVC, animated: true, completion: nil)
//            }
//            popup.addButtons([buttonOne])
//            self.present(popup, animated: true, completion: nil)
//        }
//    }

//    func savehighscore(){
//        var highscore = userDefaults.integer(forKey: "HighScoreData")
//        if current_score > highscore {
//            highscore = current_score
//            userDefaults.set(highscore, forKey: "HighScoreData")
//            userDefaults.synchronize()
//        }
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }


}

