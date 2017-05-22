class Spawnn::It::From
    attr_accessor :logo_path, :title, :subtitle, :paragraphs

    def initialize(options = {})
        @logo_path = options[:logo_path] || nil
        @title = options[:title] || nil
        @subtitle = options[:subtitle] || nil
        @paragraphs = options[:paragraphs] || []
    end

    def add_paragraph(paragraph)
        @paragraphs << paragraph
    end

    class Paragraph
        attr_accessor :heading, :body

        def initialize(options = {})
            @heading = options[:heading] || nil
            @body = options[:body] || nil
        end
    end
end
