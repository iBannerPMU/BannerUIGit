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
    var dataRepo: dbRepo
    
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
        
            HStack{
                Button(action: {dataRepo.registerCourse(courseName: course.name)}) {
                    Text("Register Course")
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 250)
                }
                .background(Color("Blue"))
                .cornerRadius(10)
                .padding(.top)
                
                Button(action: {dataRepo.cartCourses(courseName: course.name)}) {
                    Text("Add to cart")
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 250)
                }
                .background(Color("Blue"))
                .cornerRadius(10)
                .padding(.top)
            }
            Spacer(minLength: 300)
        }
    }
}

