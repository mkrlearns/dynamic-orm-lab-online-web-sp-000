require_relative "../config/environment.rb"
require 'active_support/inflector'

class InteractiveRecord

  def self.table_name() self.to_s.downcase.pluralize end

  def self.column_names
    column_names = []
    DB[:conn].results_as_hash = true
    DB[:conn].execute("PRAGMA table_info('#{table_name}')").each do |row|
      column_names << row["name"]
    end
    column_names.compact
  end

  def initialize(options={})
    options.each { |property, value| self.send("#{property}=", value) }
  end

end
