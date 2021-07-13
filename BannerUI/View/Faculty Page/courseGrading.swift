//
//  courseGrading.swift
//  BannerUI
//
//  Created by Rayan Alhindi on 10/07/2021.


import SwiftUI

struct courseGrading: View {
    
    @State var username: String = ""

    @ObservedObject var repo: dbRepo
    
    var body: some View {
        NavigationView {
            Form {
                Text("Username")
                TextField("", text: $username)
            }
            .navigationBarTitle("Grades")
        }.padding()
        Button(action: {
            
            //            let user = Student(fullName: fullName, email: email, dateOfBirth: dateOfBirth, phoneNumber: phoneNumber, nationalID: nationalID, startLevel: startLevel, startMajor: startMajor, startingYear: startingYear, universityID: universityID, universityEmail: universityEmail)
            //            repo.addStudentData(user: user)
        }) {
            
            Text("Register")
            
        }
        
        
    }
}
