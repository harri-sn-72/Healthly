import SwiftUI

struct HomeView: View {
    @State var selected = 0
    var body: some View {
        ZStack(alignment: .bottom){
            VStack{
                if self.selected == 0{
                    ContentView()
                    
                } else if self.selected == 1{ GeometryReader{_ in
                    Health()
                }
                
                }
                else if self.selected == 2 {
                    GeometryReader{_ in
                        Hydration()
                        
                    }
                    
                }
                else if self.selected == 3 {
                    GeometryReader{_ in
                        Food()
                        
                    }
                    
                    
                }
                else if self.selected == 4 {
                    GeometryReader{_ in
                        Settings()
                        
                    }
                    
                    
                }
            }
            .background(Color.black.opacity(0.03).edgesIgnoringSafeArea(.all))
            FloatingTabbar(selected: self.$selected)
            
        }
        .navigationBarBackButtonHidden(true)

        
    }
    
}

struct FloatingTabbar : View {
    @Binding var selected : Int
    @State var expand = true
    var body : some View{
        HStack{
            Spacer(minLength: 0)
            HStack{
                if !self.expand{
                    Button(action: {
                        self.expand.toggle()
                        
                    }) { Image(systemName: "arrow.left")
                        .foregroundColor(Color("Outline2")).padding()
                        
                    }
                    
                }
                else{
                    Button(action: {
                            self.selected = 0
                        
                    }) { Image(systemName: "house")
                        .foregroundColor(self.selected == 0 ? Color("Outline2") : .gray)
                        .padding(.horizontal)
                        
                    }
                    Spacer(minLength: 15)
                    Button(action: {
                            self.selected = 1
                        
                    }) {
                        Image(systemName: "heart.circle")
                            .foregroundColor(self.selected == 1 ? Color("Outline2"): .gray)
                            .padding(.horizontal)
                        
                    }
                    Spacer(minLength: 15)
                    Button(action: {
                            self.selected = 2 }) {
                        Image(systemName: "drop.triangle")
                            .foregroundColor(self.selected == 2 ? Color("Outline2") : .gray)
                            .padding(.horizontal)
                        
                    }
                    Spacer(minLength: 15)
                    Button(action: {
                            self.selected = 3 }) {
                        Image(systemName: "leaf")
                            .foregroundColor(self.selected == 3 ? Color("Outline2") : .gray)
                            .padding(.horizontal)
                        
                    }
                    Spacer(minLength: 15)
                    Button(action: {
                            self.selected = 4 }) {
                        Image(systemName: "gear")
                            .foregroundColor(self.selected == 3 ? Color("Outline2") : .gray)
                            .padding(.horizontal)
                        
                    }

                }
                
            }
            .padding(.vertical,self.expand ? 20 : 8)
            .padding(.horizontal,self.expand ? 35 : 8)
            .background(Color.white) .clipShape(Capsule())
            .padding(22)
            .onTapGesture {
                self.expand.toggle()
                
            }
            .animation(.interactiveSpring(response: 0.6, dampingFraction: 0.6, blendDuration: 0.6)) } } }
