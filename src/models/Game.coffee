class window.Game extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @on('findWinner', () => 
      console.log('listen triggered')
      if @get('playerHand').scores()[0] > @get('dealerHand').scores()[0] then console.log('YAY!'))

    
    
