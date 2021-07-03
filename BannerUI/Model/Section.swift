//
//  Semester.swift
//  BannerUI
//
//  Created by Rayan Alhindi on 16/08/1442 AH.
//

import Foundation
import FirebaseFirestoreSwift

class section : Codable {

    var CRN : String = ""
    var Instructor : String = ""
    var InstructorID : String = ""
    var studentID : [String] = []
    var sectionNumber : String = ""
    var Semester : String = ""
    var year : String = ""
    var startTime : String = ""
    var endTime : String = ""
    var days : [String] = []
    var courseID : String = ""
    
    init(CRN: String, Instructor: String, InstructorID: String, sectionNumber: String, Semester: String, year: String, startTime: String, endTime: String, courseID: String) {

            self.CRN = CRN
            self.Instructor = Instructor
            self.InstructorID = InstructorID
            self.sectionNumber = sectionNumber
            self.Semester = Semester
            self.year = year
            self.startTime = startTime
            self.endTime = endTime
            self.courseID = courseID
        
    }
    
}
    
