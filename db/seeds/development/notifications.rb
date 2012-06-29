# coding: utf-8
0.upto(9) do |idx|
  Notification.create(
    title: "おしらせ #{idx}",
    body: "23.3の時にあったパッチをチェックしてみると，24.1ではフルスクリーン以外は\nすでに直っているようなので， フルスクリーン対応のパッチだけを当てる\n (ということはフルスクリーン対応しなければパッチは当てなくてもいい?)． パッチは23.3のものを参考に24.1向けに用意してみた",
    released_at: 2.days.ago.advance(days: -idx),
    expired_at: 2.days.ago.advance(days: idx),
  )
end
