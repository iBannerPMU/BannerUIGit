//
//  ClassSchedule.swift
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

class ClassScheduleInfo: ObservableObject {
    
    private var db = Firestore.firestore()
    private var authRef = (Auth.auth().currentUser?.uid)!
    
}

struct ClassSchedule: View {
    
    var courses: [Course?]
    var stringArray: [String]
    var dataRepo: dbRepo
    var scheduleCH: Int = 0
    
    var body: some View {

        Text("Total Credit hours: \(dataRepo.totalCH)")
                ForEach(courses as! [Course]) { regcourse in
                    List{
                        Section {
                        Text("Course Name : \(regcourse.name)")
                        Text("Course ID : \(regcourse.ID)")
                        Text("Course Credit Hours : \(regcourse.CreditHour) Hr")
                        Text("Course's Major : \(regcourse.Major)")
                        Text("Prerequisite Course Name : \(regcourse.PreReqName)")
                            
                        if regcourse.hasPreRequisite == true {
                            Text("This course has a Pre Requisite")
                        } else {
                            Text("This course does not have a Pre Requisite")
                        }
                        if regcourse.elective == true {
                            Text("This course is not an Elective")
                        } else {
                            Text("This course is an Elective")
                        }

                    }.padding()
                }
            }
        }
    }


