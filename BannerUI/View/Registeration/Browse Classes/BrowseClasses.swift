//
//  BrowseClasses.swift
//  BannerUI
//
//  Created by Rayan Alhindi on 27/07/1442 AH.
//

import SwiftUI

struct BrowseClasses: View {
    
    var courses: [String: Course?]
    var stringArray: [String]
    @ObservedObject var dataRepo: dbRepo
    @Binding var sections: [String: section?]
    @Binding var tempArray: [String]
    
    var body: some View {
        
        List {
            Section {
                ForEach(0 ..< stringArray.count, id: \.self) { index in
                    NavigationLink(destination: courseInfo(course: courses[stringArray[index]]!!, dataRepo: dataRepo, sections: dataRepo.Sections)) {
                        Text(courses[stringArray[index]]!!.name)
                    }.onDisappear{
                        dataRepo.getSections(CourseID: courses[stringArray[index]]!!.id!)
                    }
                }
            }
        }
    }
}
