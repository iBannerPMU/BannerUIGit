//
//  dbRepo.swift
//  BannerUI
//
//  Created by Rayan Alhindi on 27/07/1442 AH.
//

import Foundation
import FirebaseAuth
import Firebase
import FirebaseFirestoreSwift
import Combine


class dbRepo: ObservableObject {
    
    var authRef : String = ""
    let db = Firestore.firestore()
    @Published var student: Student?
    @Published var admin: Admin?
    @Published var course: Course?
    @Published var faculty: Faculty?
    @Published var regcourse: [Course?] = []
    @Published var regSecs: [section] = []
    @Published var finishedcourse: [Course?] = []
    @Published var courseArray: [String: Course?] = ["": nil]
    @Published var emptyCourseArray: [String] = []
    @Published var registerArray: [String: Course?] = ["": nil]
    @Published var emptyRegisterArray: [String] = []
    @Published var registeredArray: [Course?] = []
    @Published var emptyRegisteredArray: [String] = []
    @Published var emptyFinishedArray: [String] = []
    @Published var cartArray: [String: Course?] = [:]
    @Published var emptyCartArray: [String] = []
    @Published var totalCH: Int = 0
    @Published var arrayCourses: [Course] = []
    @Published var Sections: [section] = []
    @Published var allFac: [Faculty] = []
    
    init() {
        
        if Auth.auth().currentUser == nil { } else {
            getData()
        }
    }
    
    func clear() {
        
        authRef = ""
        student = nil
        admin = nil
        course = nil
        faculty = nil
        regcourse = []
        courseArray = ["": nil]
        emptyCourseArray = []
        registerArray = ["": nil]
        emptyRegisterArray = []
        cartArray = ["": nil]
        emptyCartArray = []
        finishedcourse = []
        registeredArray = []
        emptyRegisteredArray = []
        emptyFinishedArray = []
        emptyCartArray = []
        arrayCourses = []
        Sections = []
        allFac = []
        
    }
    
    
    //Getting all users data once a user sign in
    func getData() {
        
        authRef = Auth.auth().currentUser!.uid
        db.collection("Students").document(authRef).getDocument { (document, error) in
            if let document = document, document.exists {
                print("Student Login")
                self.getStudentData()
                self.getCourses()
                self.getAllfac()
                self.getRegisteredSections()
                
            } else {
                self.db.collection("Admins").document(self.authRef).getDocument { (doc, err) in
                    if let document = doc, document.exists {
                        print("Admin Login")
                        self.getAdminData()
                        self.getAllfac()
                        self.getCourses()
                    } else {
                        self.db.collection("Faculty").document(self.authRef).getDocument { (doc, err) in
                            if let document = doc, document.exists {
                                print("Faculty Login")
                                self.getFacultyData()
                                self.getCourses()
                            }
                        }
                    }
                }
            }
        }
    }
    
    //Admin Functionalities
    //====================================================================================================================
    
