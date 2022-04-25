# frozen_string_literal: true

D = Steep::Diagnostic

target :lib do
  signature 'sig'

  # check 'app' # Directory name
  check "app/models"
  #   check "Gemfile"                   # File name
  #   check "app/models/**/*.rb"        # Glob
  #   # ignore "lib/templates/*.rb"
  #
  library "uri"       # Standard libraries

  configure_code_diagnostics do |config|
    config[D::Ruby::MethodDefinitionMissing] = :hint
    config[D::Ruby::ElseOnExhaustiveCase] = :hint
    config[D::Ruby::FallbackAny] = :hint
  end

  # repo_path "gem_rbs/gems"

  library 'pathname'
  library 'logger'
  library 'mutex_m'
  library 'date'

  library 'activesupport'
  library 'actionpack'
  library 'activejob'
  library 'activemodel'
  library 'actionview'
  library 'activerecord'
  library 'railties'
end

# target :test do
#   signature "sig", "sig-private"
#
#   check "test"
#
#   # library "pathname", "set"       # Standard libraries
# end
