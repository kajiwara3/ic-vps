module ApplicationHelper
  # リンクが現在のページであるときは、ハイパーリンクを無効にした文字列を返します。
  def menu_link_to(text, path)
    link_to_unless_current(text, path) { content_tag(:span, text) }
  end
end
