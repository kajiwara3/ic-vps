# coding: utf-8
0.upto(9) do |idx|
  0.upto(9) do |j|
    Contact.create(
      partner_id: idx + 1,
      subject: "お問い合わせ [#{idx} - #{j}]",
      body: "［4G／LTEスマホ家族キャンペーン］申し込むとiPhone 4とiPhone 5の毎月の支払い金額はいくらぐらいになりますか？",
      contact_status_id: j % 4 + 1
    )
  end
end
