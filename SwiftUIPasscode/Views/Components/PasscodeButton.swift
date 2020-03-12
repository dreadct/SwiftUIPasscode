//
//  PasscodeButton.swift
//  SwiftUIPasscode
//
//  Created by Vadim Zhilinkov on 12.03.2020.
//  Copyright © 2020 dreadct. All rights reserved.
//

import SwiftUI

struct PasscodeButton {

    typealias Action = (Input) -> Void

    // MARK: - Properties

    let action: Action?
    let input: Input

    // MARK: - Initializers

    init(input: Input, action: Action? = nil) {
        self.action = action
        self.input = input
    }

}

// MARK: - View

extension PasscodeButton: View {

    var body: some View {
        Button(action: {
            withAnimation {
                self.action?(self.input)
            }
        }, label: {
            Text(self.input.description)
        })
        .buttonStyle(PasscodeButtonStyle())
    }

}

// MARK: - Input

extension PasscodeButton {

    enum Input: Int, CaseIterable, CustomStringConvertible {

        case Digit1 = 1
        case Digit2 = 2
        case Digit3 = 3
        case Digit4 = 4
        case Digit5 = 5
        case Digit6 = 6
        case Digit7 = 7
        case Digit8 = 8
        case Digit9 = 9
        case Digit0 = 0

        var description: String {
            return String(rawValue)
        }

    }

}

// MARK: - Preview

struct PasscodeButton_Previews: PreviewProvider {
    static var previews: some View {
        PasscodeButton(input: .Digit7)
    }
}
