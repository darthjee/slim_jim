class DatFile
  delegate :close, to: :file

  def initialize(path, keys)
    @path = path
    @keys = keys
    @mode = "w"
    write_header
  end

  def write(object)
    values = keys.map { |key| object.public_send(key) }
    file.write("#{values.join("\t")}\n").tap do
      @mode = "a"
      close
      @file = nil
    end
  end

  private

  attr_accessor :path, :keys, :mode

  def write_header
    file.write("##{keys.join("\t")}\n")
  end

  def file
    @file ||= File.open(path, mode)
  end
end
