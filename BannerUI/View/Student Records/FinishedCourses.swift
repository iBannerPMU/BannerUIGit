//
//  FinishedCourses.swift
//  BannerUI
//
//  Created by Mohammad Alrashed on 09/04/2021.
//

import Foundation
import SwiftUI
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift
import FirebaseAuth

class FinishedCoursesInfo: ObservableObject {
    
    private var db = Firestore.firestore()
    private var authRef = (Auth.auth().currentUser?.uid)!
    
}

struct FinishedCourses: View {
    
    
    var courses: [Course?]
    var stringArray: [String]
    var dataRepo: dbRepo
    
    //  for index in 1...FinishedCourses {
    //      Text(user.FinishedCourses[index])
    //  }
    var body: some View {

                ForEach(courses as! [Course]) { finishedcourse in
                    List{
                        Section {
                        Text("Course Name : \(finishedcourse.name)")
                        Text("Course ID : \(finishedcourse.ID)")
                        Text("Course Credit Hours : \(finishedcourse.CreditHour) Hr")
                        Text("Course's Major : \(finishedcourse.Major)")
                        Text("Prerequisite Course Name : \(finishedcourse.PreReqName)")
                            
                            
                    }.padding()
                }
            }
        }
}
