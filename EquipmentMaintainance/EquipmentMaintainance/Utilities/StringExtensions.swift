//
//  StringExtensions.swift
//  EquipmentMaintainance
//
//  Created by kanra on 10/22/22.
//

import Foundation

extension String {
    var isEmail : Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: self)
    }
    
    var isPsswordStrong : Bool {
        return self.count >= 6
    }
}
