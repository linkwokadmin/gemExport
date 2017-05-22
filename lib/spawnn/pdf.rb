require 'active_support/all'
require 'prawn'
require 'pdfkit'

class Spawnn::PDF < Prawn::Document
    def initialize(options = {})
        super page_size: 'A4',
              page_layout: :portrait,
              margin: [50, 40, 40, 40] # [top, right, bottom. left] in Points

        @data = options[:data] || Spawnn::It::From.new(title: 'Sample', subtitle: 'Demo Document')
        @view = options[:view]

        render_header
        render_title

        if @data.paragraphs.any?
            @data.paragraphs.each do |paragraph|
                render_body paragraph
            end
        end

        number_pages 'Page: <page>', at: [bounds.right - 150, 0],
                                     width: 150,
                                     align: :right,
                                     page_filter: :all,
                                     start_count_at: 1
    end

    def render_header
        draw_text "Exported at: #{DateTime.now.strftime('%d/%m/%Y %H:%M:%S')}", at: [0, 770]
    end

    def render_title
        if @data.logo_path.present?
            move_down 10
            image @data.logo_path, width: 150, position: :center
        end
        if @data.title.present?
            move_down 10
            formatted_text [{ text: @data.title, styles: [:bold] }], align: :center, size: 22
        end
        if @data.subtitle.present?
            move_down 10
            formatted_text [{ text: @data.subtitle, styles: [:bold] }], align: :center, size: 18
        end
    end

    def render_body(paragraph)
        if paragraph.heading.present?
            move_down 10
            formatted_text [{ text: paragraph.heading, styles: [:bold] }], size: 14
        end
        if paragraph.body.present?
            move_down 5
            formatted_text [{ text: paragraph.body }], size: 12
        end
    end

    def self.fromHTML(html, page_size = 'A4')
        PDFKit.new(html, page_size: page_size).to_pdf
    end
end
