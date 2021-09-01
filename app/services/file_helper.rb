module FileHelper
  def read_file(*path)
    File.read(Rails.root.join(*path))
  end
end
