//
//  CoinImageView.swift
//  WatsonCrypto
//
//  Created by D'Ante Watson on 2/21/24.
//

import SwiftUI

struct CoinImageView: View {
    
    @StateObject var vm: CoinImageViewModel
    
    init(coin: CoinModel) {
        _vm = StateObject(wrappedValue: CoinImageViewModel(coin: coin))
    }
    
    var body: some View {
        ZStack {
            if let image = vm.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
            }else if vm.isLoading {
                ProgressView()
            }else {
                Image(systemName: "questionmark")
                    .foregroundStyle(Color.theme.accentColor)
            }
        }
    }
}

#Preview {
    CoinImageView(coin: DeveloperPreview.shared.coin)
}
