//
//  Course.swift
//  BannerUI
//
//  Created by Rayan Alhindi on 27/07/1442 AH.
//

import Foundation
import FirebaseFirestoreSwift

class Course: ObservableObject, Identifiable, Codable {
    
    var name : String = ""
    var CreditHour : Int = 0
    @DocumentID var id : String?
    var Major : String = ""
    var hasPreRequisite : Bool {
        if PreReqName == [] {
            return false
        } else {
            return true
        }
    }
    var elective : Bool = false
    var PreReqName : [String] = []
    var numOfStudents : Int?
    
    
    init(name: String) {
        self.name = name
    }
    
    init(numberOfStudents : Int) {
        self.numOfStudents = numberOfStudents
    }
    
    init(name: String, CreditHour: Int, Major: String, PreReqName: String) {
        self.name = name
        self.CreditHour = CreditHour
        self.Major = Major
        self.PreReqName.append(PreReqName)
        
    }
    //toMap() is a func. that will return an object with the course name and it's details
    func toMap() -> Dictionary<String, Any> {
        return [
            "name": self.name,
            "CreditHour": self.CreditHour as Any,
            "ID": Course.ID.self,
            "Major": self.Major,
            "hasPreRequisite": self.hasPreRequisite,
            "elective": self.elective,
            "PreReqName": self.PreReqName,
        ];
    }
}
