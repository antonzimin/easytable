require 'easytable/view_helpers'

module Easytable
  module ActionView

    def render_table_for(table_header: [], columns: [], **opts)
      if columns.is_a?(ActiveRecord::Relation)
        columns = columns.map { |record| record.to_array_by_keys(table_header) }
        table_header = table_header.map!(&:to_s).map!(&:humanize)
      end
      table_class = opts[:class] || :'easy-table'
      content_tag(:table, id: opts[:id], class: table_class) {
        thead(table_header).concat(tbody(columns))
      }
    end

    ::ActionView::Base.send :include, self

    private

    def thead(table_header)
      content_tag :thead do
        content_tag :tr do
          table_header.collect { |title| concat content_tag(:th, title) }.join()
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
