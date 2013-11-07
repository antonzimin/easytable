Gem add the ability quickly create table <code>render_table_for</code>.
Using in your helpers or views.

== Installation

1 Add this line to your application's Gemfile:

    gem 'easytable'

2 And then execute:

    $ bundle

== When to use it

If you too lazy to work with content tags or you hate a lot of html in your views, you can use just one line to generate simple table.

== Usage Examples

    render_table_for(columns: [['Bob', 'bob@email.com'], ['Ben', 'ben@email.com']])
    
or

    render_table_for(header: ['First name', 'Last name'], columns: @columns)
    
or

    render_table_for(header: [:id, :email], columns: User.last(10))

or

    render_table_for(columns: User.last(10))
    
Also you can specify table class name and id, using <code>class</code> and <code>id</code>:

    render_table_for(header: [], columns: [], class: 'custom-class', id: 'table_id')

default class name is <code>easy-table</code>

== Contributing

1. Fork it
2. Create your feature branch (<code>git checkout -b my-new-feature</code>)
3. Commit your changes (<code>git commit -am 'Added some feature'</code>)
4. Push to the branch (<code>git push origin my-new-feature</code>)
5. Create new Pull Request
