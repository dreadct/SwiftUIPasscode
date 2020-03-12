//
//  GridStack.swift
//  SwiftUIPasscode
//
//  Created by Vadim Zhilinkov on 12.03.2020.
//  Copyright © 2020 dreadct. All rights reserved.
//

import SwiftUI

struct GridStack<Content: View>: View {

    typealias ContentClosure = (Int, Int) -> Content

    // MARK: - Properties

    let rows: Int
    let columns: Int
    let content: ContentClosure
    let spacing: CGPoint

    // MARK: - Initializers

    init(rows: Int,
         columns: Int,
         spacing: CGPoint = .init(x: 20.0, y: 20.0),
         @ViewBuilder content: @escaping ContentClosure) {
        self.rows = rows
        self.columns = columns
        self.content = content
        self.spacing = spacing
    }

    // MARK: - View

    var body: some View {
        VStack(spacing: spacing.x) {
            ForEach(0 ..< rows, id: \.self) { row in
                HStack(spacing: self.spacing.y) {
                    ForEach(0 ..< self.columns, id: \.self) { column in
                        self.content(row, column)
                    }
                }
            }
        }
    }

}

struct GridStack_Previews: PreviewProvider {
    static var previews: some View {
        GridStack(rows: 4, columns: 4) { row, col in
            Text("(\(row); \(col))")
        }
    }
}
