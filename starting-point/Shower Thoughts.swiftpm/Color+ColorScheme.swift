//
//  Color+ColorScheme.swift
//  Shower Thoughts
//
//  Created by Lexline Johnson on 2/4/25.
//

import SwiftUI

extension Color {
    var light: Self {
        var environment = EnvironmentValues()
        environment.colorScheme = .light
        if #available(iOS 17.0, *) {
            return Color(resolve(in: environment))
        } else {
            return Color(UIColor(self).resolvedColor(with: UITraitCollection(userInterfaceStyle: .light)))
        }
    }
    
    var dark: Self {
        var environment = EnvironmentValues()
        environment.colorScheme = .dark
        if #available(iOS 17.0, *) {
            return Color(resolve(in: environment))
        } else {
            return Color(UIColor(self).resolvedColor(with: UITraitCollection(userInterfaceStyle: .dark)))
        }
    }
}

