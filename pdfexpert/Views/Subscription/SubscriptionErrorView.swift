//
//  SubscriptionErrorView.swift
//  PdfExpert
//
//  Created by Pcnaid Inc on 03/04/23.
//

import SwiftUI

struct SubscriptionErrorView: View {
    
    var onButtonPressed: () -> ()
    
    var body: some View {
        VStack(spacing: 16) {
            Spacer()
            Image("subscription_error")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 80)
            Text("Oh Know!")
                .font(forCategory: .largeTitle)
                .foregroundColor(ColorPalette.primaryText)
                .frame(maxWidth: .infinity, alignment: .center)
            Text("Something went wrong,\n Please try again.")
                .font(forCategory: .body1)
                .foregroundColor(ColorPalette.primaryText)
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity, alignment: .center)
            Spacer()
            self.getDefaultButton(text: "Retry",
                                  onButtonPressed: self.onButtonPressed)
        }
        .padding([.leading, .trailing], 16)
        .padding([.top, .bottom], 64)
    }
}

struct SubscriptionErrorView_Previews: PreviewProvider {
    static var previews: some View {
        SubscriptionErrorView(onButtonPressed: {})
            .background(ColorPalette.primaryBG)
    }
}
