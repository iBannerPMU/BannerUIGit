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
    @Published var regcourse: [Course?] = []
    @Published var finishedcourse: [Course?] = []
    @Published var financial: Financial?
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
        courseArray = ["": nil]
        emptyCourseArray = []
        registerArray = ["": nil]
        emptyRegisterArray = []
        cartArray = ["": nil]
        emptyCartArray = []
        //allCourses = []

    }

    func getData() {
        
        authRef = Auth.auth().currentUser!.uid
        db.collection("Students").document(authRef).getDocument { (document, error) in
            if let document = document, document.exists {
                print("Student Login")
                self.getStudentData()
                self.getCourses()
                self.registerCourses()
                //self.getFinancialData()
                self.getRegisteredCourses()
            } else {
                self.db.collection("Admins").document(self.authRef).getDocument { (doc, err) in
                    if let document = doc, document.exists {
                        print("Admin Login")
                        self.getAdminData()
                    }
                }
            }
        }
        
    }

    func addData(user: Student) {

        Auth.auth().createUser(withEmail: user.universityEmail, password: user.nationalID) { (Result, err) in
            if err == nil {
                do {
                    try! self.db.collection("Students").document(Result!.user.uid).setData(from: user)
                }
            }
        }
    }

    func registerCourse(courseName : String) {
        //let courseString = db.collection("Students").document(authRef).collection("FinishedCourses").whereField("name", isEqualTo: courseName)
        //if (courseString.isEqual(course?.PreReqName)){
            for c in self.cartArray {
                let course = c.value
                print(totalCH)
                print(course!.name)
                db.collection("Students").document(authRef).collection("RegisteredCourses").document(course!.name).setData( (course?.toMap())! ) { err in
                    if let err = err {
                        print("Error adding document: \(err)")
                    } else {
                        print("Document added with ID")
                    }
                }
            }
        //}
        //else{
          //  print("This course has a Pre Requisite")
        //}
        self.getRegisteredCourses()
    }
    
    func getRegisteredCourses() {
        
        db.collection("Students").document(authRef).collection("RegisteredCourses").getDocuments { (docSnapshot, error) in
            if let error = error {
                print(error.localizedDescription)
            }
            else {
                for document in docSnapshot!.documents {
                    
                    let data = document.data()
                    let id = data["ID"] as? String ?? ""
                    let Major = data["Major"] as? String ?? ""
                    let CreditHour = data["CreditHour"] as? Int ?? 0
                    let hasPreRequisite = data["hasPreRequisite"] as? Bool ?? false
                    let elective = data["elective"] as? Bool ?? false
                    let PreReqName = data["PreReqName"] as? String ?? ""

                    
                    let courseInfo = Course(name: document.documentID, CreditHour: CreditHour, ID: id, Major: Major, hasPreRequisite: hasPreRequisite, elective: elective, PreReqName: PreReqName)
                    
                    self.regcourse.append(courseInfo)
                    self.emptyRegisteredArray.append(courseInfo.name)
                }
            }
        }
    }

