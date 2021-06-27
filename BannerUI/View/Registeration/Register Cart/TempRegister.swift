//
//  TempRegister.swift
//  BannerUI
//
//  Created by Rayan Alhindi on 21/08/1442 AH.
//

import SwiftUI

struct TempRegister: View {
    
    
    var dataRepo : dbRepo
    var course: Course
    
    var body: some View {
        
        VStack {
            List {
                Text("Course Name : \(course.name)")
                Text("Course ID : \(course.ID)")
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
            
            
        }
        
    }
}
