defmodule Cards do
  @moduledoc """
  	Provides methods for craeting and handling a deck of cards 
  """

  @doc """
  	ddoefds jflkdjfa
  """
  def create_deck do
    values = ["Ace", "Two", "Three","Four", "Five"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]
  	
  	# list comprehension
  	for suit <- suits, value <- values do  
	  "#{value} of #{suit}"
  	end
  end

  def shuffle(deck) do
  	Enum.shuffle(deck)
  end

  @doc """
    Determines whethere a deck contains a given card

   ## Examples
   		iex> deck = Cards.create_deck
   		iex> Cards.contains?(deck, "Two of Spades")
   		true
  """
  def contains?(deck, card) do
  	Enum.member?(deck, card)
  end

  def deal(deck, hand_size) do
  	Enum.split(deck, hand_size)
  end

  def save(deck, filename) do
  	binary = :erlang.term_to_binary(deck)
  	File.write(filename, binary)
  end

  def load(filename) do
  	case File.read(filename)  do
	  {:ok, binary} -> :erlang.binary_to_term(binary)
  	  {:error, _reason} -> "That file does not exist."  
  	end
  end

  @doc """
    Divides a deck into a hand and the remainder of the deck.
    The `hand_size` argument indicates how man cards should
    be in the hand.

  ## Examples
      iex> deck = Cards.create_deck
      iex> {hand, deck} = Cards.deal(deck, 1)
      iex> hand
      ["Ace of Spades"]
  """
  def deal_hand(hand_size) do
  	deck = Cards.create_deck
  	deck = Cards.shuffle(deck)
  	hand = Cards.deal(deck, hand_size)

  	# very consistent first arguments
  	Cards.create_deck
  	|> Cards.shuffle
  	|> Cards.deal(hand_size)
  end
end
