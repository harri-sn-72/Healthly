import SwiftUI
import HealthKit

struct ContentView: View {
    @State var percentage: CGFloat = 0
  
    var body: some View {
        VStack {
            VStack(alignment: .center) {
                VStack {
                }
                HStack {
                    VStack(alignment: .leading, spacing: 5) {
                        Text(NSLocalizedString("hi_harri!", comment: ""))
                            .font(.title)
                    
                    Text(NSLocalizedString("how_is_day", comment: ""))
                        .font(.headline)
                    }
                    .padding(.leading)
                    .padding(.top, 75)
                    Spacer()
                        
                }
                VStack(spacing: 50) {
                    Text(Date(), style: .date)
                        .font(.title)

                    ZStack {
                        Pulsation()
                        Track()
                        Label(percentage: percentage)
                        Outline(percentage: percentage)
                    }
                    Text(NSLocalizedString("steps_week", comment: ""))
                        .font(.title)
                        
                }
                .padding(.top, 50)
                .onAppear {
                    percentage = 1067
                }

                Spacer()
            }

            
            
                        
        }
        .background(Color.black.opacity(0.03).ignoresSafeArea())
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Pulsation: View {
    @State private var pulsating = false
    var colors: [Color] = [Color("Color"), Color("Color1")]
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.black.opacity(0.03))
                .frame(width: 245, height: 245)
                .scaleEffect(pulsating ? 1.3 : 1.1)
                .animation(Animation.easeInOut(duration: 1.1).repeatForever(autoreverses: true))
                .onAppear {
                    self.pulsating.toggle()
                    
                }
        }
    }
}

struct Track: View {
    var colors: [Color] = [Color("Outline2"), Color("Outline")]
    var body: some View {
        ZStack {
             Circle()
                .fill(Color.black.opacity(0.03))
                .frame(width: 250, height: 250)
                .overlay(
                Circle()
                    .stroke(style: StrokeStyle(lineWidth: 20))
                    .fill(AngularGradient(gradient: .init(colors: colors), center: .center))
                )
        }
    }
}

struct Outline: View {
    var percentage: CGFloat = 50
    var colors: [Color] = [Color("Outline2"), Color("Outline")]
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.black.opacity(0.03))
                .frame(width: 250, height: 250)
                .overlay(
                Circle()
                    .trim(from: 0, to: percentage * 0.01)
                    .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
                    .fill(AngularGradient(gradient: .init(colors: colors), center: .center, startAngle: .zero, endAngle: .init(degrees: 360)))
                )
                .animation(.spring(response: 2.0, dampingFraction: 1.0, blendDuration: 1.0))
        }
    }
}

struct Label: View {
    var percentage: CGFloat = 0
 
    var body: some View {
        ZStack {
            Text(String(format: "%.0f", percentage))
                .font(.system(size: 65))
                .fontWeight(.heavy)
            
        }
    }
}


