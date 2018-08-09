RSpec.describe Jisa do
  it "has a version number" do
    expect(Jisa::VERSION).not_to be nil
  end
  
  describe "jisa Module test" do
    before do
      @base = Time.now
    end

    it "when seconds" do
      expect(Jisa.get_string(@base - 1, @base)).to eq "1秒前"
      expect(Jisa.get_string(@base - 59, @base)).to eq "59秒前"
    end

    it "when minites" do
      expect(Jisa.get_string(@base - 60, @base)).to eq "1分前"
      expect(Jisa.get_string(@base - 60 * 60 + 1, @base)).to eq "59分前"
    end
    
    it "when hours" do
      expect(Jisa.get_string(@base - 60 * 60, @base)).to eq "1時間前"
      expect(Jisa.get_string(@base - 60 * 60 * 24 + 1, @base)).to eq "23時間前"
    end

    it "when days" do
      expect(Jisa.get_string(@base - 60 * 60 * 24, @base)).to eq "1日前"
      expect(Jisa.get_string(@base - 60 * 60 * 24 * 7 + 1, @base)).to eq "6日前"
    end

    it "when weeks" do
      expect(Jisa.get_string(@base - 60 * 60 * 24 * 7, @base)).to eq "1週間前"
      expect(Jisa.get_string(@base - 60 * 60 * 24 * 7 * 4 + 1, @base)).to eq "3週間前"
    end

    it "when months" do
      expect(Jisa.get_string(@base - 60 * 60 * 24 * 7 * 4, @base)).to eq "1ヶ月前"
      expect(Jisa.get_string(@base - 60 * 60 * 24 * 7 * 4 * 12 + 1, @base)).to eq "11ヶ月前"
    end

    it "when years" do
      expect(Jisa.get_string(@base - 60 * 60 * 24 * 7 * 4 * 12, @base)).to eq "1年以上前"
    end

    it "when ArgumentError" do 
      expect { Jisa.get_string(@base, @base - 1) }.to raise_error(ArgumentError, "比較できない値です。")
    end

    it "when real Date" do
      expect(Jisa.get_string(Time.local(2018, 7, 25, 11, 59, 58), Time.local(2018, 7, 25, 12, 0, 0))).to eq "2秒前"
      expect(Jisa.get_string(Time.local(2018, 7, 25, 11, 59, 0), Time.local(2018, 7, 25, 12, 0, 0))).to eq "1分前"
      expect(Jisa.get_string(Time.local(2018, 7, 25, 0, 0, 0), Time.local(2018, 7, 25, 12, 0, 0))).to eq "12時間前"
      expect(Jisa.get_string(Time.local(2018, 7, 10, 12, 0, 0), Time.local(2018, 7, 25, 12, 0, 0))).to eq "2週間前"
      expect(Jisa.get_string(Time.local(2018, 6, 25, 12, 0, 0), Time.local(2018, 7, 25, 12, 0, 0))).to eq "1ヶ月前"
      expect(Jisa.get_string(Time.local(2010, 6, 25, 12, 0, 0), Time.local(2018, 7, 25, 12, 0, 0))).to eq "8年以上前"
    end
  end
end
