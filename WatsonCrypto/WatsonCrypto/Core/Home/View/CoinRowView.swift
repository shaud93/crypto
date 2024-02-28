//
//  CoinRowView.swift
//  WatsonCrypto
//
//  Created by D'Ante Watson on 2/19/24.
//

import SwiftUI

struct CoinRowView: View {
    
    let coin: CoinModel
    let showHoldingColumn: Bool
    
    var body: some View {
        HStack(spacing: 0) {
            
            leftColumn
            
            Spacer()
            
            if showHoldingColumn {
                centerColumn
            }
               
            rightColumn
        }
        .font(.subheadline)
    }
}

#Preview {
   
    CoinRowView(coin: DeveloperPreview.shared.coin, showHoldingColumn: true)
}

extension CoinRowView {
    
    private var leftColumn: some View {
        HStack(spacing: 0){
            Text("\(coin.marketCapRank)")
                .foregroundStyle(Color.theme.secondaryTextColor)
                .frame(minWidth: 30)
            CoinImageView(coin: coin)
                .frame(width: 30, height: 30)
            Text(coin.symbol.uppercased())
                .font(.headline)
                .padding(.leading, 6)
                .foregroundStyle(Color.theme.accentColor)
        }
    }
    
    private var centerColumn: some View{
        VStack(alignment: .trailing) {
            Text(coin.currentHoldingsValue.asCurrencyWith2Decimals())
                .bold()
            Text((coin.currentHoldings ?? 0.0).asNumberString())
        }
        .foregroundStyle(Color.theme.accentColor)
    }
    
    private var rightColumn: some View{
        VStack(alignment: .trailing, spacing: 6){
            Text(coin.currentPrice.asCurrencyWith6Decimals())
                .bold()
                .foregroundStyle(Color.theme.accentColor)
            Text(coin.priceChangePercentage24H.asPercentageString())
                .foregroundStyle(
                    coin.priceChangePercentage24H >= 0 ?
                    Color.theme.greenColor :
                        Color.theme.redColor
                )
        }
        .frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)    }
}
