//
//  HomeView.swift
//  WatsonCrypto
//
//  Created by D'Ante Watson on 2/18/24.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var vm: HomeViewModel
    @State private var showPortfolio:Bool = false
    
    var body: some View {
        ZStack{
            //background color
            Color.theme.backgroundColor
                .ignoresSafeArea()
            
            //content layer
            VStack{
                homeHeader
                
                columnTitle
                
                if (!showPortfolio){
                    CoinList
                       .transition(.move(edge: .leading))
                }
                else {
                    PortfolioList
                        .transition(.move(edge: .trailing))
                }
                Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
            }
        }
    }
}

#Preview {
    HomeView()
        .environmentObject(DeveloperPreview.shared.vm)
}


extension HomeView {
    
    private var homeHeader: some View {
            HStack{
                CircleButtonView(iconName: showPortfolio ? "plus" : "info")
                    .animation(.none, value: showPortfolio)
                    .background(
                        CircleButtonAnimationView(animate: $showPortfolio)
                    )
                Spacer()
                Text(showPortfolio ? "Portfollio" : "Live Prices")
                    .font(.headline)
                    .fontWeight(.heavy)
                    .foregroundStyle(Color.theme.accentColor)
                    .animation(.none, value: showPortfolio)
                Spacer()
                CircleButtonView(iconName: "chevron.right")
                    .rotationEffect(Angle(degrees: showPortfolio ? 180 : 0))
                    .onTapGesture {
                        withAnimation(.spring()) {
                            showPortfolio.toggle()
                        }
                    }
            }
            .padding(.horizontal)
        }
    
    private var CoinList: some View {
        
        List {
            ForEach(vm.coinList) {
                coin in CoinRowView(coin: coin, showHoldingColumn: false)
            }
        }
        .listStyle(.plain)
        
    }
    
    private var PortfolioList: some View {
        
        List {
            ForEach(vm.portfoliosCoins) {
                coin in CoinRowView(coin: coin, showHoldingColumn: true)
            }
        }
        .listStyle(.plain)
        
    }
    
    private var columnTitle: some View {
        HStack{
            Text("Coin")
                Spacer()
            
            if (showPortfolio){
                Text("Holdings")
            }
            
            Text("Price")
                .frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)
        }
        .font(.caption)
        .padding(.horizontal)
        .foregroundStyle(Color.theme.secondaryTextColor)
    }
}
