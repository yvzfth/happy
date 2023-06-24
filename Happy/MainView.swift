//
//  ContentView.swift
//  Happy
//
//  Created by Fatih Yavuz on 18.06.2023.
//

import SwiftUI
import CoreData
import FirebaseAuth
struct MainView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @StateObject var firestoreManager = FirestoreManager()
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            MessagesView()
                .tabItem {
                    Label("Messages", systemImage: "message")
                }
            LiveStream().tabItem {
                Label("Live", systemImage: "video.and.waveform")
                
            }
            ProfileView().tabItem {
                Label("Profile", systemImage: "person")
            }
        }.environmentObject(firestoreManager)
        
    }
    
    
    
    
    
}



struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
