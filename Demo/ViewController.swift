//
//  ViewController.swift
//  Demo
//
//  Created by Shashank Panwar on 1/11/18.
//  Copyright © 2018 Shashank Panwar. All rights reserved.
//

import UIKit
import Social


class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        
    }
    
    
    @IBAction func shareButtonAction(_ sender: UIButton) {
        
        //Alert
        let alert = UIAlertController(title: "Share", message: "Share the poem of the day", preferredStyle: .actionSheet)
        
        // First Action.
        let actionOne = UIAlertAction(title: "Share on Facebook", style: .default) { (action) in
            print("Success")
            //Checking if user is connected to Facebook
            
            if SLComposeViewController.isAvailable(forServiceType: SLServiceTypeFacebook){
                //User has facebook account.
                let post = SLComposeViewController(forServiceType: SLServiceTypeFacebook)!
                 post.add(URL(string: "http://onelink.to/hyndxg"))
                  post.setInitialText("I have filed my return using Steuern59")
//               post.add(UIImage(named: "appLogo.jpg"))
                
               
                //post.add(UIImage(named: "img.png")
                self.present(post, animated: true, completion: nil)
            }else{
                // User don't have facebook account.
                self.showAlert(service: "Facebbok")
            }
        }
        
        // Second Action
        let actionTwo = UIAlertAction(title: "Share on Twitter", style: .default) { (action) in
            print("Success")
            //Checking if user is connected to Twitter
            if SLComposeViewController.isAvailable(forServiceType: SLServiceTypeTwitter){
                //User has Twitter account.
                let post = SLComposeViewController(forServiceType: SLServiceTypeTwitter)!
                post.add(URL(string: "http://onelink.to/hyndxg"))
                post.setInitialText("I have filed my return using Steuern59")
//                post.add(UIImage(named: "appLogo.jpg"))
                
                //post.add(UIImage(named: "img.png")
                self.present(post, animated: true, completion: nil)
            }else{
                // User don't have facebook account.
                self.showAlert(service: "Twitter")
            }
        }
        
        // Add action to action sheet.
        alert.addAction(actionOne)
        alert.addAction(actionTwo)
        
        
        //Present alert
        self.present(alert, animated: true, completion: nil)
    }
    
    
    func showAlert(service: String){
        let alert = UIAlertController(title: "Error", message: "You are not connected to \(service)", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Dismiss", style: .cancel, handler: nil)
        
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    
}

