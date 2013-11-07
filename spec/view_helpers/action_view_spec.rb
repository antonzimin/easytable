require 'spec_helper'

include ActionView::Helpers
include ActionView::Context
include Easytable::ActionView

describe Easytable::ActionView do
  describe 'Empty table' do

    let(:header) { [] }
    let(:columns) { [] }
    subject { render_table_for(header: header, columns: columns) }

    it 'should render table tag' do
      expect(subject).to include('table', '/table')
    end

    it 'should render empty header' do
      expect(subject).to include('<thead><tr></tr></thead>')
    end

    it 'should render empty body' do
      expect(subject).to include('No records found')
    end
  end

  describe 'Table with header' do
    let(:header) { ['Title', 'Description'] }
    let(:columns) { [] }
    subject { render_table_for(header: header, columns: columns) }

    it 'should render header data' do
      expect(subject).to include('<thead><tr><th>Title</th><th>Description</th></tr></thead>')
    end
  end

  describe 'Table with columns' do
    let(:header) { [] }
    let(:columns) { [[1, 'first line'], [2, 'second line']] }
    subject { render_table_for(header: header, columns: columns) }

    it 'should render columns data' do
      expect(subject).to include('<tbody><tr><td>1</td><td>first line</td></tr><tr><td>2</td><td>second line</td></tr></tbody>')
    end
  end

  describe 'Private methods' do
    describe '#thead' do
      subject { self.send(:thead, []) }

      it 'should render header only' do
        expect(subject).to start_with('<thead>')
        expect(subject).to end_with('</thead>')
        expect(subject).to include('<tr></tr>')
      end
    end

    describe '#tbody' do
      subject { self.send(:tbody, []) }

      it 'should render table body only' do
        expect(subject).to start_with('<tbody>')
        expect(subject).to end_with('</tbody>')
        expect(subject).to include('No records found')
      end
    end
  end
end
