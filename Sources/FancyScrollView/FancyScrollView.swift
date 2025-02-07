import SwiftUI

public typealias BoolCallback = (Bool) -> Void

public struct FancyScrollView: View {
    let title: String
    let headerHeight: CGFloat
    let scrollUpHeaderBehavior: ScrollUpHeaderBehavior
    let scrollDownHeaderBehavior: ScrollDownHeaderBehavior
    let headerStateCallback: BoolCallback?
    let header: AnyView?
    let content: AnyView

    public var body: some View {
        if let header = header {
            return AnyView(
                HeaderScrollView(title: title,
                                 headerHeight: headerHeight,
                                 scrollUpBehavior: scrollUpHeaderBehavior,
                                 scrollDownBehavior: scrollDownHeaderBehavior,
                                 headerStateCallback: headerStateCallback,
                                 header: header,
                                 content: content)
            )
        } else {
            return AnyView(
                AppleMusicStyleScrollView {
                    VStack {
                        title != "" ? HStack {
                            Text(title)
                                .font(.largeTitle)
                                .foregroundColor(.white)
                                .fontWeight(.black)
                                .padding(.horizontal, 16)

                            Spacer()
                        } : nil

                        title != "" ? Spacer() : nil

                        content
                    }
                }
            )
        }
    }
}

extension FancyScrollView {

    public init<A: View, B: View>(title: String = "",
                                  headerHeight: CGFloat = 300,
                                  scrollUpHeaderBehavior: ScrollUpHeaderBehavior = .parallax,
                                  scrollDownHeaderBehavior: ScrollDownHeaderBehavior = .offset,
                                  headerStateCallback: BoolCallback? = nil,
                                  header: () -> A?,
                                  content: () -> B) {

        self.init(title: title,
                  headerHeight: headerHeight,
                  scrollUpHeaderBehavior: scrollUpHeaderBehavior,
                  scrollDownHeaderBehavior: scrollDownHeaderBehavior,
                  headerStateCallback: headerStateCallback,
                  header: AnyView(header()),
                  content: AnyView(content()))
    }

    public init<A: View>(title: String = "",
                         headerHeight: CGFloat = 300,
                         scrollUpHeaderBehavior: ScrollUpHeaderBehavior = .parallax,
                         scrollDownHeaderBehavior: ScrollDownHeaderBehavior = .offset,
                         content: () -> A) {

           self.init(title: title,
                     headerHeight: headerHeight,
                     scrollUpHeaderBehavior: scrollUpHeaderBehavior,
                     scrollDownHeaderBehavior: scrollDownHeaderBehavior,
                     headerStateCallback: nil,
                     header: nil,
                     content: AnyView(content()))
       }

}
