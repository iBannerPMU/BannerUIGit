//
//  CourseRegister.swift
//  BannerUI
//
//  Created by Rayan Alhindi on 18/08/1442 AH.
//

import SwiftUI
import Firebase
import FirebaseAuth


struct CourseRegister: View {
    
    var course: Course
    @ObservedObject var dataRepo: dbRepo
    
    @Binding var GlobalCourse: [String: Course]
    @Binding var sections: [String: section?]
    @Binding var tempArray: [String]
    
    var body: some View {
        
        VStack {
            List {
                Text("Course Name : \(course.name)")
                Text("Course Credit Hours : \(course.CreditHour) Hr")
                Text("Course's Major : \(course.Major)")
                ForEach(0 ..< dataRepo.Sections.count, id: \.self) { index in
                    NavigationLink(destination: SectionDetails(dataRepo: dataRepo, SectionDetails: dataRepo.Sections[index], course: course, GlobalCourse: $GlobalCourse, sections: $sections, tempArray: $tempArray)){
                        Text("Section CRN: " + dataRepo.Sections[index].CRN)
                    }
                }.onAppear()
            }.padding()
        }
    }
}


