//
//  Student.swift
//  BannerUI
//
//  Created by Rayan Alhindi on 27/07/1442 AH.
//

import Foundation
import FirebaseFirestoreSwift

class Faculty: ObservableObject, Identifiable, Codable {
    
    var fullName: String = ""
    var firstName : String = ""
    var email : String = ""
    var dateOfBirth : String = ""
    @DocumentID var ID : String?
    var phoneNumber : String = ""
    var universityEmail : String = ""
    var facultySchedule : [String] = []
    var currentCourses : [String] = []
    var finishedCourses : [String] = []
    
    
    init(firstName: String) {
        self.firstName = firstName
    }
    
    init(facultySchedule : [String]) {
        self.facultySchedule = facultySchedule
    }
    
    init(fullName: String, email: String, dateOfBirth: String, phoneNumber: String, ID: String, universityEmail: String) {
        self.fullName = fullName
        self.email = email
        self.ID = ID
        self.dateOfBirth = dateOfBirth
        self.phoneNumber = phoneNumber
        self.universityEmail = universityEmail
    }
    
    init(fullName: String, email: String, dateOfBirth: String, phoneNumber: String, ID: String) {
        self.fullName = fullName
        self.email = email
        self.ID = ID
        self.dateOfBirth = dateOfBirth
        self.phoneNumber = phoneNumber
    }
    
    init(ID: String, universityEmail: String) {
        self.ID = ID
        self.universityEmail = universityEmail
    }

}
