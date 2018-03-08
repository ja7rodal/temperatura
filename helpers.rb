module Helpers

  @@valid_attr = {
  img: [:alt, :id, :class, :width],
  div: [:id, :class],
  a: [:id, :class, :target],
  br: [],
  span: [:id, :class ]
}

  def clear_attributes(tag, attrs)
    attrs.keep_if {|k,v|  @@valid_attr[tag].include?(k) } 
  end

  def image_tag(src, **attr)
    attrs_valid = clear_attributes(:img, attr) 
    attr_tag = attrs_valid.map {|key,value| "#{key}= '#{value}' "}.join
    "<img src='#{src}' #{attr_tag}>"
  end

  def link_to(href, hiperlink, **attr)
    attrs_valid = clear_attributes(:a, attr)
    attr_tag = attrs_valid.map {|key,value| "#{key}= '#{value}' "}.join
    "<a  href='#{href}' #{attr_tag}>#{hiperlink}</a>  "
  end

  def content_tag(tag, content, **attr)
    attrs_valid = clear_attributes(tag, attr)
    attr_tag = attrs_valid.map {|key,value| "#{key}= '#{value}' "}.join
    "<#{tag} #{attr_tag}>#{content}</#{tag}>  "
  end

end

Sinatra::Application.helpers Helpers

