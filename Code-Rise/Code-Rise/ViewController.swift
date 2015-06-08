//
//  ViewController.swift
//  Code-Rise
//
//  Created by oliver belanger on 6/6/15.
//  Copyright (c) 2015 HackMad. All rights reserved.
//

import UIKit
import Foundation
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer = AVAudioPlayer()
    var trackTime = NSDate()
    
    @IBOutlet weak var currTime: UILabel!

    @IBAction func toppButton(sender: UIButton) {
        
       currTime.text = addFiveDate()
        println(currTime.text)
     
    }
    
    @IBAction func bottomButton(sender: AnyObject) {
        
        currTime.text = subFiveDate()
        println(currTime.text)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

       // let date = NSDate()
        var message = "init"

        currTime.text = Date(trackTime)
        
        var check = true;
        
 
        
        loadSound()
        
        /*dispatch_async(dispatch_get_main_queue(), { () -> Void in
            

            
            while(check == true)
            {
                var currentDate = self.Date()
                
                if ("1:25 AM" == currentDate)
                {
                    
                    message = "it's time"
                    self.player.play()
                    check = false
                }
                else{
                 //   println(currentDate)
                    message = "nope not yet"
                }
                
               // println(message)
            }



        })*/
        
        println(message)
        
        //swipe right
        var swipeRight = UISwipeGestureRecognizer(target: self, action: "swiped:")
        swipeRight.direction = UISwipeGestureRecognizerDirection.Right
        self.view.addGestureRecognizer(swipeRight)
        
        //swipe up
        var swipeUp = UISwipeGestureRecognizer(target: self, action: "swiped:")
        swipeUp.direction = UISwipeGestureRecognizerDirection.Up
        self.view.addGestureRecognizer(swipeUp)
        
        //swipe down
        var swipeDown = UISwipeGestureRecognizer(target: self, action: "swiped:")
        swipeDown.direction = UISwipeGestureRecognizerDirection.Down
        self.view.addGestureRecognizer(swipeDown)
        
        //swipe left
        var swipeLeft = UISwipeGestureRecognizer(target: self, action: "swiped:")
        swipeLeft.direction = UISwipeGestureRecognizerDirection.Left
        self.view.addGestureRecognizer(swipeLeft)

        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func loadSound() -> Void
    {
        var file = NSString(string: NSBundle.mainBundle().pathForResource( "sounds", ofType: "mp3")!)
        
        var error:NSError? = nil
        
        player = AVAudioPlayer(contentsOfURL: NSURL(string: file), error: &error)
        
    }
    
    func addFiveDate() -> String {
        
        
        trackTime = trackTime.dateByAddingTimeInterval(NSTimeInterval(300))
        let formatter = NSDateFormatter()
        formatter.timeStyle = .ShortStyle
        var obj = formatter.stringFromDate(trackTime)
        
        
        return obj
    }

    func subFiveDate() -> String {
        
        
        trackTime = trackTime.dateByAddingTimeInterval(NSTimeInterval(-300))
        let formatter = NSDateFormatter()
        formatter.timeStyle = .ShortStyle
        var obj = formatter.stringFromDate(trackTime)
        
        
        
        return obj
    }
    
    func Date(date: NSDate) -> String {
        
        var tempDate = date
        let formatter = NSDateFormatter()
        formatter.timeStyle = .ShortStyle
        var obj = formatter.stringFromDate(tempDate)
        

        return obj
    }
    
    
    func swiped (gesture: UIGestureRecognizer)
    {
        
        if let swipeGesture =  gesture as? UISwipeGestureRecognizer
        {
            
            switch swipeGesture.direction
            {
                
            case UISwipeGestureRecognizerDirection.Right:
                println("user swiped right")
                
            case UISwipeGestureRecognizerDirection.Up:
                println("user swiped up")
                
            case UISwipeGestureRecognizerDirection.Down:
                println("user swiped Down")
                
            case UISwipeGestureRecognizerDirection.Left:
                println("user swiped Left")
                
            default:
                break
                
                
                
                
                
                
            }
            
        }
        
        
        
        
    }
    
    
}

