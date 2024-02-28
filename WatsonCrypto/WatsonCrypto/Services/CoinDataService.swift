//
//  CoinDataService.swift
//  WatsonCrypto
//
//  Created by D'Ante Watson on 2/21/24.
//

import Foundation
import Combine

class CoinDataService {
    @Published var coinList: [CoinModel] = []
    var coinSubscription: AnyCancellable?
    
    init() {
        getCoins()
    }
    
    private func getCoins() {
        guard let url = URL(string: ApiEndPoints().coinUrlString) else {return}
        
        coinSubscription = NetWorkingManager.download(url: url)
            .decode(type: [CoinModel].self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetWorkingManager.handleCompletion, receiveValue: { [weak self] returnedCoins in
                self?.coinList = returnedCoins
                self?.coinSubscription?.cancel()
            })
    }
}
