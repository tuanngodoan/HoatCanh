//
//  ViewController.swift
//  HoatCanh
//
//  Created by Doãn Tuấn on 11/27/16.
//  Copyright © 2016 doantuan. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {

    var bird  = UIImageView()
    var audio = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        audio = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: Bundle.main.path(forResource: "Song", ofType: ".mp3")!))
        
        audio.delegate = self
        
        drawJungle()
        drawBird()
        flyUpAndDown()
       // playSound()
        
        
    }
    
    func drawJungle(){
        
        let backGround = UIImageView(image: UIImage(named: "jungle.jpg"))
        backGround.frame = self.view.bounds
        backGround.contentMode = .scaleAspectFill
        self.view.addSubview(backGround)
    }
    
    func drawBird(){
        bird  = UIImageView(frame: CGRect(x: 0.0, y: 0.0, width: 110, height: 68))
        bird.contentMode = .scaleAspectFill
        bird.animationImages = [UIImage(named: "bird0")!,
                                UIImage(named: "bird1")!,
                                UIImage(named: "bird2")!,
                                UIImage(named: "bird3")!,
                                UIImage(named: "bird4")!,
                                UIImage(named: "bird5")!
                                ]
        bird.animationRepeatCount = 0
        bird.animationDuration = 1
        bird.startAnimating()

        self.view.addSubview(bird)
  
    }
    
    func flyUpAndDown(){
        self.bird.transform = self.bird.transform.rotated(by: 30*3.14/180)
        UIView.animate(withDuration: 5, animations: {
            self.bird.center  = CGPoint(x: self.view.bounds.width - 50, y : self.view.bounds.height - 50)
        }, completion: {(finished) in
            
            self.bird.transform = self.bird.transform.scaledBy(x: -1, y: 1).concatenating(self.bird.transform.rotated(by:-20*3.14/180.0))
            
            UIView.animate(withDuration: 5, animations: {
                self.bird.center = CGPoint(x: 50, y: self.view.bounds.height - 50)
                
            }, completion: { (finished) in
                self.bird.transform = self.bird.transform.scaledBy(x: 1, y: 1).concatenating(self.bird.transform.rotated(by: (45*3.14)/180))
                
                UIView.animate(withDuration: 5, animations: {
                    self.bird.center = CGPoint(x: self.view.bounds.width - 50, y: 50)
                    
                }, completion: { (finished) in
                    self.bird.transform = CGAffineTransform.identity
                    self.bird.transform = self.bird.transform.scaledBy(x: -1, y: 1).concatenating(self.bird.transform.rotated(by: 20*3.14/180.0))
                    UIView.animate(withDuration: 5, animations: {
                        self.bird.center = CGPoint(x:50, y: 50)
                        
                    }, completion: { (finished) in
                        self.bird.transform = CGAffineTransform.identity
                        self.flyUpAndDown()
                    })

                })

            })
            
        })
    }
    
   func playSound(){
     audio.play()
    }
    

}

