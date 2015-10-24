class window.Game extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    
    @get('dealerHand').on('findWinner', => 
      console.log('listen triggered')
      if @get('playerHand').scores()[0] > @get('dealerHand').scores()[0] 
        console.log('YAY!')
      else if @get('playerHand').scores()[0] is @get('dealerHand').scores()[0]
        console.log('You\'ve Tied!')
      else  
        console.log('Dealer wins!'))
    
    @get('deck').on('endGame', =>
      alert "wanna play again?")

    @get('playerHand').on('bust', => 
      @get('dealerHand').at(0).reveal())
    
    
