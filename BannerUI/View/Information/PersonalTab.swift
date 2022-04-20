//
//  PersonalView.swift
//  BannerUI
//
//  Created by Rayan Alhindi on 27/07/1442 AH.
//

import SwiftUI
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift
import FirebaseAuth

struct PersonalTab: View {
    
    @ObservedObject var dataRepo: dbRepo
    
    var body: some View {
        VStack(spacing: 30) {
            
            if((dataRepo.student) != nil){
                let user = dataRepo.student! as Student
                Text("Full Name: " + user.fullName).bold()
                Text("National ID: " + user.nationalID).bold()
                Text("Date Of Birth: " + user.dateOfBirth).bold()
                Text("Email: " + user.email).bold()
                Text("Phone Number: " + user.phoneNumber).bold()
            } else if ((dataRepo.admin) != nil){
                let user = dataRepo.admin! as Admin
                Text("Full Name: " + user.fullName).bold()
                Text("University Email: " + user.universityEmail).bold()
                Text("University ID: " + user.universityID).bold()
                Text("University Email: " + user.email).bold()
                Text("Phone Number: " + user.phoneNumber).bold()
            } else {
                let user = dataRepo.faculty! as Faculty
                Text("Full Name: " + user.fullName).bold()
                Text("Email: " + user.email).bold()
                Text("Full Name: " + user.dateOfBirth).bold()
                Text("Phone Number: " + user.phoneNumber).bold()
                Text("University Email: " + user.universityEmail).bold()
                
            }
        }.font(.system(size: 22))
    }
}
