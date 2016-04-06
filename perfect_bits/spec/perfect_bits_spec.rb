require "net/http"
require "uri"
require_relative "../lib/perfect_bits"

BINDI_VERIFY_URL = "https://perfect-bits.binti.com/"

RSpec.describe PerfectBits do

  describe ".count_range" do
    context "range is < base 8" do
      it "will return 2 given 1, 3" do
        expect(PerfectBits.count_range(1, 3)).to eq(2)
      end
    end

    context "range is base 8" do
      it "returns 2 given 4, 12" do
        expect(PerfectBits.count_range(4, 12)).to eq(2)
      end
    end

    context "with 0, 4" do
      it "returns 3" do
        expect(PerfectBits.count_range(0, 4)).to eq(3)
      end
    end

    context "with 110, 128" do
      it "returns 5" do
        #uri = URI("#{BINDI_VERIFY_URL}?a=#{110}&b=#{128}")
        #answer = Net::HTTP.get(uri).to_i
        expect(PerfectBits.count_range(110, 128)).to eq(5)
      end
    end

    context "with 165, 200" do
      it "returns 12" do
        uri = URI("#{BINDI_VERIFY_URL}?a=#{165}&b=#{200}")
        answer = Net::HTTP.get(uri).to_i
        expect(PerfectBits.count_range(165, 200)).to eq(answer)
      end
    end

    context "with 8028, 8033" do
      it "returns 1" do
        uri = URI("#{BINDI_VERIFY_URL}?a=#{8028}&b=#{8033}")
        answer = Net::HTTP.get(uri).to_i
        expect(PerfectBits.count_range(8028, 8033)).to eq(answer)
      end
    end

    context "weird bug" do
      context "with 1180744, 1217633" do
        it "returns 7596" do
          expect(PerfectBits.count_range(1180744, 1217633)).to eq(7596)
        end
      end

      context "with 1176463, 1425984" do
        it "returns 39475" do
          expect(PerfectBits.count_range(1176463, 1425984)).to eq(39475)
        end
      end

      context "with 1225970, 1332494" do
        it "returns 15706" do
          expect(PerfectBits.count_range(1225970, 1332494)).to eq(15706)
        end
      end

      context "with 1802060, 2123192" do
        it "returns 35424" do
          expect(PerfectBits.count_range(1802060, 2123192)).to eq(35424)
        end
      end

    end

    context "1293214, 1534210" do
      it "returns 33368" do
        expect(PerfectBits.count_range(1293214, 1534210)).to eq(33368)
      end
    end

    context "1835586, 2160689" do
      it "returns 40338" do
        expect(PerfectBits.count_range(1835586, 2160689)).to eq(40338)
      end
    end

    context "with 1645098712823793798, 14889998042940624528" do
      it "returns 1070002673201129717" do
        uri = URI("#{BINDI_VERIFY_URL}?a=1645098712823793798&b=14889998042940624528")
        answer = Net::HTTP.get(uri).to_i
        #This takes forever...cause it's a lot of numbers!!
        expect(PerfectBits.count_range(1645098712823793798, 14889998042940624528)).to eq(answer)
      end
    end

    threads = []
    50.times do
      threads << Thread.new do
        base = rand(1_000..3_000_000)
        finish = rand(base..(base + rand(1_000_000)))

        uri = URI("#{BINDI_VERIFY_URL}?a=#{base}&b=#{finish}")
        answer = Net::HTTP.get(uri).to_i

        it "returns #{answer} when passed #{base}, #{finish}" do
          expect(PerfectBits.count_range(base, finish)).to eq(answer)
        end
      end
    end

    threads.each(&:join)
  end
end