//    func getFinancialData() {
//        db.collection("Accounts").document(authRef).addSnapshotListener { (document, error) in
//            if error == nil {
//                if let b = document {
//                    do {
//                        self.financial = try b.data(as: Financial.self)
//                    } catch {
//                        print("a")
//                    }
//                }
//            }
//            else {
//                print(error?.localizedDescription ?? "Error")
//            }
//        }
//    }


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

    func addCourse(Course: Course) {
        do {
            _ = try db.collection("Courses").addDocument(from: Course)
        } catch {
            print("Error adding course.")
        }
    }

    func addSection(Section: section) {
        do {
            let ref = try db.collection("Sections").addDocument(from: Section)
            updateCourseSections(CourseID: Section.courseID, SectionID: ref.documentID)
        } catch {
            print("Error adding sections.")
        }
    }

    func updateCourseSections(CourseID: String, SectionID: String) {
        let courseDoc = db.collection("Courses").document(CourseID)
        courseDoc.updateData(["sections": SectionID])
    }

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
    //.whereField("name", isEqualTo: true).getDocuments

    func registerCourses() {
        //getting all courses where major = computer science & all courses
        db.collection("Courses").whereField("Major", isEqualTo: "CS").getDocuments { (docSnapshot, error) in
            if let error = error {
                print(error.localizedDescription)
            }
            else {
                for document in docSnapshot!.documents {
                    
                    let data = document.data()
                    let id = data["ID"] as? String ?? ""
                    let Major = data["Major"] as? String ?? ""
                    let CreditHour = data["CreditHour"] as? Int ?? 0
                    let hasPreRequisite = data["hasPreRequisite"] as? Bool ?? false
                    let elective = data["elective"] as? Bool ?? false
                    let PreReqName = data["PreReqName"] as? String ?? ""


                    
                    let courseInfo = Course(name: document.documentID, CreditHour: CreditHour, ID: id, Major: Major, hasPreRequisite: hasPreRequisite, elective: elective, PreReqName: PreReqName)
                    
                    self.course = courseInfo
                    self.registerArray[courseInfo.name] = courseInfo
                    self.emptyRegisterArray.append(courseInfo.name)
                }
            }
        }
    }

    func cartCourses(courseName : String) {
        //getting all courses where major = computer science & all courses
        
        //let courseString = db.collection("Students").document(authRef).collection("FinishedCourses").whereField("name", isEqualTo: courseName)
        //if (courseString.isEqual(course?.PreReqName)){
        
        self.totalCH = self.totalCH + (course?.CreditHour)!
        if (totalCH <= 20)
        {
        db.collection("Courses").whereField("name", isEqualTo: courseName).getDocuments { (docSnapshot, error) in
            if let error = error {
                print(error.localizedDescription)
            }
            else {
                    
                    
                for document in docSnapshot!.documents {
                    
                    let data = document.data()
                    let id = data["ID"] as? String ?? ""
                    let Major = data["Major"] as? String ?? ""
                    let CreditHour = data["CreditHour"] as? Int ?? 0
                    let hasPreRequisite = data["hasPreRequisite"] as? Bool ?? false
                    let elective = data["elective"] as? Bool ?? false
                    let PreReqName = data["PreReqName"] as? String ?? ""


                    
                    let courseInfo = Course(name: document.documentID, CreditHour: CreditHour, ID: id, Major: Major, hasPreRequisite: hasPreRequisite, elective: elective, PreReqName: PreReqName)
                    
                    self.course = courseInfo
                    self.cartArray[courseInfo.name] = courseInfo
                    self.emptyCartArray.append(courseInfo.name)
                }
            }
        }
    }
}

    func getCourses() {
        
        db.collection("Courses").getDocuments { (docSnapshot, error) in
            if let error = error {
                print(error.localizedDescription)
            }
            else {
                for document in docSnapshot!.documents {
                    
                    let data = document.data()
                    let id = data["ID"] as? String ?? ""
                    let Major = data["Major"] as? String ?? ""
                    let CreditHour = data["CreditHour"] as? Int ?? 0
                    let hasPreRequisite = data["hasPreRequisite"] as? Bool ?? false
                    let elective = data["elective"] as? Bool ?? false
                    let PreReqName = data["PreReqName"] as? String ?? ""


                    
                    let courseInfo = Course(name: document.documentID, CreditHour: CreditHour, ID: id, Major: Major, hasPreRequisite: hasPreRequisite, elective: elective, PreReqName: PreReqName)
                    
                    self.course = courseInfo
                    self.courseArray[courseInfo.name] = courseInfo
                    self.emptyCourseArray.append(courseInfo.name)
                }
            }
        }
    }
}




//        db.collection("Courses").document().addSnapshotListener { (document, error) in
//            if error == nil {
//                if let b = document {
//                    do {
//                        self.course = try b.data(as: Course.self)
//                    } catch {
//                    let data = document?.data()
//                        let courseName = data!["name"] as? String ?? ""
//                        let cHour = data!["CreditHour"] as? String ?? ""
//
//                    let courseInfo = Course(name: courseName, CreditHour: cHour)
//                    self.course = courseInfo
//                }
//            } else {
//                print(error?.localizedDescription ?? "Error")
//            }
//        }
//      }



//                    let sPayment = "29000"
//                    let Locker = "150"
//                    let cCenter = "0"
//
//                    let financialInfo = Financial(semesterPayment: sPayment, Locker: Locker, copyCenter: cCenter, payedAmount: pPayment)
//                    do {
//                        try! self.db.collection("Accounts").document(Result!.user.uid).setData(financialInfo)
//                    }
