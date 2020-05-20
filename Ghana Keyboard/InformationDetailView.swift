import SwiftUI


struct InformationDetailView: View {
    let title: String
    let subTitle: String
    let imageName: String

    var body: some View {
        HStack(alignment: .center) {
            Image(systemName: imageName)
            .font(.largeTitle)
            .foregroundColor(.mainColor)
            .padding()
            .accessibility(hidden: true)

            VStack(alignment: .leading) {
                Text(title)
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundColor(.primary)
                .accessibility(addTraits: .isHeader)

                Text(subTitle)
                .font(.headline)
                .foregroundColor(.primary)
                .fixedSize(horizontal: false, vertical: true)
            }
        }
        .padding(.top, 35)
        .padding(.bottom, 7)
    }
}


struct InformationContainerView: View {
    @Environment(\.colorScheme) private var colorScheme
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                InformationDetailView(title: "Multiple Dialects", subTitle: "Ghana Keyboard supports Akan, Ewe, Ga, and Dagbani letter. More to come soon!", imageName: "person.2.square.stack")

                InformationDetailView(title: "Familiar feel", subTitle: "Feels the same as your regular keyboard. We've just added different characters, so you don't have to change your habits.", imageName: "hand.thumbsup.fill")

                InformationDetailView(title: "Convenient", subTitle: "Created for convenience. The first free keyboard supporting multiple Ghanaian dialects.", imageName: "pencil.and.outline")
            }
                // Set the background to a darker white if the system is in light mode, or a lighter black if system is in dark mode
            .background(self.colorScheme == .dark ? Color.slightlyLessDark : Color.white)
            .cornerRadius(25)
            .padding(.horizontal)
            .padding(.top, 20)
        }
        .shadow(color: self.colorScheme == .dark ? Color.darkEnd : Color.black.opacity(0.5), radius: 10, x: -5, y: -5)
        .shadow(color: self.colorScheme == .dark ? Color.darkEnd : Color.white.opacity(0.5), radius: 10, x: -5, y: -5)
    }
}


struct TitleView: View {
    @Environment(\.colorScheme) private var colorScheme
    
    var body: some View {
        ZStack {
            VStack {
                Image(systemName: "keyboard")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, alignment: .center)
                .accessibility(hidden: true)

                Text("Welcome to")
                .customTitleText()

                Text("Ghana Keyboard")
                .customTitleText()
                .foregroundColor(.mainColor)
            }
            .padding()
            // Set the background to a darker white if the system is in light mode, or a lighter black if system is in dark mode
            .background(self.colorScheme == .dark ? Color.slightlyLessDark : Color.white)
            .cornerRadius(25)
        }
        .shadow(color: self.colorScheme == .dark ? Color.darkEnd: Color.black.opacity(0.5), radius: 10, x: -5, y: -5)
        .shadow(color: self.colorScheme == .dark ? Color.darkEnd : Color.white.opacity(0.5), radius: 10, x: -5, y: -5)
    }
}


struct IntroductionView: View {
    @Environment(\.colorScheme) private var colorScheme
    @Environment(\.viewController) private var viewControllerHolder: UIViewController?

    var body: some View {
        GeometryReader { (proxy : GeometryProxy) in
            ScrollView {
                VStack(alignment: .center) {

                    Spacer()

                    TitleView()
                    
                    Spacer()

                    InformationContainerView()

                    Spacer()

                    Button(action: {
                        self.viewControllerHolder?.present(style: .fullScreen) {
                            ContentView()
                        }
                    }) {
                        Text("Continue")
                        .customButton()
                    }
                    .padding(.horizontal)
                    .padding(.top, 50)
                }
                .background(self.colorScheme == .dark ?  Color(UIColor.systemBackground): Color.white)
                .frame(height: proxy.size.height)
            }
        }
    }
}


struct ButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .font(.headline)
            .padding()
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
            .background(RoundedRectangle(cornerRadius: 15, style: .continuous)
                .fill(Color.mainColor))
            .padding(.bottom)
    }
}


extension View {
    func customButton() -> ModifiedContent<Self, ButtonModifier> {
        return modifier(ButtonModifier())
    }
}


extension Text {
    func customTitleText() -> Text {
        self
            .fontWeight(.black)
            .font(.system(size: 36))
    }
}


extension Color {
    static let offWhite = Color(red: 255/255, green: 255/255, blue: 235/255)
    static let slightlyLessDark = Color(red: 10 / 255, green: 10 / 255, blue: 15 / 255)
    static let darkEnd = Color(red: 30 / 255, green: 30 / 255, blue: 35 / 255)
    static let mainColor = Color(UIColor.systemBlue)
    static let brighterDark = Color(red: 42/255, green: 44/255, blue: 44/255)
    static let darkerBright = Color(red: 230/255, green: 230/255, blue: 230/255)
    static let darkBackgroundGradient = LinearGradient(gradient:  Gradient(colors: [Color.slightlyLessDark, Color.darkEnd]), startPoint: .top, endPoint: .bottom)
    static let lightBackgroundGradient = LinearGradient(gradient:  Gradient(colors: [Color.offWhite, Color.offWhite]), startPoint: .top, endPoint: .bottom)
    
    static let secondaryColor = Color(UIColor.systemIndigo)
}

struct IntroductionView_Previews: PreviewProvider {
    static var previews: some View {
        IntroductionView()
    }
}
