//
//  ViewController.swift
//  BirdFly
//
//  Created by HuuLuong on 7/18/16.
//  Copyright © 2016 CanhDang. All rights reserved.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {

    var bird = UIImageView()
    var audioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        drawJungle()
        addBird()
        flyUpAndDown()
        playSong()
        
    }

    func drawJungle() {
        let background = UIImageView(image: UIImage(named: "jungle.jpg"))
        background.frame = self.view.bounds
        background.contentMode = .ScaleAspectFill
        self.view.addSubview(background)
    }
    
    func addBird(){
        bird = UIImageView(frame: CGRectMake(0, 0, 110, 68))
        bird.animationImages = [UIImage(named:"bird1.png")!, UIImage(named:"bird2.png")!, UIImage(named:"bird3.png")!, UIImage(named:"bird4.png")!, UIImage(named:"bird5.png")!, UIImage(named:"bird6.png")!, UIImage(named:"bird7.png")!, UIImage(named:"bird8.png")!, UIImage(named:"bird9.png")!, UIImage(named:"bird10.png")!, UIImage(named:"bird11.png")!, UIImage(named:"bird12.png")!, UIImage(named:"bird13.png")!, UIImage(named:"bird14.png")!, UIImage(named:"bird15.png")!]
        bird.animationRepeatCount = 0
        bird.animationDuration = 1
        bird.startAnimating()
        self.view.addSubview(bird)
    }
    
    func flyUpAndDown(){
        self.bird.transform = CGAffineTransformMakeRotation(45)
        UIView.animateWithDuration(5, animations: {
            self.bird.center = CGPointMake(self.view.bounds.size.width - 50, self.view.bounds.size.height - 50)
            
            }) { (finished) in

                    self.bird.transform = CGAffineTransformConcat(CGAffineTransformScale(self.bird.transform, -1, 1), CGAffineTransformMakeRotation(-45))
                    
                    UIView.animateWithDuration(3, animations: {
                        self.bird.center = CGPointMake(50, self.view.bounds.size.height - 50)
                        
                    }) { (finished) in
                        
                        
                        self.bird.transform = CGAffineTransformConcat(CGAffineTransformScale(self.bird.transform, -1, 1), CGAffineTransformMakeRotation(-45))
                        
                        UIView.animateWithDuration(5, animations: { 
                            self.bird.center = CGPointMake(self.view.bounds.size.width-50, 50)
                        }) { (finished) in
                            
                            self.bird.transform = CGAffineTransformConcat(CGAffineTransformScale(self.bird.transform, -1, 1), CGAffineTransformMakeRotation(45))
                            UIView.animateWithDuration(3, animations: { 
                                self.bird.center = CGPointMake(50, 50)
                            }) { (finished) in
                                self.bird.transform = CGAffineTransformIdentity
                                self.flyUpAndDown()
                            }
                        
                        }
                }
        }
        
        
    }
    
    func playSong(){
        let filePath = NSBundle.mainBundle().pathForResource("Sparrow-sound", ofType: ".mp3")
        let url = NSURL(fileURLWithPath: filePath!)
        audioPlayer = try! AVAudioPlayer(contentsOfURL: url)
        audioPlayer.prepareToPlay()
        audioPlayer.play()
        audioPlayer.numberOfLoops = -1
    }
}

