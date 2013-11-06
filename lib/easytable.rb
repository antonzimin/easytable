if defined? ActiveRecord::Base
  require 'easytable/active_record'
end

if defined? ActionView::Base
  require 'easytable/view_helpers/action_view'
end
