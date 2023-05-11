# frozen_string_literal: true

require_relative 'cpu'
require_relative 'display'
require_relative 'game_logic'
require_relative 'game'
require_relative 'player'
require_relative '../text/text_instructions'
require_relative '../text/text_output'

Game.new.start_game
