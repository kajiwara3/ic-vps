FactoryGirl.define do
  factry :partner do
    sequence(:name) { |n| "Taro#{n}" }
    sequence(:name_kana) { |n| "Yamada Taro#{n}" }
    sequence(:address) { |n| "寒河江#{n}" }
  end
end