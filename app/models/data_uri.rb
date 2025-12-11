require "base64"

class DataURI
  def self.convert(uploaded_file)
    file_data = uploaded_file.read
    encoded = Base64.strict_encode64(file_data)
    mime_type = uploaded_file.content_type

    return "data:#{mime_type};base64,#{encoded}"
  end
end
