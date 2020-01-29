require_relative "../config/environment.rb"
require 'active_support/inflector'

class InteractiveRecord

  def self.table_name() self.to_s.downcase.pluralize end

  def self.column_names
    columns = []
    DB[:conn].results_as_hash = true
    DB[:conn].execute("PRAGMA table_info('#{table_name}')").each do |column|
      columns << column["name"]
    end
    columns.compact
  end

end
