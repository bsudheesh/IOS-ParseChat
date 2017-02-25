//
//  LoginViewController.swift
//  ParseChat
//
//  Created by Sudheesh Bhattarai on 2/24/17.
//  Copyright © 2017 Sudheesh Bhattarai. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var passWordLabel: UILabel!
    
    
    
    @IBOutlet weak var emailIdLabel: UITextField!
    
    
    @IBOutlet weak var passWordIdLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func signUpButtons(_ sender: Any) {
        
       
        var usrEntered = emailIdLabel.text
        var pwdEntered = passWordIdLabel.text
        
        
        
        func userSignUp() {
            var user = PFUser()
            user.username = usrEntered
            user.password = pwdEntered
            user.signUpInBackground {
                (succeeded: Bool, error:Error?) -> Void in
                if error == nil {
                    print ("User signed up")
                    let alertController = UIAlertController(title: "WELCOME", message: "Welcome to Chat", preferredStyle: .alert)
                    
                    
                    let cancelAction = UIAlertAction(title: "OK", style: .cancel) { (action) in
                        // handle cancel response here. Doing nothing will dismiss the view.
                    }
                    // add the cancel action to the alertController
                    alertController.addAction(cancelAction)
                    
                    
                    self.present(alertController, animated: true) {
                        // optional code for what happens after the alert controller has finished presenting
                    }
                    

                    // Hooray! Let them use the app now.
                    
                } else {
                    print("ERROR", error)
                    // create a cancel action
                    
                    let alertController = UIAlertController(title: "ERROR", message: "USER already exits", preferredStyle: .alert)
                    
                    
                    let cancelAction = UIAlertAction(title: "OK", style: .cancel) { (action) in
                        // handle cancel response here. Doing nothing will dismiss the view.
                    }
                    // add the cancel action to the alertController
                    alertController.addAction(cancelAction)
                    
                    
                    self.present(alertController, animated: true) {
                        // optional code for what happens after the alert controller has finished presenting
                    }

                    // Show the errorString somewhere and let the user try again.
                }
            }
            
        }

        
        
        if usrEntered != "" && pwdEntered != "" {
            // If not empty then yay, do something
            
            userSignUp()
            
        } else {
            let alertController = UIAlertController(title: "ERROR", message: "Empty Values", preferredStyle: .alert)
            
            
            let cancelAction = UIAlertAction(title: "OK", style: .cancel) { (action) in
                // handle cancel response here. Doing nothing will dismiss the view.
            }
            // add the cancel action to the alertController
            alertController.addAction(cancelAction)
            
           
            self.present(alertController, animated: true) {
                // optional code for what happens after the alert controller has finished presenting
            }

            //user has not entered informatiom
            
            
        }

        
    }
    
    
    @IBAction func loginButton(_ sender: Any) {
        var usrEntered = emailIdLabel.text
        var pwdEntered = passWordIdLabel.text
        
        
        func justHod(){
            let alertController = UIAlertController(title: "ERROR", message: "Empty Values", preferredStyle: .alert)
            
            
            let cancelAction = UIAlertAction(title: "OK", style: .cancel) { (action) in
                // handle cancel response here. Doing nothing will dismiss the view.
            }
            // add the cancel action to the alertController
            alertController.addAction(cancelAction)
            
            
            self.present(alertController, animated: true) {
                // optional code for what happens after the alert controller has finished presenting
            }
            

        }
        if usrEntered != "" && pwdEntered != "" {
            // If not empty then yay, do something
            
            PFUser.logInWithUsername(inBackground: emailIdLabel.text!, password:passWordIdLabel.text!) {
                user, error in
                if user != nil {
                    print("Sign In")
                                       
                    // Yes, User Exists
                    
                } else {
                    let alertController = UIAlertController(title: "ERROR", message: "INVALID VALUES", preferredStyle: .alert)
                    
                    
                    let cancelAction = UIAlertAction(title: "OK", style: .cancel) { (action) in
                        // handle cancel response here. Doing nothing will dismiss the view.
                    }
                    // add the cancel action to the alertController
                    alertController.addAction(cancelAction)
                    
                    
                    self.present(alertController, animated: true) {
                        // optional code for what happens after the alert controller has finished presenting
                    }

                    

                    // No, User Doesn't Exist
                }
            }
            
            
        } else {
            justHod()
        }
        
        
        
        
    }
   
    
    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let detailViewController = segue.destination as! ChatViewController
        var userEmail = emailIdLabel.text
        print("Value inside segue is : ", emailIdLabel.text as String!)
        detailViewController.userID = emailIdLabel.text as String!
    }
 
    

}
