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
    case first, second
}

struct CourseRegister: View {
    
    @State private var showAlert = false
    @State private var activeAlert: ActiveAlert = .first

    
    var course: Course
    var dataRepo: dbRepo
    
    
    
    var body: some View {
        
        VStack {
        List {
            Text("Course Name : \(course.name)")
            Text("Course Credit Hours : \(course.CreditHour) Hr")
            Text("Course's Major : \(course.Major)")
            // for loop and check if the list empty first
            //Text("Prerequisite Course Name : \(course.PreReqName)")
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
        
            //dataRepo.totalCH = dataRepo.totalCH + course.CreditHour;
                
            HStack{
                
  //              Button(action: {dataRepo.registerCourse(courseName: course.name)}) {
    //                Text("Register Course")
      //                  .foregroundColor(.white)
        //                .padding(.vertical)
          //              .frame(width: UIScreen.main.bounds.width - 250)
            //    }
              //  .background(Color("Blue"))
                //.cornerRadius(10)
                //.padding(.top)
                                
              
                Button(action: {  dataRepo.cartCourses(courseName: course.name)
                    if (dataRepo.totalCH <= 20)
                    {
                        self.activeAlert = .first
                    }
                    else
                    {
                        self.activeAlert = .second
                    }
                                self.showAlert = true
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
                                    }
                                }
                .background(Color("Blue"))
                .cornerRadius(10)
                .padding(.top)
                    
                }
            
            //Spacer(minLength: 100)
            }
        }
    }
}


