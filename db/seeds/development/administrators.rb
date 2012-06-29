# coding: utf-8
fnames = ["ic-佐藤", "ic-鈴木", "ic-高橋", "ic-田中"]
gnames = ["太郎", "次郎", "花子　"]

0.upto(9) do |idx|
  Administrator.create(
    name: "#{fnames[idx % 4]} #{gnames[idx % 3]}",
    email: "ic-test#{idx}@a.com",
    password: "password",
    password_confirmation: "password"
  )
end
