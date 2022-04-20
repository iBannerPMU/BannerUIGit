//
//  CreateSections.swift
//  BannerUI
//
//  Created by Rayan Alhindi on 22/08/1442 AH.
//

import SwiftUI

struct CreateSections: View {
    
    @ObservedObject var repo : dbRepo
    
    var body: some View {
        ZStack{
        List {
            Section {
                ForEach(0 ..< repo.emptyCourseArray.count, id: \.self) { index in
                    NavigationLink(destination: courseInfo(course: repo.courseArray[repo.emptyCourseArray[index]]!!, dataRepo: repo, sections: repo.Sections)) {
                        Text(repo.courseArray[repo.emptyCourseArray[index]]!!.name)
                    }.onAppear{
                        repo.getSections(CourseID: repo.courseArray[repo.emptyCourseArray[index]]!!.id!)
                        
                    }
                }
            }
        }
    }.navigationTitle("Create Sections")
      .navigationBarTitleDisplayMode(.inline)
}
}



