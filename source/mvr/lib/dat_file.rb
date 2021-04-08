# frozen_string_literal: true

class DatFile
  delegate :close, to: :file

  def initialize(path, keys)
    @path = path
    @keys = keys
    @mode = 'w'
    write_header
  end

  def write_object(object)
    values = keys.map { |key| object.public_send(key) }
    write("#{values.join("\t")}\n").tap do
      @mode = 'a'
      close
      @file = nil
    end
  end

  private

  attr_accessor :path, :keys, :mode
  delegate :write, to: :file

  def write_header
    write("##{keys.join("\t")}\n")
  end

  def file
    @file ||= File.open(path, mode)
  end
end
