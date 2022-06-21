import SwiftUI

struct CalcButton: View {
    var symbolName: String
    var inverted: Bool = false
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Image(systemName: symbolName)
            .frame(width: 64, height: 64, alignment: .center)
            .background(inverted ? Color.accentColor : Color.white)
            .foregroundColor(inverted ? .white : .accentColor)
            .cornerRadius(8)
            .shadow(color: .primary.opacity(0.3), radius: 8, x: 0, y: 4)
        }
        .buttonStyle(.plain)
    }
}

struct ContentView: View {
    @State var result: Int = 0
    @State var strategyName: String = "Soma"
    
    @State var xString: String = ""
    @State var yString: String = ""
    
    var rows: [GridItem] = Array(repeating: .init(.fixed(64)), count: 2)
    
    var calcContext: CalcContext = .init(strategy: SumStrategy())
    
    var body: some View {
        VStack {
            Text("Operação selecionada: \(strategyName)")
            
            Text("\(result)")
                .padding(8)
                .frame(maxWidth: .infinity, alignment: .trailing)
                .foregroundColor(.white)
                .font(.title2.weight(.bold))
                .background(Color.gray.opacity(0.5))
                .cornerRadius(8)
            
            TextField("x", text: $xString)
                .keyboardType(.numberPad)
                .textFieldStyle(.roundedBorder)
            TextField("y", text: $yString)
                .keyboardType(.numberPad)
                .textFieldStyle(.roundedBorder)
            
            LazyHGrid(rows: rows) {
                CalcButton(symbolName: "plus", action: {
                    calcContext.setStrategy(to: SumStrategy())
                    self.strategyName = "Soma"
                })
                
                CalcButton(symbolName: "minus", action: {
                    calcContext.setStrategy(to: SubtractStrategy())
                    self.strategyName = "Subtração"
                })
                
                CalcButton(symbolName: "multiply", action: {
                    calcContext.setStrategy(to: MultiplyStrategy())
                    self.strategyName = "Multiplicação"
                })
                
                CalcButton(symbolName: "divide", action: {
                    calcContext.setStrategy(to: DivideStrategy())
                    self.strategyName = "Divisão"
                })
                
                CalcButton(symbolName: "chevron.up", action: {
                    calcContext.setStrategy(to: PowerStrategy())
                    self.strategyName = "Exponenciação"
                })
                
                CalcButton(symbolName: "equal", inverted: true, action: {
                    self.result = calcContext.runAlgorithm(x: Int(xString)!, y: Int(yString)!)
                })
            }
        }
        .padding(.horizontal, 24)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
    }
}
