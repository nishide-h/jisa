require "jisa/version"

module Jisa
  def self.get_string(update_at, now_at = Time.now)
    sa = update_at - now_at

    if (sa >= 60 * 60 * 24 * 7 * 4 * 12)
      "#{ (sa / 60 / 60 / 24 / 7 / 4 / 12).to_i }年以上前"
    elsif (sa >= 60 * 60 * 24 * 7 * 4)
      "#{ (sa / 60 / 60 / 24 / 7 / 4).to_i }ヶ月前"
    elsif (sa >= 60 * 60 * 24 * 7)
      "#{ (sa / 60 / 60 / 24 / 7).to_i }週間前"
    elsif (sa >= 60 * 60 * 24)
      "#{ (sa / 60 / 60 / 24).to_i }日前"
    elsif sa >= 60 * 60
      "#{ (sa / 60 / 60).to_i }時間前"
    elsif  sa >= 60
      "#{ (sa / 60).to_i }分前"
    elsif sa > 0
      "#{ sa.to_i }秒前"
    else
      raise ArgumentError, "比較できない値です。"
    end
  end
end
