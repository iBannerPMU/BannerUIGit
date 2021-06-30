//
//  Student.swift
//  BannerUI
//
//  Created by Rayan Alhindi on 27/07/1442 AH.
//

import SwiftUI
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift
import FirebaseAuth

class studentInfoModel: ObservableObject {
    
    private var db = Firestore.firestore()
    private var authRef = (Auth.auth().currentUser?.uid)!
    
}

struct StudentTab: View {
    
    @ObservedObject var dataRepo: dbRepo

    var body: some View {
        
        VStack {
            
            if((dataRepo.student) != nil){
                let user = dataRepo.student! as Student
                Text(user.fullName)
                Text(user.universityID)
                Text(user.universityEmail)
                Text(user.startLevel)
                Text(user.startMajor)
                Text(user.startingYear)
            } else {
                let user = dataRepo.admin! as Admin
                Text(user.fullName)
//                Text(user.universityID)
//                Text(user.universityEmail)
//                Text(user.startLevel)
//                Text(user.startMajor)
//                Text(user.startingYear)
            }
            
            
            
        }
    }
}
