
//  StudentRecords.swift
//  BannerUI
//
//  Created by Rayan Alhindi on 28/07/1442 AH.
//

import SwiftUI

struct StudentRecords: View {
    @ObservedObject var dataRepo: dbRepo
    @State var selection = 0
    private let items: [String] = ["AcademicTranscript", "Class Schedule"]
    
    var body: some View {
        ZStack {
            VStack {
                Picker(selection: $selection, label: Text("")) {
                    ForEach(0..<items.count, id: \.self) { index in
                        Text(self.items[index]).tag(index)
                    }
                }.pickerStyle(SegmentedPickerStyle())
            }
            .padding()
        }.navigationTitle("Student Records")
        .navigationBarTitleDisplayMode(.inline)
    }
}
