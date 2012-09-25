# coding: utf-8
0.upto(9) do |idx|
  Admin::FaqCategory.create(
    name: "FAQ カテゴリー [ #{idx} ]"
  )
end
