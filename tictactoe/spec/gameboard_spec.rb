require 'spec_helper'

module Tictactoe
    describe GameBoard do
    let(:gameboard) {GameBoard.new}

    def fill_board positions
      (0..positions.length-1).each do |i|
        gameboard.position_to_mark(positions[i].to_i, 'X')
      end
    end

    describe "#mark a position" do
      context "when the gameboard is empty" do
        it "marks position: 1" do
          gameboard.position_to_mark(1, 'X')
          expect(gameboard.cells.join(" ")).to eq("X 0 0 0 0 0 0 0 0")
        end
        it "marks position: 2" do
          gameboard.position_to_mark(2, 'X')
          expect(gameboard.cells.join(" ")).to eq("0 X 0 0 0 0 0 0 0")
        end
      end
    end

    describe "#gameboard full?" do
      context "when the gameboard is full" do
        it "verifies if the gameboard is full" do
          fill_board('123456789')
          expect(gameboard.gameboard_full?).to be_true
        end
      end
      context "when the gameboard is not full" do
        it "verifies if the gameboard is full" do
          fill_board('1')
          expect(gameboard.gameboard_full?).to be_false
        end
      end
    end

    describe "#available?" do
      it "verifies if the position is available" do
        fill_board('12346789')
        expect(gameboard.available?(5)).to be_true
      end
    end

  end
end
