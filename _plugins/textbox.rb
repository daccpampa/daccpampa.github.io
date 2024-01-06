module Jekyll
  class TextboxTag < Liquid::Block
    def initialize(tag_name, markup, tokens)
      super
      @args = ArgParser.parse_tag_arguments(markup)
      @box_type = @args.length > 0 ? @args[0] : 'default'
    end

    def render(context)
      content = super
      pre_content = ''
      post_content = ''

      case @box_type
      when 'quote'
        pre_content = "<i class=\"quote-left icon-quote-left\"></i> "
        post_content = " <i class=\"quote-right icon-quote-right\"></i>"
        if @args.length > 1
          post_content.concat("<p class=\"quote-author\">&#8212; #{@args[1]}</p>")
        end
      when 'info', 'warning', 'question', 'cancel', 'ok'
        icon = case @box_type
               when 'info'
                 'icon-info-2'
               when 'warning'
                 'icon-warning-empty'
               when 'question'
                 'icon-chat-empty'
               when 'cancel'
                 'icon-cancel-1'
               when 'ok'
                 'icon-ok-1'
               end
        pre_content = "<i class=\"#{icon}\"></i> "
        if @args.length > 1
          pre_content.concat("<strong>#{@args[1]}</strong> ")
        end
      end

      "<div class=\"textbox #{@box_type}\">#{pre_content}#{content}#{post_content}</div>"
    end
  end
end

Liquid::Template.register_tag('textbox', Jekyll::TextboxTag)
