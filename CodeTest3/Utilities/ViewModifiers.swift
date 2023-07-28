//
//  ViewModifiers.swift
//  CodeTest1
//
//  Created by Hein Aung on 26/07/2023.
//

import Foundation
import SwiftUI

struct cardViewModifier: ViewModifier {
    @State var radius: CGFloat
    func body(content: Content) -> some View {
        content
            .padding()
            .background(RoundedRectangle(cornerRadius: radius)
                .foregroundColor(.white))
            .shadow(color: .primary.opacity(0.09), radius: 20, x: 0, y: 10)
    }
}

struct roundedViewModifier: ViewModifier {
    @State var bgColor: Color
    @State var addPadding: Bool
    func body(content: Content) -> some View {
        if addPadding {
            content
                .padding()
                .background(RoundedRectangle(cornerRadius: content.getRect().height / 2)
                    .foregroundColor(bgColor))
        } else {
            content
                .background(RoundedRectangle(cornerRadius: content.getRect().height / 2)
                    .foregroundColor(bgColor))
        }
    }
}

struct roundedWithBorderViewModifier: ViewModifier {
    @State var bgColor: Color
    @State var strokeColor: Color
    @State var addPadding: Bool
    func body(content: Content) -> some View {
        if addPadding {
            content
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: content.getRect().height / 2)
                        .stroke(strokeColor, lineWidth: 1)
                        .background( RoundedRectangle(cornerRadius: content.getRect().height / 2 - 2)
                            .foregroundColor(bgColor))            )
        } else {
            content
                .background(
                    RoundedRectangle(cornerRadius: content.getRect().height / 2)
                        .stroke(strokeColor, lineWidth: 1)
                        .background( RoundedRectangle(cornerRadius: content.getRect().height / 2 - 2)
                            .foregroundColor(bgColor))            )
        }
        
    }
}

struct roundedWithBorderWithoutPaddingViewModifier: ViewModifier {
    @State var bgColor: Color
    @State var strokeColor: Color
    func body(content: Content) -> some View {
        content
            .background(
                RoundedRectangle(cornerRadius: content.getRect().height / 2)
                    .stroke(strokeColor, lineWidth: 1)
                    .background( RoundedRectangle(cornerRadius: content.getRect().height / 2 - 2)
                        .foregroundColor(bgColor))            )
    }
}

struct DefaultButtonViewModifier: ViewModifier {
    @State var bgColor: Color
    @State var addPadding: Bool
    func body(content: Content) -> some View {
        if addPadding {
            content
                .padding()
                .font(Font.system(size: FontSize.title3))
                .foregroundColor(Color.white)
                .frame(maxWidth: .infinity)
                .background(
                    RoundedRectangle(cornerRadius: 5)
                        .foregroundColor(bgColor)
                )
        } else {
            content
                .padding(.vertical, 6)
                .padding(.horizontal)
                .font(Font.system(size: FontSize.title3))
                .foregroundColor(Color.white)
                .frame(maxWidth: .infinity)
                .background(
                    RoundedRectangle(cornerRadius: 5)
                        .foregroundColor(bgColor)
                )
        }
        
    }
}

struct titleTextViewModifier: ViewModifier {
    @State var color: Color
    @State var font:  String
    @State var size:  Double
    func body(content: Content) -> some View {
        content
            .font(.custom(font, size: size))
            .foregroundColor(color)
    }
}

struct subTitleTextViewModifier: ViewModifier {
    @State var color: Color
    @State var font:  String
    func body(content: Content) -> some View {
        content
            .font(.custom(font, size: FontSize.title3))
            .foregroundColor(color)
    }
}

struct NormalTextViewModifier: ViewModifier {
    @State var color: Color
    @State var font:  String
    func body(content: Content) -> some View {
        content
            .font(Font.system(size: FontSize.normal))
            .foregroundColor(color)
    }
}

struct smallTextViewModifier: ViewModifier {
    @State var color: Color
    @State var size: Double
    @State var font:  String
    func body(content: Content) -> some View {
        content
            .foregroundColor(color)
            .font(.custom(font, size: size))
    }
}

extension View {
    
    func withCardView(radius: CGFloat = 15) -> some View {
        modifier(cardViewModifier(radius: radius))
    }
    
    func rounded(bgColor: Color = .white, addPadding: Bool = true) -> some View {
        modifier(roundedViewModifier(bgColor: bgColor, addPadding: addPadding))
    }
    
    func roundedWithBorder(bgColor: Color = .white, strokeColor: Color = Constant.blue, addPadding: Bool = true) -> some View {
        modifier(roundedWithBorderViewModifier(bgColor: bgColor, strokeColor: strokeColor,addPadding: addPadding))
    }
    
    func roundedWithBorderWithoutPadding(bgColor: Color = .white, strokeColor: Color = Constant.blue) -> some View {
        modifier(roundedWithBorderWithoutPaddingViewModifier(bgColor: bgColor, strokeColor: strokeColor))
    }
    
    func withDefaultButtonFormatting(bgColor: Color = Constant.blue, addPadding: Bool = true) -> some View {
        modifier(DefaultButtonViewModifier(bgColor: bgColor, addPadding: addPadding))
    }
    
    func withDefaultButtonFormattingWithGradientColor(bgColor: Color = Constant.blue, addPadding: Bool = true) -> some View {
        modifier(DefaultButtonViewModifier(bgColor: bgColor, addPadding: addPadding))
    }
    
    func withTitleTextFormatting(color: Color = Constant.primaryTextColor, font: String = "EncodeSansSemiCondensed-Bold", size: Double = FontSize.title1) -> some View {
        modifier(titleTextViewModifier(color: color, font: font, size: size))
    }
    
    func withSubTitleTextFormatting(color: Color = Constant.primaryTextColor, font: String = "EncodeSansSemiCondensed-Regular") -> some View {
        modifier(subTitleTextViewModifier(color: color, font: font))
    }
    
    func withNormalTextFormatting(color: Color = Constant.primaryTextColor, font: String = "EncodeSansSemiCondensed-Regular") -> some View {
        modifier(NormalTextViewModifier(color: color, font: font))
    }
    
    func withSmallTextFormatting(color: Color = Constant.primaryTextColor, size: Double = FontSize.small, font: String = "EncodeSansSemiCondensed-Regular") -> some View {
        modifier(smallTextViewModifier(color: color, size: size, font: font))
    }
}
