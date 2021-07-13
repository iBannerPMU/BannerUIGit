//
//  CourseRegister.swift
//  BannerUI
//
//  Created by Rayan Alhindi on 18/08/1442 AH.
//

import SwiftUI
import Firebase
import FirebaseAuth


enum ActiveAlert {
    case first, second, third
}

struct CourseRegister: View {
    
    @State private var showAlert = false
    @State private var activeAlert: ActiveAlert = .first
    
    var course: Course
    var dataRepo: dbRepo
    //private var checker: Bool
    
    var body: some View {
        
        VStack {
            List {
                Text("Course Name : \(course.name)")
                Text("Course ID : \(course.ID)")
                Text("Course Credit Hours : \(course.CreditHour) Hr")
                Text("Course's Major : \(course.Major)")
                Text("Prerequisite Course Name : \(course.PreReqName[0])")
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
                Button(action: {
                    dataRepo.reqChecker(PreRequisitNList: course.PreReqName, callback: {(hasCompletedPrerequsite) in
                        
                        if (dataRepo.totalCH <= 20 && hasCompletedPrerequsite)
                        {
                            dataRepo.totalCH += course.CreditHour;
                            dataRepo.cartCourses(courseName: course.name, preReqChecker: hasCompletedPrerequsite)
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

                })
                {
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
    }
}




