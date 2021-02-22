# frozen_string_literal: true

module Utilites
  # File Generator
  class FileGenerator
    def initialize(attributes)
      @attributes = attributes
    end

    def execute
      Upload.with_session do |s|
        s.start_transaction
        Upload.create!(singleized_params)
        s.commit_transaction
      rescue Mongo::Error => e
        raise e.message unless e.label?(Mongo::Error::UNKNOWN_TRANSACTION_COMMIT_RESULT_LABEL)

        retry
      end
    end

    private

    def singleized_params
      files = [@attributes[:mp4_files], @attributes[:mix_files], @attributes[:image]].flatten
      upload_params = []
      files.each do |file|
        upload_params << { file: file }
      end
      raise 'Please select at least one file.'

      upload_params
    end
  end
end
