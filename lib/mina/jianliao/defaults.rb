# Required
set_default :jianliao_url,       -> { ENV['JIANLIAO_URL'] }

# Optional
set :jianliao_application,    -> { ENV['JIANLIAO_APPLICATION'] || 'application' }
set_default :jianliao_authorName,    -> { ENV['JIANLIAO_AUTHORNAME'] || 'deploybot' }
# Git
set_default :deployer,          -> { ENV['GIT_AUTHOR_NAME'] || %x[git config user.name].chomp }
set_default :deployed_revision, -> { ENV['GIT_COMMIT'] || %x[git rev-parse #{branch}].strip }