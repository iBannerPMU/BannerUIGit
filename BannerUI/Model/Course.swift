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
    var PreReqName : String = ""

    
    init(name: String) {
        self.name = name
    }
    
    init(name: String, CreditHour: Int, ID: String, Major: String, hasPreRequisite: Bool, elective: Bool, PreReqName: String) {
        self.name = name
        self.CreditHour = CreditHour
        self.ID = ID
        self.Major = Major
        self.hasPreRequisite = hasPreRequisite
        self.elective = elective
        self.PreReqName = PreReqName
        


    }
    //toMap() is a func. that will return an object with the course name and it's details
    func toMap() -> Dictionary<String, Any> {
        return [
            "name": self.name,
            "CreditHour": self.CreditHour as Any,
            "ID": self.ID,
            "Major": self.Major,
            "hasPreRequisite": self.hasPreRequisite,
            "elective": self.elective,
            "PreReqName": self.PreReqName,
        ];
    }
}
