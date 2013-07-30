system('clear')
require 'spec_helper'

module Tictactoe
  describe Game do
    let(:output) {double('output').as_null_object}
    let(:game) {Game.new(output)}

    def puts? message
        output.should_receive(:puts).with(message)
    end

    def fill_board positions
      (0..positions.length).each do |i|
        game.position(positions[i].to_i)
        game.change_player
      end
    end

    describe "#start" do
      it "sends a welcome message" do
        puts? 'Welcome to Tic-Tac-Toe!'
        game.welcome_message
      end

      it "sends the gameboard" do
        output.should_receive(:puts).with("0 0 0 0 0 0 0 0 0")
        game.welcome_message
      end
      it "asks for a position" do
        output.should_receive(:puts).with("Choose a position: ")
        game.game_intro
      end
    end

    describe "#mark a position" do
      context "when the gameboard is empty" do
        it "marks position: 1" do
          output.should_receive(:puts).with("X 0 0 0 0 0 0 0 0")
          fill_board "1"
        end

        it "marks position: 5" do
          output.should_receive(:puts).with("0 0 0 0 X 0 0 0 0")
          fill_board "5"
        end
      end
      context "when there is 1 position marked" do
        context "marked position: 1" do
          it "marks position: 3" do
            output.should_receive(:puts).with("X 0 Y 0 0 0 0 0 0")
            fill_board "13"
          end
          it "marks position: 6" do
            output.should_receive(:puts).with("X 0 0 0 0 Y 0 0 0")
            fill_board "16"
          end
        end
      end
      context "when there are 2 positions marked" do
        context "marked positions: 1,5" do
          it "marks position 3" do
            output.should_receive(:puts).with("X 0 X 0 Y 0 0 0 0")
            fill_board "153"
          end
        end
      end
    end
    describe "#verify victory" do
      context "horizontal victory" do
        it "sends a congrats message to Player X" do
          output.should_receive(:puts).with("Congratulations Player X you are the winner!!")
          fill_board "14253"
          game.verify_victory
        end
        it "sends a congrats message to Player Y" do
          output.should_receive(:puts).with("Congratulations Player Y you are the winner!!")
          fill_board "142586"
          game.verify_victory
        end
      end
    end
  end
end
