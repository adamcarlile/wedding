class AddEvents < ActiveRecord::Migration[5.2]
  def change
    [
      { name: 'Wedding Day', code: 'wedding' },
      { name: 'Thursday', code: 'thursday' }
    ].each {|x| Event.create(name: x[:name], code: x[:code])}
  end
end
