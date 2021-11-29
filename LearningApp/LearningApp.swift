//
//  LearningAppApp.swift
//  LearningApp
//
//  Created by Adam Abdul-rahim on 24/11/21.
//

import SwiftUI

@main
struct LearningApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(ContentModel())
        }
    }
}
