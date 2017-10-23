//
//  GrandCentralDispatchDemo.swift
//  ErrorHandling
//
//  Created by TomerBu on 23/10/2017.
//  Copyright © 2017 TomerBu. All rights reserved.
//

import UIKit


func demo(){
    //GCD:
    
    let userInteractiveQ = DispatchQueue.global(qos: .userInteractive) //
    
    let userInitiatedQ = DispatchQueue.global(qos: .userInitiated) //the default
    let q = DispatchQueue.global()
    print(userInitiatedQ == q) //true
    
    let utility = DispatchQueue.global(qos: .utility)
    let background = DispatchQueue.global(qos: .background)
    
    
    //Q Usage:
    DispatchQueue.global().async {
        let pumpkin = growPumpkin()
        DispatchQueue.main.async {
            print(pumpkin)
        }
    }
    
    
    for _ in 1...10{
        growPumpkinAsync()
    }
}

func serialQ(){
    //User Q's
    
    //sometimes we want A Serial Queue:
    let mySerialQ = DispatchQueue(label: "edu.hackeru.q")
    mySerialQ.async {
        //Run Serial
        print("A")
    }
    
    mySerialQ.async {
        //Run Serial
        print("B")
    }
    
    mySerialQ.async {
        //Run Serial
        print("C")
    }
    //good for shared resources.
}

func groupNotifications(){
    let myGroup = DispatchGroup()
    
    DispatchQueue.global().async(group: myGroup){
        sleep(1)
    }
    
    DispatchQueue.global().async(group: myGroup){
        sleep(8)
    }
    
    DispatchQueue.global().async(group: myGroup){
        sleep(2)
    }
    
    
    myGroup.notify(queue: .main){
        print("Done with all threads.")
    }
    
}

func growPumpkinAsync(){
    //Q Usage:
    DispatchQueue.global().async {
        let pumpkin = growPumpkin()
        DispatchQueue.main.async {
            print(pumpkin)
        }
    }
    
    //DispatchQueue.global().async(execute: <#T##DispatchWorkItem#>)
    
    
}
func growPumpkin()->String{
    sleep(10)
   return "Pumpkin Ready"
}

class Person{//: NSObject{ //kvo , dynamic dispatch!
    
}
