# frozen_string_literal: true

D = Steep::Diagnostic

target :lib do
  signature 'sig'
  check 'app/models'

  configure_code_diagnostics do |config|
    config[D::Ruby::MethodDefinitionMissing] = :hint
    config[D::Ruby::ElseOnExhaustiveCase] = :hint
    config[D::Ruby::FallbackAny] = :hint
  end

  library 'uri'
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
