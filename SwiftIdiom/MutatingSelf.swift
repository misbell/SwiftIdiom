//
//  MutatingSelf.swift
//  SwiftIdiom
//
//  Created by michael isbell on 11/12/19.
//  Copyright © 2019 Advanced Mobile Development. All rights reserved.
//

import Foundation

struct Car {
    
    var wheels : Int?
    var doors: Int?
    var maker: String?
    
    mutating func MutateSelf() {
        
        self = Car(wheels: 5, doors: 3, maker: "Ford")
    }
}
