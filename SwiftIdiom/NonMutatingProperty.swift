//
//  NonMutatingProperty.swift
//  SwiftIdiom
//
//  Created by michael isbell on 11/12/19.
//  Copyright © 2019 Advanced Mobile Development. All rights reserved.
//

import Foundation

class TreeDoctor {
    var name: String?
    
    init(name: String) {
        self.name = name
    }
    
}

struct Tree {
    
    let treeDoc = TreeDoctor(name: "Bill Johnson")
    var bark : Bool?
    var branches: Int?
    var roots: Int?
    var kind: String?
    
    var  treeDocName: String {
        nonmutating set {
            treeDoc.name = "William Johnson"
        }
        get {
            treeDoc.name!
        }
        
    }
    
    init() {
        
    }
    
    
}
