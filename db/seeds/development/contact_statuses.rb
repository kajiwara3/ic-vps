# coding: utf-8
0.upto(3) do |idx|
  case idx
  when 0
    $status_name = "未対応"
  when 1
    $status_name = "対応中"
  when 2
    $status_name = "完了"
  when 3
    $status_name = "保留"
  end
  ContactStatus.create(
    name: $status_name
  )
end
def get_status_name idx

end
