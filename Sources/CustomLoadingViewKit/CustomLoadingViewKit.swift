import SwiftUI

#if os(iOS)
public struct CustomLoadingView: View {
    
    @State private var animate: Bool = false
    let secondaryAccentColor = Color("SecondaryAccentColor")
    
    public init() {}
    
    public var body: some View {
        VStack {
            Text("Loading !!!")
                .foregroundColor(.white)
                .font(.headline)
                .bold()
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(animate ? secondaryAccentColor : Color.accentColor)
                .cornerRadius(10)
                .padding(.horizontal, animate ? 30 : 50)
                .shadow(
                    color: animate ? secondaryAccentColor.opacity(0.7) : Color.accentColor.opacity(0.7),
                    radius: animate ? 30 : 10,
                    x: 0,
                    y: animate ? 50 : 30)
                .scaleEffect(animate ? 1.1 : 1.0)
                .offset(y: animate ? -7 : 0)
        }
        .padding()
        .onAppear(perform: addAnimation)
    }
    
    private func addAnimation() {
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(
                Animation.easeInOut(duration: 2.0).repeatForever()
            ) {
                animate.toggle()
            }
        }
    }
}
#endif
