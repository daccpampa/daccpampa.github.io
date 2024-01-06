require 'strscan'

module ArgParser
  def parse_tag_arguments(markup)
    # This is a very simple argument parser. It only supports
    # arguments that are either bare words or quoted strings.
    # Commas are treated as argument separators, unless they
    # are inside quotes. There is no escaping.

    arguments = StringScanner.new(markup.to_s.strip)
    args = []
    while !arguments.eos?
      args << arguments.scan(/(?:[^,"']|"[^"]*"|'[^']*')+/)
      arguments.skip(/\s*,\s*/)
    end
    args.map { |arg| arg.gsub(/\A['"]|['"]\Z/, '') }
  end

  module_function :parse_tag_arguments
end
