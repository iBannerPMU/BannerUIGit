//
//  Sections.swift
//  BannerUI
//
//  Created by Rayan Alhindi on 13/07/2021.
//

import SwiftUI

struct Sections: View {
    
    @ObservedObject var dataRepo: dbRepo
    
    @State var CRN : String = ""
    @State var Instructor : String = ""
    @State var InstructorID : String = ""
    @State var studentID : [String] = []
    @State var sectionNumber : String = ""
    @State var Semester : String = ""
    @State var year : String = ""
    @State var startTime : String = ""
    @State var endTime : String = ""
    @State var days : [String] = []
    @State var courseID : String = ""
    
    var body: some View {

        VStack {
            Form {
                TextField("CRN", text: $CRN)
//                // loop between instructors & instructor IDs
//                TextField("Date of birth", text: $dateOfBirth)
                
                TextField("Section Number", text: $sectionNumber)
                TextField("Semester", text: $Semester)
                TextField("Year", text: $year)
                TextField("Starting Time", text: $startTime)
                TextField("Ending Time", text: $endTime)
//                // loop between days (Sun-Thr)
//                TextField("Days", text: $days)
            }
        }.padding()
        if((dataRepo.admin) != nil) {
            Button(action: {
                dataRepo.addSection(Section: section.init(CRN: CRN, /*Instructor: "Someone" InstructorID: Faculty.ID,*/ sectionNumber: sectionNumber, Semester: Semester, year: year, startTime: startTime, endTime: endTime /*courseID: course.ID!*/))
            }) {
                Text("Add Sections")
            }
        }
    }
}

