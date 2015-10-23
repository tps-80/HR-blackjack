class window.Deck extends Backbone.Collection
  # one deck collection, instantiated from app.coffee
  model: Card

  initialize: ->
    #instantiating a collection of card models and passing in its rank and suit as params
    @add _([0...52]).shuffle().map (card) ->
      new Card
        rank: card % 13
        suit: Math.floor(card / 13)

  dealPlayer: -> new Hand [@pop(), @pop()], @

  dealDealer: -> new Hand [@pop().flip(), @pop()], @, true

