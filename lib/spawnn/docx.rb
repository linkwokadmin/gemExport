require 'active_support/all'
require 'caracal'

class Spawnn::DOCX < Caracal::Document
    def initialize(options = {})
        super options[:file_name]

        page_margins do
            left    1000
            right   800
            top     800
            bottom  800
        end

        page_numbers true do
            align :right
        end

        render_header
        render_title

        render_body
    end

    def render_header
    end

    def render_title
        h1 'Title'
        h3 'Subtitle'
    end

    def render_body
        p do
            text 'Here is a sentence with a '
            link 'link', 'https://www.example.com'
            text ' to something awesome', font: 'Courier New', color: '555555', size: 32, bold: true, italic: true, underline: true, bgcolor: 'cccccc'
            text '.'
            br
            text 'This text follows a line break.'
        end
    end
end
