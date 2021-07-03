//
//  Student.swift
//  BannerUI
//
//  Created by Rayan Alhindi on 27/07/1442 AH.
//

import Foundation

class Faculty: ObservableObject, Identifiable, Codable {
    
    var fullName: String = ""
    var firstName : String = ""
    var email : String = ""
    var dateOfBirth : String = ""
    var ID : String = ""
    var phoneNumber : String = ""
    var universityEmail : String = ""
    var facultySchedule : [String] = []
    var currentCourses : [String] = []
    var finishedCourses : [String] = []
    // attendence : int = 0 , with every absent it increment until 9 absents if the course is 3 hour credit.
    // check only the preRequisit connected to the rigistered course
    
    
    
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
