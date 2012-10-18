# coding: utf-8
0.upto(3) do |idx|
  ContactStatus.create(
    name: "ステータス [ #{idx + 1} ]"
  )
end
