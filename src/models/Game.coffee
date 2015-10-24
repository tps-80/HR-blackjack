class window.Game extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    
    @get('dealerHand').on('findWinner', => 
      if @get('playerHand').scores()[1] > @get('dealerHand').scores()[1] 
        alert 'YAY! Congratulations You Won!!!'
      else if @get('playerHand').scores()[1] is @get('dealerHand').scores()[1]
        alert 'You\'ve Tied!'
      else  
        alert 'Sorry, Dealer wins!')
    
    @get('dealerHand').on('endGame', =>
      @set 'playerHand', deck.dealPlayer()
      @set 'dealerHand', deck.dealDealer()
      )

    ###if we added more players, instead of this immediate reveal, 
    we should have dealer reveal and keep hitting for the other players
    ###
    @get('playerHand').on('bust', => 
      @get('dealerHand').at(0).reveal())
    
    
