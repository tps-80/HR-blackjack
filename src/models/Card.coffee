class window.Card extends Backbone.Model
  #params = rank and suit; instantiated from Deck collection
  initialize: (params) ->
    @set
      revealed: true
      #if the rank is less than 10, set it to that
      #if rank is greater than 10, then the value is 10
      value: if !params.rank or 10 < params.rank then 10 else params.rank
      #gets number from instantiation that will correspond to an index
      suitName: ['Spades', 'Diamonds', 'Clubs', 'Hearts'][params.suit]
      rankName: switch params.rank
        when 0 then 'King'
        when 1 then 'Ace'
        when 11 then 'Jack'
        when 12 then 'Queen'
        else params.rank

  flip: ->
    @set 'revealed', !@get 'revealed'
    @

  reveal: -> 
    if @get('revealed') is false then @flip()