//
//  PaddingViewModeifier.swift
//  Booker
//
//  Created by MEKHAK GHAPANTSYAN on 12.03.23.
//

import SwiftUI

struct Padding: ViewModifier {
    
    typealias Edges = (leading: CGFloat?, top: CGFloat?, trailing: CGFloat?, bottom: CGFloat?)
    
    var edges: Edges
    func body(content: Content) -> some View {
        content
            .padding(.leading, edges.leading)
            .padding(.top, edges.top)
            .padding(.trailing, edges.trailing)
            .padding(.bottom, edges.bottom)
    }
}

struct FlatLinkStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
    }
}

extension View {
    func padding(_ leading: CGFloat? = nil, _ top: CGFloat? = nil, _ trailing: CGFloat? = nil, _ bottom: CGFloat? = nil) -> some View {
        self.modifier(Padding(edges: Padding.Edges(leading: leading, top: top, trailing: trailing, bottom: bottom)))
    }
    func padding(_ leadingTrailing: CGFloat?, _ topBottom: CGFloat?) -> some View {
        return self.modifier(Padding(edges: Padding.Edges(leading: leadingTrailing, top: topBottom, trailing: leadingTrailing, bottom: topBottom)))
    }
}