    // Retrieving Admin details from the database
    func getAdminData() {
        
        db.collection("Admins").document(authRef).addSnapshotListener { (document, error) in
            if error == nil {
                if let b = document {
                    do {
                        self.admin = try b.data(as: Admin.self)
                    } catch {
                        let data = document?.data()
                        let fName = data!["fullName"] as? String ?? ""
                        let uID = data!["universityID"] as? String ?? ""
                        let uEmail = data!["universityEmail"] as? String ?? ""
                        let pNumber = data!["phoneNumber"] as? String ?? ""
                        let pEmail = data!["email"] as? String ?? ""
                        let adminInfo = Admin(fullName: fName, universityID: uID, universityEmail: uEmail, phoneNumber: pNumber, email: pEmail)
                        self.admin = adminInfo
                    }
                }
            } else {
                print(error?.localizedDescription ?? "Error")
            }
        }
    }
    
    
    // Add Course data in the database using Admin account
    func addCourseData(course: Course){
        do {
            _ = try db.collection("Courses").addDocument(from: course)
        } catch {
            print("Error adding sections.")
        }
    }
    
    
    // Add Section data in the database using Admin account
    func addSection(Section: section) {
        do {
            let ref = try db.collection("Sections").addDocument(from: Section)
            updateCourseSections(CourseID: Section.courseID, SectionID: ref.documentID)
            addSecToFac(sectionID: ref.documentID, facID: Section.InstructorID)
        } catch {
            print("Error adding sections.")
        }
    }
    
    
    // Create Faculty in the database
    func addFacultyData(user: Faculty) {
        
        Auth.auth().createUser(withEmail: user.universityEmail, password: user.ID!) { (Result, err) in
            if err == nil {
                do {
                    try! self.db.collection("Faculty").document(Result!.user.uid).setData(from: user)
                }
            }
        }
    }
    
    
    // Create Student in the database
    func addStudentData(user: Student) {
        
        Auth.auth().createUser(withEmail: user.universityEmail, password: user.nationalID) { (Result, err) in
            if err == nil {
                do {
                    try! self.db.collection("Students").document(Result!.user.uid).setData(from: user)
                }
            }
        }
    }
    
    
    // Add Sections to Faculty using Admin account
    func addSecToFac(sectionID: String, facID: String){
        let courseDoc = db.collection("Faculty").document(facID)
        courseDoc.updateData(["currentCourses": [sectionID]])
    }
    
    
    // Updating Course Sections using Admin account
    func updateCourseSections(CourseID: String, SectionID: String) {
        let courseDoc = db.collection("Courses").document(CourseID)
        courseDoc.updateData(["sections": SectionID])
    }
    
    
    
    
    
    //Faculty Functionalities
    //====================================================================================================================
    
    // Retrieving Faculty data from the Database
    func getFacultyData() {
        
        db.collection("Faculty").document(authRef).addSnapshotListener { (document, error) in
            if error == nil {
                if let b = document {
                    do {
                        self.faculty = try b.data(as: Faculty.self)
                    } catch {
                        
                        let data = document?.data()
                        let fName = data!["fullName"] as? String ?? ""
                        let DoB = data!["dateOfBirth"] as? String ?? ""
                        let pID = data!["ID"] as? String ?? ""
                        let pNumber = data!["phoneNumber"] as? String ?? ""
                        let pEmail = data!["email"] as? String ?? ""
                        let uEmail = data!["universityEmail"] as? String ?? ""
                        
                        let facultyInfo = Faculty(fullName: fName, email: pEmail, dateOfBirth: DoB, phoneNumber: pNumber, ID: pID, universityEmail: uEmail)
                        self.faculty = facultyInfo
                    }
                }
            } else {
                print(error?.localizedDescription ?? "Error")
            }
        }
    }
    
    
    //Getting Faculty data to show them in the Student Registeration
    func getAllfac(){
        
        db.collection("Faculty").addSnapshotListener { (querySnapshot, error) in
            if let coursesArray = querySnapshot {
                self.allFac = coursesArray.documents.compactMap { courseDocument in
                    do {
                        let x = try courseDocument.data(as: Faculty.self)
                        return x
                    } catch {
                        print(error)
                    }
                    return nil
                }
            }
        }
    }
    
    
    //Student Functionalities
    //====================================================================================================================
    
