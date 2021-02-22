json.extract! upload, :id, :mix_files, :image, :mp4_file, :created_at, :updated_at
json.url upload_url(upload, format: :json)
