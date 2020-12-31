import SwiftUI

struct HeaderScrollViewTitle: View {
    let title: String
    let height: CGFloat
    let largeTitle: Double

    var body: some View {
        let largeTitleOpacity = (max(largeTitle, 0.5) - 0.5) * 2
        let tinyTitleOpacity = 1 - min(largeTitle, 0.5) * 2
        return ZStack {
            Text(title)
            .font(Font(UIFont.systemFont(ofSize: 36, weight: .black)))
            .foregroundColor(.white)
            .padding(.horizontal, 16)
            .padding(.bottom, 16)
            .lineLimit(3)
            .frame(alignment: .leading)
            .multilineTextAlignment(.leading)
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
