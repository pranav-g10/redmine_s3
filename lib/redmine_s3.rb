require 'redmine_s3/attachment_patch'
require 'redmine_s3/attachments_controller_patch'
require 'redmine_s3/thumbnail_patch'
require 'redmine_s3/connection'

AttachmentsController.send(:include, RedmineS3::AttachmentsControllerPatch)
Attachment.send(:include, RedmineS3::AttachmentPatch)

if Rails::VERSION::MAJOR >= 5
  require 'redmine_s3/application_helper_patch_v2'
  ApplicationHelper.send(:prepend, RedmineS3::ApplicationHelperPatchV2)
else
  require 'redmine_s3/application_helper_patch'
  ApplicationHelper.send(:include, RedmineS3::ApplicationHelperPatch)
end
RedmineS3::Connection.create_bucket
