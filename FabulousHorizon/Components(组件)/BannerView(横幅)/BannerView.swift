//
//  BannerView.swift
//  FabulousHorizon
//
//  Created by cooltron on 2022/8/10.
//

import SwiftUI

struct imageModel: Identifiable {
    var id = UUID()
    var image: String
    var imageName: String
}

#if DEBUG
let imageModels = [
    imageModel(image: "image01", imageName: "图片01"),
    imageModel(image: "image02", imageName: "图片02"),
    imageModel(image: "image03", imageName: "图片03"),
    imageModel(image: "image04", imageName: "图片04"),
    imageModel(image: "image05", imageName: "图片05"),
    imageModel(image: "image06", imageName: "图片06"),
    imageModel(image: "image07", imageName: "图片07"),
    imageModel(image: "image08", imageName: "图片08"),
    imageModel(image: "image09", imageName: "图片09")
]
#endif

struct BannerView: View {
    
    @State var currentIndex = 5
    
    @GestureState var dragOffset: CGFloat = 0
    
    var body: some View {
        GeometryReader { outerView in
            
            HStack(spacing:0) {
                ForEach(imageModels.indices, id: \.self) { index in
                    GeometryReader { innerView in
                        CardView(image: imageModels[index].image, imageName: imageModels[index].imageName)
                    }
                    .padding(.horizontal)
                    .frame(width: outerView.size.width, height: outerView.size.height)
                }
            }
            .frame(width: outerView.size.width, height: outerView.size.height, alignment: .leading)
            .offset(x: -CGFloat(self.currentIndex) * outerView.size.width)
            .offset(x: self.dragOffset)
            
            .gesture(
                DragGesture()
                    .updating(self.$dragOffset, body: { value, state, transaction in
                        state = value.translation.width

                    })
                    .onEnded({ value in
                        let threshold = outerView.size.width * 0.65
                        var newIndex = Int(-value.translation.width / threshold) + self.currentIndex
                        newIndex = min(max(newIndex, 0), imageModels.count - 1)
                        self.currentIndex = newIndex
                    })
            )
        }
    }
}

struct BannerView_Previews: PreviewProvider {
    static var previews: some View {
        BannerView()
    }
}


struct CardView: View {
    
    let image: String
    
    let imageName: String
    
    var body: some View {
        
        ZStack {
            
            GeometryReader { geometry in
                
                Image(image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .cornerRadius(15)
                
                    .overlay(
                        Text(imageName)
                            .font(.system(.headline, design: .rounded))
                            .fontWeight(.heavy)
                            .padding(10)
                            .background(Color.white)
                            .padding([.bottom, .leading])
                            .opacity(1.0)
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .bottomLeading)
                    )
            }
        }
    }
}
