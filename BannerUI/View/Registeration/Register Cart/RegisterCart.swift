//
//  RegisterCart.swift
//  BannerUI
//
//  Created by Rayan Alhindi on 21/08/1442 AH.
//

import SwiftUI

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
    
    var courses: [String: Course?]
    var tempArray: [String]
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
        Button(action: { self.alert = true; dataRepo.registerCourse(courseName: dataRepo.course!.name)}) {
            Text("Submit Courses")
                .foregroundColor(.white)
                .padding(.vertical)
                .frame(width: UIScreen.main.bounds.width - 250)
                .alert(isPresented: $alert, content: {
                    Alert(title: Text("Schedule Created"), message: Text("You have successfully created a new schedule."), dismissButton: .default(Text("OK")))
                })
        }
        .background(Color("Blue"))
        .cornerRadius(10)
        .padding(.top)
        //Spacer(minLength: 200)
    }
}
