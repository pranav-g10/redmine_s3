module RedmineS3
  module ApplicationHelperPatchV2
    unloadable # Send unloadable so it will not be unloaded in development

    def thumbnail_tag(attachment)
      link_to image_tag(attachment.thumbnail_s3, data: {thumbnail: thumbnail_path(attachment)}),
        RedmineS3::Connection.object_url(attachment.disk_filename_s3),
        title: attachment.filename
    end
  end
end
