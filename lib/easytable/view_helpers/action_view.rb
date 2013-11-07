require 'easytable/view_helpers'

module Easytable
  module ActionView

    def render_table_for(header: [], columns: [], **opts)
      header, columns = modify_data_for(header, columns) if columns.is_a?(ActiveRecord::Relation)
      table_class = opts[:class] || :'easy-table'
      content_tag(:table, id: opts[:id], class: table_class) {
        thead(header).concat(tbody(columns))
      }
    end

    ::ActionView::Base.send :include, self

    private

    def modify_data_for(header, columns)
      table_header = valid_header_keys(header: header, record: columns.first)
      columns = columns.map { |record| record.to_array_by_keys(table_header) }
      table_header.map!(&:humanize)
      [table_header, columns]
    end

    def valid_header_keys(header: [], record: nil)
      record_keys = record.respond_to?(:attributes) ? record.attributes.keys : header
      valid_keys = header.map { |key| key.to_s.downcase } & record_keys
      valid_keys.any? ? valid_keys : record_keys
    end

    def thead(header)
      content_tag :thead do
        content_tag :tr do
          header.collect { |title| concat content_tag(:th, title) }.join()
        end
      end
    end

    def tbody(columns)
      content_tag :tbody do
        if columns.any?
          columns.collect { |line|
            content_tag :tr do
              line.collect { |value| concat content_tag(:td, value) }.to_s.html_safe
            end
          }.join().html_safe
        else
          content_tag :td, colspan: 999 do
            'No records found'
          end.html_safe
        end
      end
    end

  end
end
