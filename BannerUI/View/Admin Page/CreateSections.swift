//
//  CreateSections.swift
//  BannerUI
//
//  Created by Rayan Alhindi on 22/08/1442 AH.
//

import SwiftUI

struct CreateSections: View {
    
    @ObservedObject var dataRepo : dbRepo
    
    var body: some View {
                
        List {
            Section {
                ForEach(0 ..< dataRepo.emptyCourseArray.count, id: \.self) { index in
                    NavigationLink(destination: courseInfo(course: dataRepo.courseArray[dataRepo.emptyCourseArray[index]]!!, dataRepo: dataRepo)) {
                        Text(dataRepo.courseArray[dataRepo.emptyCourseArray[index]]!!.name)
                    }
                }
    }
}

    
    
    }
}

