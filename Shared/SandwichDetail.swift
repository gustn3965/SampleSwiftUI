//
//  SandwichDetail.swift
//  SampleSwiftUI
//
//  Created by hyunsu on 2021/06/02.
//

import SwiftUI

struct SandwichDetail: View {
    var sandwich: Sandwich
    @State private var zoomed = false
    var body: some View {
        VStack {
            Spacer()
            Image(sandwich.image)
                .resizable()
                .aspectRatio(contentMode: zoomed ? .fill : .fit)                .onTapGesture {
                    withAnimation {
                        zoomed.toggle()
                    }
                }
            Spacer()
            if sandwich.isSpicy, !zoomed {
                HStack {
                    Spacer()
                    Label("Spicy", systemImage: "flame.fill")
                        .padding(.all)
                        .foregroundColor(.yellow)
                        .font(.subheadline.smallCaps())
                    Spacer()
                }
                .background(Color.red)
                .transition(.move(edge: .bottom))
            }
        }
        .ignoresSafeArea( edges: /*@START_MENU_TOKEN@*/.bottom/*@END_MENU_TOKEN@*/)
        .navigationTitle(sandwich.name)
    }
}

struct SandwichDetail_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView {
                SandwichDetail(sandwich: testData[0])
            }
            NavigationView {
                SandwichDetail(sandwich: testData[1])
            }
            .preferredColorScheme(.dark)
        }
        
    }
}
