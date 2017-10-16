//
//  ViewController.swift
//  ErrorHandling
//
//  Created by TomerBu on 16/10/2017.
//  Copyright © 2017 TomerBu. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    //init the player once!
    //use the player allways.
    
    
    //Optional (Not initialized in the init)
    var player:AVAudioPlayer?
    
    @IBOutlet var btn: UIButton?
    
    @IBAction func play(_ sender: UIButton) {
        player?.play()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //in order to init a player we need a URL!
        //swift 3: guard let: instead of if let{}...
        guard let url = Bundle.main.url(forResource: "fdb", withExtension: "mp3") else{return}
 
      
        //This must work!
        //player = try! AVAudioPlayer(contentsOf: url)
        
        
        //if this works... 
        player = try? AVAudioPlayer(contentsOf: url)
        
        
        
//        do {
//            player =  try AVAudioPlayer(contentsOf: url)
//        } catch let error{
//            print(error)
//        }
        
        //player = AVAudioPlayer(contentsOfURL...) throws
        
        // Do any additional setup after loading the view, typically from a nib.
    }
}

