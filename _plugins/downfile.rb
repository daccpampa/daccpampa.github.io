module Jekyll
  class DownfileTag < Liquid::Tag
    def initialize(tag_name, args, tokens)
      super
      @args = ArgParser.parse_tag_arguments(args)
      if @args.length != 2
        raise ArgumentError, 'downfile tag must have exactly two arguments'
      end
      @link_text = @args[0]
      @file_link = @args[1]
    end

    def render(context)
      file_extension = File.extname(@file_link).downcase
      icon_class = case file_extension
                   when '.pdf'
                     'icon-file-pdf'
                   when '.doc', '.docx', '.odt', '.rtf'
                     'icon-file-word'
                   when '.xls', '.xlsx', '.ods', '.csv'
                     'icon-file-excel'
                   when '.ppt', '.pptx', '.odp'
                     'icon-file-powerpoint'
                   when '.zip', '.rar', '.7z', '.tar', '.gz', '.bz2', '.xz', '.iso'
                     'icon-file-archive'
                   when '.jpg', '.jpeg', '.png', '.gif', '.bmp', '.svg', '.ico', '.tif', '.tiff', '.webp', '.psd', '.ai', '.eps', '.indd', '.raw', '.sketch', '.xcf', '.cdr', '.dxf', '.dwg', '.ps', '.pdd', '.pcx'
                     'icon-file-image'
                   when '.mp3', '.ogg', '.wav', '.flac', '.aac', '.wma', '.m4a', '.aiff', '.ape', '.alac', '.opus', '.mid', '.midi'
                     'icon-file-audio'
                   when '.mp4', '.mkv', '.avi', '.mov', '.wmv', '.flv', '.f4v', '.m4v', '.rmvb', '.rm', '.3gp', '.3g2', '.asf', '.webm', '.mpg', '.mpeg', '.m2v', '.vob'
                     'icon-file-video'
                   when '.txt', '.md', '.markdown', '.rst', '.adoc', '.org', '.tex', '.rtf', '.epub', '.mobi'
                     'icon-file-text'
                   when '.html', '.htm', '.xml', '.css', '.js', '.json', '.yaml', '.yml', '.toml', '.ini', '.conf', '.cfg', '.sh', '.bat', '.cmd', '.ps1', '.vbs', '.lua', '.java', '.c', '.cpp', '.h', '.hpp', '.cs', '.go', '.php', '.py', '.rb', '.pl', '.swift', '.scala', '.groovy', '.ts', '.tsx', '.jsx', '.coffee', '.less', '.sass', '.scss', '.styl', '.ejs', '.jade', '.pug', '.hbs', '.handlebars', '.twig', '.liquid', '.mustache', '.jinja2', '.rhtml', '.asp', '.aspx', '.jsp', '.cfm', '.yaws', '.cshtml', '.vbhtml', '.erb', '.dust', '.ejs', '.r', '.rmd', '.dart', '.haxe', '.elm', '.purs', '.ml', '.mli', '.fs', '.fsi', '.fsscript', '.fsx', '.fsharp', '.kt', '.kts', '.clj', '.cljs', '.gvy', '.gy', '.gsh', '.java', '.pl', '.pm', '.t', '.pod', '.php3', '.php4', '.php5', '.phps', '.phtml', '.ctp', '.module', '.inc', '.theme', '.sql', '.sqlite', '.sqlite3', '.db', '.db3', '.mdb', '.accdb', '.dbf', '.mssql', '.mysql', '.pgsql', '.postgres', '.oracle', '.oci8', '.odbc', '.db2', '.informix', '.firebird', '.sybase', '.sas'
                     'icon-file-code'
                   else
                     'icon-doc'
                   end

      "<div class=\"downfile\"><i class=\"#{icon_class}\"></i> Baixar <a href=\"#{@file_link}\">#{@link_text}</a></div>"
    end
  end
end

Liquid::Template.register_tag('downfile', Jekyll::DownfileTag)
