//
//  KeychainService.swift
//  EquipmentManagement
//
//  Created by kanra on 10/28/22.
//

import Foundation
import KeychainSwift

class KeyChainService{
    var _keyChain = KeychainSwift()
    
    var keyChain: KeychainSwift {
        get {
            return _keyChain
        }
        set {
            _keyChain = newValue
        }
    }
    
}
