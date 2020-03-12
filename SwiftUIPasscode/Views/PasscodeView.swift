//
//  PasscodeView.swift
//  SwiftUIPasscode
//
//  Created by Vadim Zhilinkov on 12.03.2020.
//  Copyright © 2020 dreadct. All rights reserved.
//

import SwiftUI

struct PasscodeView {

    // MARK: - Properties

    @State private var passcodeInput = PasscodeInput()

}

// MARK: - View

extension PasscodeView: View {

    var body: some View {
        VStack(spacing: 40.0) {
            PasscodeInputIndicatorView(PasscodeInput: $passcodeInput)
            PasscodeKeyboardView(PasscodeInput: $passcodeInput)
            HStack {
                Button(action: {
                    withAnimation {
                        self.eraseOrCancel()
                    }
                }, label: {
                    Text(passcodeInput.isEmpty ? "Cancel" : "Erase")
                })
            }
        }
    }

}

// MARK: - Private methods

extension PasscodeView {

    private func cancelInput() {
        // TODO: do something already!
    }

    private func eraseOrCancel() {
        if passcodeInput.isEmpty {
            cancelInput()
            return
        }
        passcodeInput.erase()
    }

}

// MARK: - Preview

struct PasscodeView_Previews: PreviewProvider {
    static var previews: some View {
        PasscodeView()
    }
}
