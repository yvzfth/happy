//
//  HappyApp.swift
//  Happy
//
//  Created by Fatih Yavuz on 18.06.2023.
//

import SwiftUI
import Firebase
//class AppDelegate: NSObject, UIApplicationDelegate {
//    func application(_ application: UIApplication,
//                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
//        FirebaseApp.configure()
//
//        return true
//    }
//}
@main
struct HappyApp: App {
    let persistenceController = PersistenceController.shared
   
//    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
//
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            //MainView()
            //SignupView()
            let currentUser = Auth.auth().currentUser
            if currentUser != nil {
                MainView()
                    .environment(\.managedObjectContext, persistenceController.container.viewContext) 
            }else {
                SignUpView()
                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
                   
            }
        }
    }
}

