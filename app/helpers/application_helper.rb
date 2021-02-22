module ApplicationHelper

  def preview_or_default_image_for_file(object)
    case File.extname(object.file.path).downcase
    when '.csv' then 'CSV.png'
    when '.pdf' then 'PDF.png'
    when '.doc', '.docx' then 'DOC.png'
    else
      'nophoto.jpg'
    end
  end
end
