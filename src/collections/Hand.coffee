class window.Hand extends Backbone.Collection
  # two hand collections, instantiated in deck collection
  model: Card
  # params are coming from instantiations
  initialize: (array, @deck, @isDealer) ->

  hit: ->
    @add(@deck.pop())
    #underscore method that returns the last element
    @last()


  hasAce: -> @reduce (memo, card) ->
    memo or card.get('value') is 1
  , 0

  minScore: -> @reduce (score, card) ->
    score + if card.get 'revealed' then card.get 'value' else 0
  , 0

  scores: ->
    # function that returns an array
    # The scores are an array of potential scores.
    # Usually, that array contains one element. That is the only score.
    # when there is an ace, it offers you two scores - the original score, and score + 10.
    [@minScore(), @minScore() + 10 * @hasAce()]

    #if this.scores[0] > 21 invoke bust()
    #if score with ace === 21 === automatic stand
    #if score with ace > 21, default back to min score and check if hand is still valid

  #gameview is expecting
  #stand method
    # evaluate both the player and dealer's hand and alert winner

  #bust?
  #on each hit, check if its a bust
  stand: -> @map (card) -> 
    if card.get('revealed') is false then card.flip()
  #iterate over collection and reveal cards
    