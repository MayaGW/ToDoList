//
//  ThemeSettings.swift
//  ToDoList
//
//  Created by Maya Ghamloush on 21/03/2024.
//

import SwiftUI

//MARK: - THEME CLASS

class ThemeSettings: ObservableObject{
    
    @Published var themeSettings: Int = UserDefaults.standard.integer(forKey: "Theme"){
        didSet{
            UserDefaults.standard.set(themeSettings, forKey: "Theme")
        }
    }
    private init() {}

      public static let shared = ThemeSettings()

    }
 
