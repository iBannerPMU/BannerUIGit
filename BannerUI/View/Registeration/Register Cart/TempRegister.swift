//
//  TempRegister.swift
//  BannerUI
//
//  Created by Rayan Alhindi on 21/08/1442 AH.
//

import SwiftUI

struct TempRegister: View {
    
    
    @ObservedObject var dataRepo : dbRepo
    var section: section
    var course: Course?
    var courseID: String
    
    var body: some View {
        
        VStack {
            List {
                Text("Course Name : \(courseID)")
                Text("Course Credit Hours : \(courseID)")
                Text("Course's Major : \(courseID)")
                
            }.padding()
        }
    }
}
