//
//  RegisterCart.swift
//  BannerUI
//
//  Created by Rayan Alhindi on 21/08/1442 AH.
//

import SwiftUI

struct RegisterCart: View {
    
    var courses: [String: Course?]
    var tempArray: [String]
    var dataRepo : dbRepo
    //var course: Course
    
    var body: some View {
        
        List {
            Section {
                ForEach(0 ..< tempArray.count) { index in
                    NavigationLink(destination: TempRegister(dataRepo: dataRepo, course: courses[tempArray[index]]!!)) {
                        Text(courses[tempArray[index]]!!.name)
                    }
                }
            }
        }
        Button(action: {dataRepo.registerCourse(courseName: dataRepo.course!.name)}) {
            Text("Submit Courses")
                .foregroundColor(.white)
                .padding(.vertical)
                .frame(width: UIScreen.main.bounds.width - 250)
        }
        .background(Color("Blue"))
        .cornerRadius(10)
        .padding(.top)
        //Spacer(minLength: 200)
    }
}
