# coding: utf-8
fnames = ["佐藤", "鈴木", "高橋", "田中"]
gnames = ["太郎", "次郎", "花子　"]
fnames_kana = ["サトウ", "スズキ", "タカハシ", "タナカ"]
gnames_kana = ["タロウ", "ジロウ", "ハナコ"]

0.upto(9) do |idx|
  Partner.create(
    name: "#{fnames[idx % 4]} #{gnames[idx % 3]}",
    name_kana: "#{fnames_kana[idx % 4]} #{gnames_kana[idx % 3]}",
    address: "山形県 ナンジャス",
    email: "test#{idx}@a.com",
    phone_number1: "090-1111-0000",
    phone_number2: "090-2222-0000",
    fax_number: "03-3333-0000",
    password: "password",
    password_confirmation: "password"
  )
end
