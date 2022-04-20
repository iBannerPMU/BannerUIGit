//
//  SectionDetails.swift
//  BannerUI
//
//  Created by Rayan Alhindi on 14/07/2021.
//

import SwiftUI

enum ActiveAlert {
    case first, second, third
}

struct SectionDetails: View {
    
    @ObservedObject var dataRepo: dbRepo
    var SectionDetails: section
    var course: Course
    
    @Binding var GlobalCourse: [String: Course]
    @Binding var sections: [String: section?]
    @Binding var tempArray: [String]
    
    @State private var showAlert = false
    @State private var activeAlert: ActiveAlert = .first
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
    
    
    var body: some View {
        VStack {
            Form {
                Text("Section CRN: " + SectionDetails.CRN)
                Text("Section CRN: " + SectionDetails.Instructor)
                //Text(SectionDetails.InstructorID)
                Text("Section Number: " + SectionDetails.sectionNumber)
                Text("Semester: " + SectionDetails.Semester)
                Text("Year: " + SectionDetails.year)
                Text("Start Time: " + SectionDetails.startTime)
                Text("End Time: " + SectionDetails.endTime)
            }
        }.padding()
        
        Button(action: {
            
            sections[SectionDetails.id!] = SectionDetails
            tempArray.append(SectionDetails.id!)
            GlobalCourse[SectionDetails.id!] = course
            print("this is a section: \(SectionDetails.id!)")
            print("this is a course: \(GlobalCourse[SectionDetails.id!]!.id!)")
            dataRepo.reqChecker(PreRequisitNList: course.PreReqName, callback: {(hasCompletedPrerequsite) in
                print("dataRepo.totalCH=", dataRepo.totalCH)
                if (dataRepo.totalCH <= 20 && hasCompletedPrerequsite)
                {
                    dataRepo.totalCH += course.CreditHour;
                    dataRepo.cartCourses(courseID: SectionDetails.courseID)
                    self.activeAlert = .first
                }
                else if (!hasCompletedPrerequsite)
                {
                    self.activeAlert = .third
                }
                else
                {
                    self.activeAlert = .second
                }
                self.showAlert = true
            });
        }) {
            Text("Add to cart")
                .foregroundColor(.white)
                .padding(.vertical)
                .frame(width: UIScreen.main.bounds.width - 250)
                .alert(isPresented: $showAlert) {
                    switch activeAlert {
                    case .first:
                        return Alert(title: Text("Added To Cart"), message: Text("The course has been added to your cart"))
                    case .second:
                        return Alert(title: Text("Limit Reached"), message: Text("You have added maximum 20 credit hours to your cart"))
                    case .third:
                        return Alert(title: Text("Missing Pre Requisite"), message: Text("You need to finish the pre requisite before adding this course."))
                    }
                }
                .background(Color("Blue"))
                .cornerRadius(10)
                .padding(.top)
            
        }
    }
}


