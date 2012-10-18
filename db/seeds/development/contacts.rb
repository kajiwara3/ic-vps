# coding: utf-8
0.upto(9) do |idx|
  Contact.create(
    partner_id: idx + 1,
    subject: "お問い合わせ [#{idx}]",
    body: "［4G／LTEスマホ家族キャンペーン］申し込むとiPhone 4とiPhone 5の毎月の支払い金額はいくらぐらいになりますか？",
    cantact_status_id: idx % 4 + 1
  )
end
