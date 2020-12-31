import SwiftUI

struct HeaderScrollViewTitle: View {
    let title: String
    let height: CGFloat
    let largeTitle: Double

    var body: some View {
        let largeTitleOpacity = (max(largeTitle, 0.5) - 0.5) * 2
        let tinyTitleOpacity = 1 - min(largeTitle, 0.5) * 2
        return ZStack {
            HStack {
                Text(title)
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .fontWeight(.black)
                    .padding(.horizontal, 16)
                    .padding(.bottom, 32)
                    .fixedSize(horizontal: false, vertical: true)
                
                Spacer()
            }
            .padding(.bottom, 0)
            .opacity(sqrt(largeTitleOpacity))

            ZStack {
                HStack {
                    BackButton(color: .primary)
                    Spacer()
                }
                HStack {
                    Text(title)
                        .font(.system(size: 18))
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                }
            }
            .padding(.bottom, (height - 18) / 2)
            .opacity(sqrt(tinyTitleOpacity))
        }.frame(height: height)
    }
}
