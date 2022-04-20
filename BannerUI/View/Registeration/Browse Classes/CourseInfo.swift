//
//  courseInfo.swift
//  BannerUI
//
//  Created by Rayan Alhindi on 16/08/1442 AH.
//

import SwiftUI

struct courseInfo: View {
    
    var course: Course
    @ObservedObject var dataRepo: dbRepo
    var sections : [section]
    
    var body: some View {
        List {
            Text("Course Name : \(course.name)")
            Text("Course Credit Hours : \(course.CreditHour) Hr")
            Text("Course's Major : \(course.Major)")
            ForEach(0 ..< dataRepo.Sections.count, id: \.self) { index in
                Text(dataRepo.Sections[index].CRN)
            }
        }.padding()
        
        NavigationLink(destination: Sections(dataRepo: dataRepo, course: course)){
            Text("Add Sections")
        }
    }
}
