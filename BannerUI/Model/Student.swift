//
//  Student.swift
//  BannerUI
//
//  Created by Rayan Alhindi on 27/07/1442 AH.
//

import Foundation

class Student: ObservableObject, Identifiable, Codable {
    
    var fullName: String = ""
    var firstName : String = ""
    var email : String = ""
    var dateOfBirth : String = ""
    var nationalID : String = ""
    var phoneNumber : String = ""
    var universityID : String = ""
    var universityEmail : String = ""
    var startLevel : String = ""
    var startMajor : String = ""
    var startingYear : String = ""
    var GPA : Double = 0.00
    var studentSchedule : [String] = []
    var FinishedCourses : [String] = []
    // attendence : int = 0 , with every absent it increment until 9 absents if the course is 3 hour credit.
    // check only the preRequisit connected to the rigistered course
    
    
    
    init(firstName: String) {
        
        self.firstName = firstName
        
    }
    
    init(studentSchedule : [String]) {
        
        self.studentSchedule = studentSchedule
        
    }
    
    
    
    init(fullName: String, email: String, dateOfBirth: String, phoneNumber: String, nationalID: String, startLevel: String, startMajor: String, startingYear: String, universityID: String, universityEmail: String) {

        self.fullName = fullName
        self.email = email
        self.nationalID = nationalID
        self.dateOfBirth = dateOfBirth
        self.phoneNumber = phoneNumber
        self.universityID = universityID
        self.startLevel = startLevel
        self.startMajor = startMajor
        self.startingYear = startingYear
        self.universityEmail = universityEmail
        
    }
    
    init(fullName: String, email: String, dateOfBirth: String, phoneNumber: String, nationalID: String) {

        self.fullName = fullName
        self.email = email
        self.nationalID = nationalID
        self.dateOfBirth = dateOfBirth
        self.phoneNumber = phoneNumber
        
    }
    
    init(startLevel: String, startMajor: String, startingYear: String, universityID: String, universityEmail: String) {
        self.universityID = universityID
        self.startLevel = startLevel
        self.startMajor = startMajor
        self.startingYear = startingYear
        self.universityEmail = universityEmail

    }

}
