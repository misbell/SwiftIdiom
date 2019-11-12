//
//  EscapingClosures.swift
//  SwiftIdiom
//
//  Created by michael isbell on 11/12/19.
//  Copyright © 2019 Advanced Mobile Development. All rights reserved.
//

import Foundation


struct EscClosures {
    
    var a: (() -> Void)?
    var b: ((Int) -> Int)?
    var c: ((Int) -> Int)?
    var d: ((Int) -> Int)?
    
    func printSomething() -> Void {
        print("hello, world")
    }
    
    
    func returnAnInt(int: Int) -> Int {
        int
    }
    
    
    mutating  func doSomething( completion: @escaping () -> Void) {
        
        a = completion
    }
    
    func doAnotherThing( completion: () -> Void) {
         // passing in this closure in run()
         //{
         //    let c = 2
         //    print("finish")
         //}
         completion()
     }
    
    func doANumberedThing(gimmeANumber:Int, completion: (Int) -> Int) {
// passing in this closure
//        {
//            gimmeANumber in
//            print("number finish")
//            print(gimmeANumber)
//            return 2 + gimmeANumber
//
//        }
        
        let b = completion(gimmeANumber)
        print (b)
       
        
    }
    
    
   mutating func doAnEscapingNumberedThing(gimmeANumber:Int, completion: @escaping (Int) -> Int) {
        
        self.b = completion
        
    }
    
    mutating func doAnEscapingNumberedThing2(  completion: @escaping (Int) -> Int) {
         
         self.c = completion
         
     }
    
    mutating func doAnEscapingNumberedThing3(  completion: @escaping (Int) -> Int) {
         
         self.d = completion

     }
    
    
    mutating func run() {
        
        doSomething(completion: printSomething)
        print("first")
        self.a!()
        self.a = nil
        doAnotherThing {
            let c = 2
            print("finish")
        }

        
        // because escaping, run at end
        doAnEscapingNumberedThing(gimmeANumber: 2) {
            gimmeANumber in
                 print("escapingnumber finish")
                 print(gimmeANumber)
                 return 2 + gimmeANumber
        }
        
        doAnEscapingNumberedThing2 {
            gimmeANumber in
                 print("escapingnumber finish")
                 print(gimmeANumber)
                 return 2 + gimmeANumber
        }
        
        
        doAnEscapingNumberedThing3(completion: returnAnInt)
        
        
        // run immediately
        doANumberedThing(gimmeANumber: 3) {
            gimmeANumber in
            print("number finish")
            print(gimmeANumber)
            return 2 + gimmeANumber
        
        }
        let x = self.b!(4)
        let z = self.c!(5)
        let omega = self.d!
        print("and at last \(x)")
        print("and even more at last \(z)")
        let alpha = omega(8)
        print("omega \(alpha)")
        

          
        
    }
    

    
}
