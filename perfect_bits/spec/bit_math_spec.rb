require_relative "../lib/bit_math"

RSpec.describe BitMath do
  describe "#calculate" do
    context "square 1" do
      it "will return 2 with range of 128, 256" do
        bit_math = BitMath.new(128, 256, 1)

        bit_math.calculate
        expect(bit_math.count).to eq(2)
      end

      it "will return 2 with range of 128, 1024" do
        bit_math = BitMath.new(128, 1024, 1)

        bit_math.calculate
        expect(bit_math.count).to eq(4)
      end

      it "will return 2 with range of 1, 2" do
        bit_math = BitMath.new(1, 2, 1)

        bit_math.calculate
        expect(bit_math.count).to eq(2)
      end
    end

    context "square 4" do
      it "will return 35 with range of 128, 256" do
        bit_math = BitMath.new(128, 256, 4)

        bit_math.calculate
        expect(bit_math.count).to eq(35)
      end

      it "will return 35 with range of 121, 256" do
        bit_math = BitMath.new(121, 256, 4)

        bit_math.calculate
        expect(bit_math.count).to eq(35)
      end

      it "will return 175 with range of 121, 1024" do
        bit_math = BitMath.new(121, 1024, 4)

        bit_math.calculate
        expect(bit_math.count).to eq(175)
      end
    end

    context "square 9" do
      it "will return 4488 with range of 32768, 56192" do
        bit_math = BitMath.new(32768, 56192, 9)

        bit_math.calculate
        expect(bit_math.count).to eq(4488)
      end
    end
  end
end

