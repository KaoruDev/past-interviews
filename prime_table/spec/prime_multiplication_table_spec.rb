require_relative "./spec_helper.rb"

RSpec.describe PrimeMultiplicationTable do
  describe "#generate" do
    it "returns an Array" do
      expect(PrimeMultiplicationTable.new.generate([1, 2, 3])).to be_instance_of(Array)
    end

    context "given an array of [1, 2, 3] will return an array" do
      let(:result) {
        PrimeMultiplicationTable.new.generate([1, 2, 3])
      }

      it "that has 4 rows" do
        expect(result.count).to eq(4)
      end

      it "with first row [0, 1, 2, 3]" do
        expect(result[0]).to eq([0, 1, 2, 3])
      end

      it "with second row [1, 1, 2, 3]" do
        expect(result[1]).to eq([1, 1, 2, 3])
      end

      it "with third row [2, 2, 4, 6]" do
        expect(result[2]).to eq([2, 2, 4, 6])
      end

      it "with fourth row [2, 2, 4, 6]" do
        expect(result[3]).to eq([3, 3, 6, 9])
      end
    end
  end
end
