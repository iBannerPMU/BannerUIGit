//
//  courseInfo.swift
//  BannerUI
//
//  Created by Rayan Alhindi on 16/08/1442 AH.
//

import SwiftUI

struct courseInfo: View {
    
    var course: Course
    var dataRepo: dbRepo
    
    
    var body: some View {
        
        List {
            Text("Course Name : \(course.name)")
            Text("Course Name : \(course.ID)")
            Text("Course Credit Hours : \(course.CreditHour) Hr")
            Text("Course's Major : \(course.Major)")
            if course.hasPreRequisite == true {
                Text("This course has a Pre Requisite")
            } else {
                Text("This course does not have a Pre Requisite")
            }
            if course.elective == true {
                Text("This course is not an Elective")
            } else {
                Text("This course is an Elective")
            }
        }.padding()
        
        if((dataRepo.admin) != nil) {
            Button(action: {
                dataRepo.addSection(Section: section.init(CRN: "111", Instructor: "Someone", InstructorID: "123", sectionNumber: "101", Semester: "Spring", year: "2030", startTime: "15:45", endTime: "20:20", courseID: "Algorithms"))
            }) {
                Text("Add Sections")
            }
        }
    }
}

