//
//  InOutParameterMutation.swift
//  SwiftIdiom
//
//  Created by michael isbell on 11/12/19.
//  Copyright © 2019 Advanced Mobile Development. All rights reserved.
//

import Foundation

//** & is NOT the address of operator, it just indicates an inout
// parameter
// the value is still copied in, but the changed value is copied back
// It is NOT the case that a change is made 'in place'
//

struct TheaterSeat {
    
  
    var aisle: Int = 2 {
        willSet {
            print("willset fired")
        }
        didSet {
            print("didset fired")
        }
    }

 
    
    func changeSeat(seatRow: inout Int) {
        
        seatRow = 3
        
    }
    
    mutating func run() {
        changeSeat(seatRow: &aisle)
        print(aisle)
    }
    
    init() {
        
    }
    
    
}
