//
//  ChatViewController.swift
//  ParseChat
//
//  Created by Sudheesh Bhattarai on 2/24/17.
//  Copyright © 2017 Sudheesh Bhattarai. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController {

    
    
    @IBOutlet weak var userIDLabel: UILabel!
    
    var userID = String()
    override func viewDidLoad() {
        super.viewDidLoad()
        userIDLabel.text = userID as String!
        
        self.navigationItem.title = "Chat"
        userIDLabel.sizeToFit()
        
        print("Received value is : ", userID as String!)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
