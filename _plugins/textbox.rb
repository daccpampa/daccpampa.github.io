module Jekyll
  class TextboxTag < Liquid::Block
    def initialize(tag_name, markup, tokens)
      super
      @args = markup[0..-1] || ''
      @box_type = 'default'
      if @args != :NilClass
        @args = @args.strip.split(',')
        if @args.length > 0
          @box_type = @args[0].strip.gsub(/^["']|["']$/, '')
        end
      end
    end

    def render(context)
      content = super
      case @box_type
      when 'quote'
        if @args.length > 1
          author = @args[1].strip.gsub(/^["']|["']$/, '')
          "<div class=\"textbox quote\"><i class=\"quote-left icon-quote-left\"></i> #{content} <i class=\"quote-right icon-quote-right\"></i><p class=\"quote-author\">&#8212; #{author}</p></div>"
        else
          "<div class=\"textbox quote\"><i class=\"quote-left icon-quote-left\"></i> #{content} <i class=\"quote-right icon-quote-right\"></i></div>"
        end
      when 'info'
        if @args.length > 1
          title = @args[1].strip.gsub(/^["']|["']$/, '')
          "<div class=\"textbox info\"><i class=\"icon-info-2\"></i> <strong>#{title}</strong> #{content}</div>"
        else
          "<div class=\"textbox info\"><i class=\"icon-info-2\"></i> #{content}</div>"
        end
      when 'warning'
        if @args.length > 1
          title = @args[1].strip.gsub(/^["']|["']$/, '')
          "<div class=\"textbox warning\"><i class=\"icon-warning-empty\"></i> <strong>#{title}</strong> #{content}</div>"
        else
          "<div class=\"textbox warning\"><i class=\"icon-warning-empty\"></i> #{content}</div>"
        end
      when 'question'
        if @args.length > 1
          title = @args[1].strip.gsub(/^["']|["']$/, '')
          "<div class=\"textbox question\"><i class=\"icon-help\"></i> <strong>#{title}</strong> #{content}</div>"
        else
          "<div class=\"textbox question\"><i class=\"icon-help\"></i> #{content}</div>"
        end
      else
        "<div class=\"textbox\">#{content}</div>"
      end
    end
  end
end

Liquid::Template.register_tag('textbox', Jekyll::TextboxTag)
