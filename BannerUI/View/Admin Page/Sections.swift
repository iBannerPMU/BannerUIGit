//
//  Sections.swift
//  BannerUI
//
//  Created by Rayan Alhindi on 13/07/2021.
//

import SwiftUI

struct Sections: View {
    
    @ObservedObject var dataRepo: dbRepo
    var course: Course
    
    @State var CRN : String = ""
    @State var Instructor : String = ""
    @State var InstructorID : String = ""
    @State var studentID : [String] = []
    @State var sectionNumber : String = ""
    @State var Semester : String = ""
    @State var year : String = ""
    @State var startTime : String = ""
    @State var endTime : String = ""
    @State var days : [String] = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday"]
    @State var dayss : String = ""
    @State var courseID : String = ""
    @State var fac : Int = 0
    var body: some View {
        
        VStack {
            Form {
                TextField("CRN", text: $CRN)
                Picker(selection: $fac, label: Text("")) {
                    ForEach(0..<dataRepo.allFac.count , id: \.self) { number in
                        Text("\(dataRepo.allFac[number].fullName)")
                    }
                }.pickerStyle((WheelPickerStyle()))
                .frame(maxWidth: .infinity)
                .background(Color(UIColor.systemGroupedBackground).edgesIgnoringSafeArea(.bottom))
                TextField("section Number:", text: $sectionNumber)
                TextField("Semester", text: $Semester)
                TextField("Year", text: $year)
                TextField("Starting Time", text: $startTime)
                TextField("Ending Time", text: $endTime)
            }
        }.navigationTitle("Sections")
        .navigationBarTitleDisplayMode(.inline)
        .padding()
        if((dataRepo.admin) != nil) {
            Button(action: {
                dataRepo.addSection(Section: section(CRN: CRN, Instructor: dataRepo.allFac[fac].fullName, InstructorID: dataRepo.allFac[fac].ID!, sectionNumber: sectionNumber, Semester: Semester, year: year, startTime: startTime, endTime: endTime, courseID: course.id!))
                self.CRN = ""
                self.sectionNumber = ""
                self.Semester = ""
                self.year = ""
                self.startTime = ""
                self.endTime = ""
            }) {
                Text("Add Sections")
            }.onDisappear {
                dataRepo.courseArray = [:]
                dataRepo.emptyCourseArray = []
                dataRepo.getCourses()
            }
        }
    }
}

