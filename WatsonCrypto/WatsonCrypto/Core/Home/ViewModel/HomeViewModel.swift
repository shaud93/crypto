//
//  HomeViewModel.swift
//  WatsonCrypto
//
//  Created by D'Ante Watson on 2/21/24.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    
    @Published var coinList:[CoinModel] = []
    @Published var portfoliosCoins:[CoinModel] = []
    
    private let dataservice = CoinDataService()
    private var cancelable = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
        }
    
    func addSubscribers() {
        dataservice.$coinList
            .sink { [weak self] returnedCoins in
                self?.coinList = returnedCoins
            }
            .store(in: &cancelable)
    }
}

