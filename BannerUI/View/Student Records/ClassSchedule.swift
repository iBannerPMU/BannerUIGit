//
//  ClassSchedule.swift
//  BannerUI
//
//  Created by Mohammad Alrashed on 09/04/2021.
//
import Foundation
import SwiftUI
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift
import FirebaseAuth



struct ClassSchedule: View {
    
    @ObservedObject var dataRepo: dbRepo
    var scheduleCH: Int = 0
    
    var course: Course?
    
    @State private var showAlert = false
    @State private var activeAlert: ActiveAlert = .first
    
    var body: some View {
        VStack {
            //Text("Totoal Credit Hours:" + dataRepo.totalCH)
            List {
                ForEach(0 ..< dataRepo.regSecs.count, id: \.self) {index in
                    Section{
                        NavigationLink(destination: sectionInfo(SectionDetails: dataRepo.regSecs[index], course: dataRepo.courseArray[dataRepo.regSecs[index].courseID]!!)){
                            Text(dataRepo.courseArray[dataRepo.regSecs[index].courseID]!!.name)
                        }
                    }
                }
            }
        }.navigationTitle("Student Schedule")
        .navigationBarTitleDisplayMode(.inline)
    }
}


