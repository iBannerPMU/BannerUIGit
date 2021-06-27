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

//class personalInfoModel: ObservableObject {
//
//    private var db = Firestore.firestore()
//    private var authRef = (Auth.auth().currentUser?.uid)!
//
//}

struct PersonalTab: View {
    
    @ObservedObject var user: Student
    
    var body: some View {
        //List(viewModel.studentInfo) { studentInformation in
            VStack {
                
                Text(user.fullName)
                Text(user.nationalID)
                Text(user.dateOfBirth)
                Text(user.email)
                Text(user.phoneNumber)
                
            }
        }
        
    }
