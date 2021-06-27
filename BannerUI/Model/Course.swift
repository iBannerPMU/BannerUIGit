//
//  Course.swift
//  BannerUI
//
//  Created by Rayan Alhindi on 27/07/1442 AH.
//

import Foundation

class Course: ObservableObject, Identifiable, Codable {
    
    var name : String = ""
    var CreditHour : Int!
    var ID : String = ""
    var Major : String = ""
    var hasPreRequisite : Bool = false
    var elective : Bool = false
    
    init(name: String) {
        self.name = name
    }
    
    init(name: String, CreditHour: Int, ID: String, Major: String, hasPreRequisite: Bool, elective: Bool) {
        self.name = name
        self.CreditHour = CreditHour
        self.ID = ID
        self.Major = Major
        self.hasPreRequisite = hasPreRequisite
        self.elective = elective

    }
}
