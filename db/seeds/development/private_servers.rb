# coding: utf-8
0.upto(9) do |idx|
  partner_id = idx + 1
  partner = Partner.find_by_id(partner_id)
  0.upto(9) do |x|
    PrivateServer.create(
      { partner_id: partner.id,
      name: "partner_#{partner_id}_server no.#{x + 1}",
      released_at: 2.days.ago.advance(days: -x),
      expired_at: 2.days.ago.advance(days: x),
      memo: "バーチャル・プライベート・サーバ（英語：virtual private server、略称：VPS）とは、一台のサーバ上で仮想サーバを何台も起動する特殊なソフトウェア、またそのような仮想サーバを提供するレンタルサーバのサービスをいう。"
      }
    )
  end
end