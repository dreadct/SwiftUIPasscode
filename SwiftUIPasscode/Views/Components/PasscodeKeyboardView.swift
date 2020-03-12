//
//  PasscodeKeyboardView.swift
//  SwiftUIPasscode
//
//  Created by Vadim Zhilinkov on 13.03.2020.
//  Copyright © 2020 dreadct. All rights reserved.
//

import SwiftUI

struct PasscodeKeyboardView {

    // MARK: - Properties

    @Binding var PasscodeInput: PasscodeInput

}

// MARK: - View

extension PasscodeKeyboardView: View {

    var body: some View {
        gridView()
    }

}

// MARK: - Numpad position

extension PasscodeKeyboardView {

    private enum NumpadPosition {
        case bottomLeftCorner
        case bottomRightCorner
        case digit(_ input: PasscodeButton.Input)
    }

}

// MARK: - Private methods

extension PasscodeKeyboardView {

    private func gridContentView(row: Int,
                                 column: Int,
                                 buttonAction: PasscodeButton.Action?) -> AnyView {
        guard let position = numpadPosition(row: row, column: column) else {
            return AnyView(EmptyView())
        }

        guard case .digit(let input) = position else {
            return AnyView(EmptyView())
        }

        return AnyView(PasscodeButton(input: input, action: buttonAction))
    }

    private func gridView() -> GridStack<AnyView> {
        return .init(rows: 4, columns: 3, content: { row, column -> AnyView in
            self.gridContentView(row: row,
                                 column: column,
                                 buttonAction: self.handleInput)
        })
    }

    private func handleInput(_ input: PasscodeButton.Input) {
        PasscodeInput.enter(character: .init(input.description))
    }

    private func numpadPosition(row: Int, column: Int) -> NumpadPosition? {
        if row < 0, row >= 4,
            column < 0, column >= 3 {
            return nil
        }

        if row < 3 {
            let digitValue = 1 + 3 * row + column
            if let input = PasscodeButton.Input(rawValue: digitValue) {
                return .digit(input)
            } else {
                return nil
            }
        }

        switch column {
        case 0:
            return .bottomLeftCorner
        case 2:
            return .bottomRightCorner
        default:
            return .digit(.Digit0)
        }
    }

}

// MARK: - Preview

struct PasscodeKeyboardView_Previews: PreviewProvider {

    private struct PreviewContainer: View {

        @State private var input = PasscodeInput()

        var body: some View {
            VStack(spacing: 10.0) {
                Text("// Entered \(input.inputLength) characters //")
                PasscodeKeyboardView(PasscodeInput: $input)
            }
        }

    }

    static var previews: some View {
        PreviewContainer()
    }

}
