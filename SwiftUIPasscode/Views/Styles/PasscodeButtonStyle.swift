//
//  PasscodeButtonStyle.swift
//  SwiftUIPasscode
//
//  Created by Vadim Zhilinkov on 12.03.2020.
//  Copyright © 2020 dreadct. All rights reserved.
//

import SwiftUI

/// A style for pin buttons.
struct PasscodeButtonStyle: ButtonStyle {

    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .font(.title)
            .frame(minWidth: Constants.minSize.width,
                   minHeight: Constants.minSize.height)
            .background(backColor(configuration: configuration))
            .clipShape(Circle())
            .overlay(Circle()
                .strokeBorder(lineWidth: Constants.borderStrokeWidth)
                .foregroundColor(strokeColor(configuration: configuration)))
    }

    private func backColor(configuration: Configuration) -> some View {
        return Color.primary
            .opacity(configuration.isPressed
                ? Constants.backgroundOpacityPressed
                : Constants.backgroundOpacityNormal)
    }

    private func strokeColor(configuration: Configuration) -> Color {
        return configuration.isPressed
            ? Color.primary.opacity(Constants.strokeOpacityPressed)
            : .clear
    }

}

// MARK: - Constants

extension PasscodeButtonStyle {

    private enum Constants {
        static let borderStrokeWidth: CGFloat = 2.0
        static let minSize: CGSize = .init(width: 75.0, height: 75.0)
        static let backgroundOpacityNormal: Double = 0.2
        static let backgroundOpacityPressed: Double = 0.3
        static let strokeOpacityPressed: Double = 0.2
    }

}
