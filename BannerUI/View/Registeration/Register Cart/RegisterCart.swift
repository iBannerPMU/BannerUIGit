//
//  RegisterCart.swift
//  BannerUI
//
//  Created by Rayan Alhindi on 21/08/1442 AH.
//

import SwiftUI

enum activeAlert {
    case first, second
}

func removeDuplicates(array: [String]) -> [String] {
    var encountered = Set<String>()
    var result: [String] = []
    for value in array {
        if encountered.contains(value) {
            // Do not add a duplicate element.
        }
        else {
            // Add value to the set.
            encountered.insert(value)
            // ... Append the value.
            result.append(value)
        }
    }
    return result
}


struct RegisterCart: View {
    
    @State private var alert = false
    @State private var showAlert = false
    @State private var showAlert2 = false
    @State private var activeAlert: activeAlert = .first
    @State var noDupArray: [String]
    var courses: [String: Course?]
    @State var tempArray: [String]
    var dataRepo : dbRepo
    //var course: Course
    
   
    var body: some View {
        
        let noDupArray : [String] = removeDuplicates(array: tempArray)

        List {
            Section {
                ForEach(0 ..< noDupArray.count) { index in
                    NavigationLink(destination: TempRegister(dataRepo: dataRepo, course: courses[noDupArray[index]]!!)) {
                        Text(courses[noDupArray[index]]!!.name)
                    }
                }
            }
        }
        
        HStack {
        Button(action: { self.alert = true; dataRepo.registerCourse(courseName: dataRepo.course!.name)
            if (noDupArray.isEmpty)
            {
                self.activeAlert = .first
            }
            else
            {
                self.activeAlert = .second
            }
                        self.showAlert = true
        }) {
            Text("Submit Courses")
                .foregroundColor(.white)
                .padding(.vertical)
                .frame(width: UIScreen.main.bounds.width - 250)
                .alert(isPresented: $showAlert) {
                            switch activeAlert {
                            case .first:
                                return Alert(title: Text("Empty Cart"), message: Text("Add courses to your cart before submission."))
                            case .second:
                                return Alert(title: Text("Schedule Created"), message: Text("You have successfully created a new schedule."))
                            }
                        }
        }
        .background(Color("Blue"))
        .cornerRadius(10)
        .padding(.top)
        //Spacer(minLength: 200)
        
            Button(action: { self.alert = true; dataRepo.removeFromCart(courseName: dataRepo.course!.name)
                if (noDupArray.isEmpty)
                {
                    self.activeAlert = .first
                }
                else
                {
                    self.activeAlert = .second
                }
                            self.showAlert2 = true
            }) {
            Text("Remove All")
                .foregroundColor(.white)
                .padding(.vertical)
                .frame(width: UIScreen.main.bounds.width - 250)
                .alert(isPresented: $showAlert2) {
                            switch activeAlert {
                            case .first:
                                return Alert(title: Text("Empty Cart"), message: Text("No course has been added to your cart."))
                            case .second:
                                return Alert(title: Text("Courses removed"), message: Text("You have removed all courses from your cart."))
                            }
                        }
        }
        .background(Color(.systemRed))
        .cornerRadius(10)
        .padding(.top)
        }
    }
    
}