    // Retrieving Student data from the Database
    func getStudentData() {
        
        db.collection("Students").document(authRef).addSnapshotListener { (document, error) in
            if error == nil {
                if let b = document {
                    do {
                        self.student = try b.data(as: Student.self)
                    } catch {
                        let data = document?.data()
                        let fName = data!["fullName"] as? String ?? ""
                        let email = data!["email"] as? String ?? ""
                        let DoB = data!["dateOfBirth"] as? String ?? ""
                        let pNumber = data!["phoneNumber"] as? String ?? ""
                        let nID = data!["nationalID"] as? String ?? ""
                        let sLevel = data!["startLevel"] as? String ?? ""
                        let sMajor = data!["startMajor"] as? String ?? ""
                        let sYear = data!["startingYear"] as? String ?? ""
                        let uID = data!["universityID"] as? String ?? ""
                        let uEmail = data!["universityEmail"] as? String ?? ""
                        let studentInfo = Student(fullName: fName, email: email, dateOfBirth: DoB, phoneNumber: pNumber, nationalID: nID, startLevel: sLevel, startMajor: sMajor, startingYear: sYear, universityID: uID, universityEmail: uEmail)
                        self.student = studentInfo
                    }
                }
            } else {
                print(error?.localizedDescription ?? "Error")
            }
        }
    }
    
    
    //Courses Functionalities
    //====================================================================================================================
    
    
    //Getting the courses to show them in the Registeration System
    func getCourses() {
        let sortedCourses = db.collection("Courses").order(by: "name", descending: false)
        sortedCourses.addSnapshotListener { (querySnapshot, error) in
            if let coursesArray = querySnapshot {
                self.arrayCourses = coursesArray.documents.compactMap { courseDocument in
                    do {
                        let x = try courseDocument.data(as: Course.self)
                        self.course = x
                        self.courseArray[x!.id!] = self.course
                        self.emptyCourseArray.append(x!.id!)
                        return x
                    } catch {
                        print(error)
                    }
                    return nil
                }
            }
        }
    }
    
    
    //Getting the sections to show them in the Registeration System
    func getSections(CourseID: String) {
        
        db.collection("Sections").whereField("courseID", isEqualTo: CourseID).addSnapshotListener { (querySnapshot, error) in
            if let sectionArray = querySnapshot {
                self.Sections = sectionArray.documents.compactMap { sectionDocument in
                    do {
                        let x = try sectionDocument.data(as: section.self)
                        return x
                    } catch {
                        print(error)
                    }
                    return nil
                }
            }
        }
    }
    
    
    //Adding courses to the cart and check Hours
    func cartCourses(courseID : String) {
        
        if (self.totalCH <= 20)
        {
            db.collection("Courses").whereField("id", isEqualTo: courseID).addSnapshotListener { (querySnapshot, error) in
                if let coursesArray = querySnapshot {
                    self.arrayCourses = coursesArray.documents.compactMap { courseDocument in
                        do {
                            let x = try courseDocument.data(as: Course.self)
                            self.course = x
                            self.courseArray[x!.name] = self.course
                            self.emptyCourseArray.append(x!.name)
                            return x
                        } catch {
                            print(error)
                        }
                        return nil
                    }
                }
            }
        }
    }
    
    
    //Prerequisite checker function
    @Published var preReqChecker: Bool = false
    func reqChecker (PreRequisitNList: [String], callback: @escaping (Bool) -> Void) -> Bool{
        
        db.collection("Students").document(authRef).collection("FinishedCourses").getDocuments { (docSnapshot, error) in
            if let error = error {
                print(error.localizedDescription)
            }
            else {
                for document in docSnapshot!.documents {
                    for PreRequisitN in PreRequisitNList
                    {
                        if (document.documentID == PreRequisitN)
                        {
                            self.preReqChecker = true
                        }
                    }
                }
                callback(self.preReqChecker)
            }
        }
        return self.preReqChecker
    }
    
    
    //Register courses to the Student schedule
    func registerCourse(sectionIDs : [String], sections: [String: section?]) {
        for c in sectionIDs {
            let section = sections[c]!
            print(totalCH)
            print(course!.name)
            do {
                _ = try db.collection("Students").document(authRef).collection("RegisteredCourses").document(self.courseArray[section!.courseID]!!.name).setData(from: section)
            } catch {
                print("Error adding sections.")
            }
            
        }
        self.getRegisteredSections()
    }
    
    
    //Getting courses details to show them in the class schedule
    func getRegisteredSections() {
        db.collection("Students").document(authRef).collection("RegisteredCourses").addSnapshotListener { (querySnapshot, error) in
            if let sectionArray = querySnapshot {
                self.Sections = sectionArray.documents.compactMap { sectionDocument in
                    do {
                        let x = try sectionDocument.data(as: section.self)
                        self.regSecs.append(x!)
                        return x
                    } catch {
                        print(error)
                    }
                    return nil
                }
            }
        }
    }
}
